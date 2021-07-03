# TF-Scripts - FreeOP Servers
Various scripts we use to manage the TF Servers

## Prerequisites 
You will need to ensure that you have configured the MySQL Database settings for the server on the host itself. Each server has unique credentials to authenticate with the DB04 Database, which will allow us to access CoreProtect. Use the `my.cnf.example` file as a base line, and store it in the home directory of the user which the server is executed under with the file name `my.cnf`. 