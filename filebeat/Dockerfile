FROM centurylink/ca-certs
WORKDIR /app
COPY runtime/filebeat /app/
COPY conf.yml /app/
ENTRYPOINT ["filebeat", "-e", "-c", "conf.yml"]

