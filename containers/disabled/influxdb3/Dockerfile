FROM quay.io/influxdb/influxdb3-core:latest
USER root
RUN ["mkdir", "-p", "/root/influxdb3/db"]
ENTRYPOINT ["influxdb3", "serve", "--writer-id", "obs-lab-id", "--object-store", "file", \
            "--data-dir", "/root/influxdb3/db"]