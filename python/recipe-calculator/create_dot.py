import yaml
import argparse

parser = argparse.ArgumentParser(description='Process some integers.')
parser.add_argument('items', metavar='ITEM', type=str, nargs='*', default=[],
                    help='what items out output the dot graph for')
parser.add_argument('--file', default="recipes.yaml",
                    help='file name to use for recipe list')
parser.add_argument('--output', default="graph.dot",
                    help='file name to output dot file into')

args = parser.parse_args()

with open(args.file) as f:
    doc = yaml.safe_load(f.read()) #type: dict

dot_graphs = [] #type: list[str]
made_in_list = {} #type: dict[str,list[str]]
nodes = [] #type: list[str]
edges = [] #type: list[list[str]]

def create_made_in_node(item:str, made_in:str):
    return f"{item}_{made_in}"

def generate_nodes(doc:dict[str,dict]):
    for item, vals in doc.items():
        made_in = vals.get("made_in")
        if made_in:
            production_class = vals.get("production_class", "none")
            made_in_with_product = f"{made_in}_class_{production_class}"
            if made_in_with_product not in made_in_list:
                made_in_list[made_in_with_product] = []
            made_in_list[made_in_with_product].append([item, made_in])
        nodes.append(item)
        ingredients = vals.get("ingredients", [])
        for ingredient in ingredients:
            if ingredient not in nodes:
                nodes.append(ingredient)

def render_nodes():
    for node in nodes:
        yield f"{node} [color=turquoise];"
    yield ""
    for made_in, items in made_in_list.items():
        yield f"node[label=\"build_in_{made_in}\"];"
        for item in items:
            yield create_made_in_node(item[0], item[1]) + ";"
        yield ""

def create_graph_for_item(item, vals):
    if not vals:
        return ()
    made_in = vals.get("made_in")
    if not made_in:
        return () # if there is no associated made_in don't generate an item
    dag = []
    ingredients = vals.get("ingredients", {}) #type: map[str,int]
    dag.append("{%s}" % (",".join(ingredients)))
    dag.append(create_made_in_node(item, made_in))
    dag.append(item)
    return (dag, ingredients)
    
def list_diff(list1, list2):
    diff = []
    for list_item in list1:
        if list_item not in list2:
            diff.append(list_item)
    return diff

def create_graph_for_items(itemids:list[str], all_items=[]):
    dags = []
    for item in itemids:
        if item in all_items:
            continue
        if item not in doc:
            continue
        dag, ingredients = create_graph_for_item(item, doc[item])
        dags.append(" -> ".join(dag) + ";")
        all_items.append(item)
        if len(ingredients.keys()) > 0:
            ingredient_dags, items_for_ingredients = create_graph_for_items(list(ingredients.keys()), all_items)
            dags += ingredient_dags
    return (dags, all_items)
    
dags = []
if len(args.items) == 0:
    for item, values in doc.items():
        dags.append(" -> ".join(create_graph_for_item(item, values)[0]) + f";")
else:
    items_to_parse = set(args.items)
    items_in_doc = set(doc.keys())
    list_differences = list_diff(items_to_parse, items_in_doc)
    if len(list_differences) > 0:
        raise argparse.ArgumentError(f"invalid items passed {','.join(list_differences)}")
    dags, all_items = create_graph_for_items(items_to_parse)
    all_items = set(all_items)
    for doc_item in items_in_doc:
        if doc_item not in all_items:
            doc.pop(doc_item, None)


generate_nodes(doc)
with open(args.output, "w") as output_file:
    output_file.write("digraph simple {\n")
    for item in render_nodes():
        output_file.write(item + "\n")
    for dag in dags:
        output_file.write(dag + "\n")
    output_file.write("}")
print(f"wrote dag to {args.output}")


