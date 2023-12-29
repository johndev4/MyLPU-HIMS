FROM mysql

# ENV MYSQL_DATABASE=${MYSQL_DATABASE}
# ENV MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD}

COPY ./infrastructure/database/sql/mylpuhims-init-create-tables.sql /docker-entrypoint-initdb.d/init.sql

EXPOSE 3306