FROM debian:12.8
USER root
COPY ./dependencies.sh /tmp/dependencies.sh
RUN ["bash", "-x", "/tmp/dependencies.sh"]
# false entrypoint:
ENTRYPOINT ["tail", "-f", "/dev/null"]