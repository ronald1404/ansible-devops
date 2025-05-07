FROM mariadb
MAINTAINER Rogerio Martinho
ENV MYSQL_ROOT_PASSWORD=12345678
ENV MYSQL_DATABASE=backup
ENV MYSQL_USER=express
ENV MYSQL_PASSWORD=AllSafe0!
EXPOSE 3306
COPY /db/backup.sql /docker-entrypoint-initdb.d/ 