FROM tomcat

RUN mkdir /usr/local/tomcat/webapps/app/ \
 /usr/local/tomcat/webapps/app/WEB-INF/ \
 /usr/local/tomcat/webapps/app/WEB-INF/lib/

WORKDIR /usr/local/tomcat/webapps/app

COPY index.jsp index.jsp
COPY mysql.jar WEB-INF/lib/mysql.jar

CMD ["/usr/local/tomcat/bin/catalina.sh", "run"]
