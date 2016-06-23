FROM centurylink/ca-certs
WORKDIR /app
COPY runtime/filebeat /app/filebeat
COPY conf.yml /app/conf.yml
ENTRYPOINT ["./filebeat", "-e", "-d", "*", "-c", "conf.yml"]

