FROM postgres:16.1

COPY ./scripts /docker-entrypoint-initdb.d/

ENV POSTGRES_USER root
ENV POSTGRES_PASSWORD postgres

EXPOSE 5432
