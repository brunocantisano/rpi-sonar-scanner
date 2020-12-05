FROM balenalib/raspberrypi3-debian-openjdk:11
MAINTAINER Bruno Cantisano <bruno.cantisano@gmail.com>

LABEL version latest
LABEL description Sonar Scanner Raspberry Pi Container

ENV SONAR_VERSION 4.5.0.2216
ENV SONAR_SCANNER_OPTS -Xmx512m 
ENV PATH $PATH:/sonar-scanner-$SONAR_VERSION/bin 

RUN apt-get clean \
    && apt-get update \
    && apt-get install -y \
    wget \
    unzip \
    && cd / \
    && wget https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-$SONAR_VERSION.zip \
    && unzip sonar-scanner-cli-$SONAR_VERSION.zip \
    && rm -f sonar-scanner-cli-$SONAR_VERSION.zip \
    && mkdir /var/scanner \
    && apt-get purge --auto-remove wget unzip \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /var/scanner
VOLUME /var/scanner

COPY files/entrypoint.sh /entrypoint.sh
RUN chmod 755 /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

CMD ["app:start"]
