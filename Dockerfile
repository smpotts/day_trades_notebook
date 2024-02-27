# setting up postgres and copying necessary sql files
FROM postgres
COPY init.sql /docker-entrypoint-initdb.d/
COPY trades.csv /docker-entrypoint-initdb.d/
