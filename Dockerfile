FROM maven:3.6-jdk-11-slim as build

ARG EXPORTER_VERSION=parent-0.11.0
ARG EXPORTER_REPO=github.com/prometheus/jmx_exporter

WORKDIR /tmp

RUN set -ex \
    && apt-get update && apt-get install -y curl ca-certificates --no-install-recommends \
    && mkdir ./jmx_exporter \
    && curl -SLs https://$EXPORTER_REPO/archive/$EXPORTER_VERSION.tar.gz | tar -xzf - --strip-components=1 -C ./jmx_exporter \
    && cd ./jmx_exporter \
    && mvn package -pl jmx_prometheus_httpserver \
    && find jmx_prometheus_httpserver/ -name *-jar-with-dependencies.jar -exec mv -v '{}' ../jmx_prometheus_httpserver.jar \;

FROM openjdk:11-jre-slim

WORKDIR /usr/local/exporter

COPY --from=build /tmp/jmx_prometheus_httpserver.jar .
COPY --from=build /tmp/jmx_exporter/example_configs/httpserver_sample_config.yml .

USER nobody

ENTRYPOINT ["java", "-jar", "jmx_prometheus_httpserver.jar"]
CMD ["5556", "httpserver_sample_config.yml"]