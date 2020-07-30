FROM alpine:3.12

RUN apk add --no-cache \
        ca-certificates \
        curl \ 
        jq \
        build-base \
        libxslt \
        libffi \
        openssl \
        libxml2-dev \
        libxslt-dev \
        libffi-dev \
        openssl-dev \
        python3 \
        py3-pip \
        python3-dev
WORKDIR /app
COPY docker/scrapyd.conf /app/scrapyd.conf
COPY . .
RUN pip3 install wheel pyasn1 && python3 setup.py install bdist_wheel
EXPOSE 6800
ENTRYPOINT ["scrapyd"]

