FROM tomcat
MAINTAINER Anoop Kumar <anokun7@users.noreply.github.com>

EXPOSE 8080

RUN mkdir /usr/local/tomcat/webapps/app/
RUN mkdir /usr/local/tomcat/webapps/app/WEB-INF/
RUN mkdir /usr/local/tomcat/webapps/app/WEB-INF/lib/

WORKDIR /usr/local/tomcat/webapps/app

#COPY web.xml WEB-INF
COPY index.jsp index.jsp
COPY mysql.jar WEB-INF/lib/mysql.jar

CMD ["/usr/local/tomcat/bin/catalina.sh", "run"]
