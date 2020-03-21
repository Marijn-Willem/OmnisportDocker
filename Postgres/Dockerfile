FROM postgres
ENV POSTGRES_DB omnisport
ENV POSTGRES_USER postgres
ENV POSTGRES_PASSWORD postgres
COPY Omnisport.sql /docker-entrypoint-initdb.d/
EXPOSE 5432