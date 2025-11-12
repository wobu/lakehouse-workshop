FROM docker-spark-iceberg

COPY spark-defaults.conf /opt/spark/conf
COPY entrypoint.sh .