FROM jenkins/inbound-agent:alpine
USER root
WORKDIR /opt
RUN apk update && apk add curl postgresql && \
    apk upgrade musl openssl && \
    curl -Ls https://github.com/sbt/sbt/releases/download/v1.4.1/sbt-1.4.1.tgz | tar --strip-components=1 -xzvf - && \
    ln /opt/bin/sbt /usr/local/bin/sbt && ln /opt/bin/sbt-launch.jar /usr/local/bin/sbt-launch.jar
USER jenkins
RUN echo "*:*:*:*:password" > /home/jenkins/.pgpass && chmod 600 /home/jenkins/.pgpass
