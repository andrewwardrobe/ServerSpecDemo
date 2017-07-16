FROM httpd:2.2

RUN apt-get update && apt-get -y install php5

COPY ./reports/dev-machine.html /usr/local/apache2/htdocs/index.html