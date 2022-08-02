inventory-monitor
=================

This is a basic inventory monitor that will show the item name, quantity, and optionally the amount changed in the last 5 minutes (configurable). Order of linking doesn't matter. 

Can be linked to an abitrary number of screens and containers. Screens and containers can be linked in any order. currently only a single databank is supported.

See update interval got-yas for details when you have multiple containers linked

Requires a databank for showing amount changed (to make it survive restarts of the script)

# Parameters

|Name|Description|Default|
|----|-----------|-------|
| rows_per_screen | how many rows to put in a screen | `25` |
| item_targets_json | json array of item display name -> target qty. which match on the item name first, then display name with partial matching | `'{}'` |
| low_percent | what pecent of target qty for an item to be considered low | `25` |
| high_percent | what percent of target qty for an item to be considered "good" | `80` |
| update_change_interal | how often should changed quantity update | `300` | 
| update_interval | how often to refresh storage contents. note that a single programming board can only update a single container once every 30s. Details below | `30` |

## Update interval got-yas

When you have multiple containers linked the container `updateContents()` api only allows for a single programming board to get updates from a single container every 30s. This means the script can not get updates from multiple containers at 30s intervals as only a single containers contents can be updated every 30s from a single programming board. To combat never having appropraitely updated information this script will delay updating containers when there are multiple containers and spread the updates out evenly based off the number of linked containers. Effectively what this means is if you run with multiple containers you will want to have the update interval set to 30, however internally each container will only be udpated every 30 * #containers seconds. So if you have 4 containers attached it will take 2 minutes for updated quantities to reflect on the screen.

Future iterations of this will allow linking databanks to pull inventory data from multiple containers with more regular update frequency (assuming that works it is).

# databank features

Linking a databank allows tracking of quantity changes over time. by default this interval is 300s (or 5min). Every 5 minutes the `changed` column will update with a positive or negative number depending on if the quantity increased or decreased in this time period. 

Connecting a databank also allows for tracking items with 0 quantity after they fall out of a container. This allows you to see when you are completely out of an item and need to make or buy more of it. Since it is stored in a databank it will even persist accross restarts of the script for when/if you change parameters. To clear the databank add `databank.clear()` to the end of the `onStart()` filter, activate your programming board, then remove the line and deactivate/activate the programming board.


# Planned updates/features
* allow pulling/pushing of container contents into/from a databank
* make it look better


