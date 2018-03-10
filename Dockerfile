FROM chialab/php:7.1
WORKDIR /app
COPY . /app
ARG MARIADB_ROOT_PASSWORD
EXPOSE 8000
RUN apt update && apt install -yqq mysql-client
RUN echo "create database if not exists wordpress;" | mysql -hmariadb -uroot -p$MARIADB_ROOT_PASSWORD

CMD php -S 0.0.0.0:8000
