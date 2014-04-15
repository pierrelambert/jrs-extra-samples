JasperReports Server Sample Sharing Standard (JRS-SSS)
=============
This standard describes a way to share packages that contain examples for use in JasperReports Server. The goal of this standard is that with a package a user could either a) write an automatic system for importing it or b) Manually import it into their own environment

version 0.1

Databases
-------------
###Relational Databases
Relational databases will need at a minimum a schema and data file that is database specific. Optional files include indexes and constraints

###MongoDB
MongoDB will use the mongodump and mongorestore utilities, for example:

>mongodump -d test -c books
>mongorestore --drop dump

Filesystem
-------------
Filesystem can be broken down into different categories:
###Tomcat
Any tomcat configuration
###JRS
Any JasperReports Server configurations
###Filesystem
Anything outside tomcat and JRS, include data files like CSV. We should probably try and standardize a folder where they will live like /data 

Open items:

* Use patch for binary files?

Repository
-------------
This will contain any repository exports. 

Open items:

* We should try and standardize repo locations for new samples, like Public -> Extra samples, for example!
