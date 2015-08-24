Uses docker containers to provision a simple application with a web front end - a html/jsp hosted on tomcat, communicating with a backend database (mysql) server. 

The application takes as input, a request parameter - user and returns the user's password hash as stored in the database. If the user is not found it will say so.

To run the docker containers, use docke-compose like this:
```
docker-compose up -d
```

If desired to run the containers individually, follow the steps below:

Run:
```
docker build -t anoop/tomcat .
docker create -v /var/lib/mysql --name dbdata mysql /bin/true
docker run -d -p 3306:3306 --volumes-from dbdata -e MYSQL_ROOT_PASSWORD=root --name mysql mysql
```
	*[To run in foreground: `docker run -p 3306:3306 -e MYSQL_ROOT_PASSWORD=root --name mysql mysql`]*

Then, finally run this to bring tomcat (the app server) up.
```
docker run -d -p 8080:8080 --link mysql:db --name web anoop/tomcat
```
	*[To run in foreground: `docker run -p 8080:8080 --link mysql:db --rm --name web anoop/tomcat`]*

-----------------------------------------------------------------
Open a browser and navigate to:
http://localhost:8080/app/index.jsp?user=root

*Should display:*

#Hello World
Welcome root 

Password hash: *81F5E21E35407D884A6CD4A731AEBFB6AF209E1B

-----------------------------------------------------------------
http://localhost:8080/app/index.jsp?user=dkah

*Should display:*

User dkah not found!
