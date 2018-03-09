# JDV Customer

## Overview
An JDV Project that connects one database table (Postgresql) and one CSV file.

## Folder/files overview
* [files/renda-cartao.csv](./files/renda-cartao.csv)
* [database/postgresql/schema.sql](./database/postgresql/schema.sql)
* [database/initdb-container.sh](./database/initdb-container.sh)

# Standalone Deployment (EAP)

## Requirements
* JBoss Developer Studio 8.1.0 with Teiid plugin
* JDK 1.8+
* JBoss EAP 6.4+

## Source Code
The project source code is in [src](./src) directory and consists in a JBoss Developer Studio 8.1.0 GA Teiid Model Project. It has:
* Sources
	* For CSV files and Postgresql database
* Views
	* Models for the sources, with joins and materialized view tables
* VDB
	* It generates the VDB file [jdv-customer.vdb](./src/jdv-customer.vdb).


## Database setup
If you have Docker Engine on your host, just run the [database/initdb-container.sh](./database/initdb-container.sh) script. It will spin up a Postgres conatiner with our DB preloaded for this demo.

## EAP setup
It is necessary to have the following resources created in EAP:
* Datasource
	* jndi-name="java:/CadastroCliente"
		* Example (change the URL/username/password as needed):
		    ```
		        <datasource jndi-name="java:/CadastroCliente" pool-name="CadastroCliente" enabled="true">
		            <connection-url>jdbc:postgresql://postgresql:5432/redhat</connection-url>
		            <driver>postgresql</driver>
		            <security>
		                <user-name>redhat</user-name>
		                <password>redhat@123</password>
		            </security>
		        </datasource>
		    ```
* Resource Adapter
	* resource-adapter id="RendaCartao"
		* Example (change the Path/file name as needed):
		    ```
		        <resource-adapter id="CNPJSource">
		            <module slot="main" id="org.jboss.teiid.resource-adapter.file"/>
		            <transaction-support>NoTransaction</transaction-support>
		            <connection-definitions>
		                <connection-definition class-name="org.teiid.resource.adapter.file.FileManagedConnectionFactory" jndi-name="java:/CNPJSource" enabled="true" pool-name="CNPJSource">
		                    <config-property name="ParentDirectory">
		                        /home/jboss/source/files/
		                    </config-property>
		                </connection-definition>
		            </connection-definitions>
		        </resource-adapter>
		    ```

## EAP Deployment
Copy the file [jdv-customer.vdb](./src/jdv-customer.vdb) to deployment folder of your EAP instance.

## JDBC setup
The VDB will be available at this URL: [jdbc:teiid:jdv-customer@mm://localhost:31000](jdbc:teiid:jdv-customer@mm://localhost:31000).

## JDBC test
You can test your VDB using the following SQL statements:
* select * from Cliente;

## Folder/files overview
Used folders:
* src
* files
* database

