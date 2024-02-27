# setting up postgres and copying necessary sql files
FROM postgres
ENV POSTGRES_PASSWORD ${POSTGRES_PASSWORD}
ENV POSTGRES_DB ${POSTGRES_DB}
COPY init.sql /docker-entrypoint-initdb.d/
COPY trades.csv /docker-entrypoint-initdb.d/
