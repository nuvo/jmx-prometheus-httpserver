# jmx-prometheus-httpserver

[![Docker Pulls](https://img.shields.io/docker/pulls/nuvo/jmx-prometheus-httpserver.svg)](https://hub.docker.com/r/nuvo/jmx-prometheus-httpserver/)
[![license](https://img.shields.io/github/license/nuvo/jmx-prometheus-httpserver.svg)](https://github.com/nuvo/jmx-prometheus-httpserver/blob/master/LICENSE)

HTTP server to collect mBean jmx metrics and export them to Prometheus

See the [official docs](https://github.com/prometheus/jmx_exporter) for more details and example configs.

As a general rule, running the exporter as a java agent is recommended, 
but this can serve as a side car for java applications that we don't want to maintain downstream.
