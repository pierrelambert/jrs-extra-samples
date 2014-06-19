Skeleton folder structure
=================
This is a best practice folder structure

François Cerbelle

##Requirements

##Instructions
This is a best practice folder structure, with all user oriented resources
available in dedicated folders and all back-end oriented resources
hidden in a folder hidden to end-users (resources). The idea is to create
a customer named folder in the repository, then to import this skeleton
and to move each skeleton subfolder in the customer named folder, it preserves
the permissions on subfolders, but does not keep the "skeleton" id in the 
path.

Then, each resources has its own folder : a folder for all JRXML files, a 
folder for each Input Control, a sub folder for each List of value...
Each resource can be linked (referenced) from a parent. It means that each 
resource is defined only once and reused from everywhere.
