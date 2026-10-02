This repository contains two docker-compose files that run the OmniSport application against a database.
- omnisport.yml
- omnisport_sqlserver.yml

They both run the image mwdf/omnisportweb and they differ in the database image they run. 
The image mwdf/omnisportweb contains a Tomcat installation with all web applications delivered by the OmniSport project. These applications are:
- alcifosports
- alias
- api
- cyclingroad
- darts
- flush
- h2hsports
- management
- speedskating
- teamsports

Both docker-compose files forward the 8080 port from the Docker network to the 8081 port on the local machine.

The database images are:
- mwdf/omnisportdb
- mwdf/omnisportdb-sqlserver

The former is a Postgres image that contains a large amount of sports history from 2019. The latter is an MS SQL-Server database that currently contains 
a set of data from spring classics in cycling.
The Postgres image is forwarded to the 5433 port on the local machine. The SQL-Server image is forwarded to the regular 1433 port on the local machine. 

Example run command:

`docker-compose -f .\omnisport.yml up`

Check the application on

`http://localhost:8081/teamsports`
