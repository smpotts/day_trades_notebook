# postgres
FROM postgres
ENV POSTGRES_PASSWORD postgres
ENV POSTGRES_DB postgres
COPY init.sql /docker-entrypoint-initdb.d/
COPY trades.csv /docker-entrypoint-initdb.d/

# jupyter
FROM jupyter/minimal-notebook

COPY ./requirements.txt /tmp/requirements.txt
RUN pip install -r /tmp/requirements.txt