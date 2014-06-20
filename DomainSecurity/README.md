Multitenancy, Domain security sample and performance benchmark
=================
This sample loads randomly (but plausible) generated data :
- 1,000 customers, 
- 10,000 products, 
- 100,000 orders,
- 2,000,000 orderlines
in 4 tables in :
- MySQL's fast MyISAM engine, with indexes
- Infobright's columnar engine, without indexes

The JRS export contains :
- 2 datasources defined (one on each database)
- 2 secured/translated domains
- 2 domain based crosstab views/reports
- 2 SQL based reports
- 1 dashboard with the 2 domain based reports (perf. difference between a columnar storage engine without indexes and a regular table storage engine supposed to be fast)
- 1 dashboard with the 2 SQL based reports

The domain security filters :
- vertically the orderline_total and the unit_price columns for ROLE_ADMIN and ROLE_SALES
- horizontally the french regions for the organization ID.

François Cerbelle

##Requirements

##Instructions

Execute the domain based report with jasperadmin and with joeuser
Create a new suborganization "Centre" with ID 24
Create a new suborganization "IdF" with ID 11
Download, Upload and activate the Centre and IdF theme from the organization_1's themes in respective sub organization
Execute the same public report with jasperadmin or joeuser in one of the sub organizations

