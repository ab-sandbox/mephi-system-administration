FROM ubuntu:22.04

RUN apt-get update \
    && apt-get install -y --no-install-recommends python3 \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /var/www

COPY module-02/resource-monitor/script.sh ./script.sh

RUN chmod +x ./script.sh

CMD ["/bin/bash", "-c", "./script.sh & exec python3 -m http.server 8080"]
