# jmx-prometheus-httpserver
HTTP server to collect mBean jmx metrics and export them to Prometheus

See the [official docs](https://github.com/prometheus/jmx_exporter) for more details and example configs.

As a general rule, running the exporter as a java agent is recommended, 
but this can serve as a side car for java applications that we don't want to maintain downstream.
