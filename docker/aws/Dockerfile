FROM jenkins/inbound-agent:alpine
USER root
RUN apk update \
    && apk add curl wget py3-pip gcc python3-dev musl-dev libffi-dev openssl-dev jansson-dev build-base libc-dev file-dev automake autoconf libtool flex bison \
    && apk upgrade openssl \
    && pip3 install boto3==1.17.96 \
    && pip3 install awscli==1.19.96 \
    && pip3 install c7n c7n-mailer c7n-guardian --ignore-installed six \
    && pip3 install ruamel.yaml \
    && ln /usr/bin/python3 /usr/bin/python \
    && wget https://github.com/stedolan/jq/releases/download/jq-1.6/jq-linux64 -O /usr/local/bin/jq \
    && chmod +x /usr/local/bin/jq
COPY *.py /

RUN chown jenkins /*.py
USER jenkins
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
ENV PATH="/home/jenkins/.cargo/bin/:${PATH}"
