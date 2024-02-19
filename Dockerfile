# setting up postgres and copying necessary sql files
FROM postgres
ENV POSTGRES_PASSWORD postgres
ENV POSTGRES_DB postgres
COPY init.sql /docker-entrypoint-initdb.d/
COPY trades.csv /docker-entrypoint-initdb.d/
