FROM alpine:3.14

RUN apk add --no-cache python3 && \
    python3 -m ensurepip && \
    rm -rf /usr/lib/python*/ensurepip && \
    pip3 install --upgrade pip setuptools && \
    rm -rf /root/.cache

WORKDIR /app

COPY main.py ./

CMD [ "python3", "main.py" ]
