Run:
`docker build -t anoop/tomcat .`

Need to run:
`docker create -v /var/lib/mysql --name dbdata mysql /bin/true`
and
`docker run -d -p 3306:3306 --volumes-from dbdata -e MYSQL_ROOT_PASSWORD=root --name mysql mysql`

(To run in foreground)
`docker run -p 3306:3306 -e MYSQL_ROOT_PASSWORD=root --name mysql mysql`

before running:
`docker run -d -p 8080:8080 --link mysql:db --name web anoop/tomcat`

(To run in foreground)
`docker run -p 8080:8080 --link mysql:db --rm --name web anoop/tomcat`


Open a browser and navigate to:
http://localhost:8080/app/index.jsp?user=root&pwd=root

Should display:

#Hello World
Welcome root


http://localhost:8080/app/index.jsp?user=root&pwd=root1

Should display:
Incorrect password. Try again

http://localhost:8080/app/index.jsp?user=root1&pwd=root1

Should display:
User root1 not found!
