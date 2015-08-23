Run:
`docker build -t anoop/tomcat .`

Need to run:
`docker run -p 3306:3306 -e MYSQL_ROOT_PASSWORD=root --name mysql mysql`

before running:
`docker run -p 8080:8080 --link mysql:db --rm --name web anoop/tomcat`
