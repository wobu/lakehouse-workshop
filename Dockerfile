FROM tabulario/spark-iceberg

#RUN rm /bin/notebook2
#
#RUN echo '#! /bin/sh' >> /bin/notebook2 \
# && echo 'export PYSPARK_DRIVER_PYTHON=jupyter-notebook' >> /bin/notebook2 \
# && echo "export PYSPARK_DRIVER_PYTHON_OPTS=\"--notebook-dir=/home/iceberg/notebooks --ServerApp.allow_remote_access=True --browser=False --ServerApp.disable_check_xsrf=True --ip='*' --NotebookApp.token='' --NotebookApp.password='' --port=8888 --no-browser --allow-root\"" >> /bin/notebook2 \
# && echo "pyspark" >> /bin/notebook2 \
# && chmod u+x /bin/notebook2


COPY spark-defaults.conf /opt/spark/conf