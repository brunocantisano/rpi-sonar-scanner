FROM paperinik/rpi-java8
MAINTAINER Bruno Cantisano <bruno.cantisano@gmail.com>

LABEL version latest
LABEL description Sonar Scanner Raspberry Pi 2 Container

RUN apt-get update \
    && apt-get install -y wget unzip \
    && wget https://sonarsource.bintray.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-3.0.3.778.zip \
    && unzip sonar-scanner-cli-3.0.3.778.zip \
    && rm -f sonar-scanner-cli-3.0.3.778.zip \
    && apt-get purge --auto-remove wget unzip \
    && rm -rf /var/lib/apt/lists/*

ENV SONAR_SCANNER_OPTS -Xmx512m 
ENV PATH $PATH:/sonar-scanner-3.0.3.778/bin 

WORKDIR /var/scanner

VOLUME /var/scanner

COPY assets/init.sh /init.sh

RUN chmod 755 /init.sh

ENTRYPOINT ["/init.sh"]

CMD ["app:help"]
