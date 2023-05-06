FROM alpine:3.14

RUN apk add --no-cache python3 && \
    python3 -m ensurepip && \
    rm -rf /usr/lib/python*/ensurepip && \
    pip3 install --upgrade pip setuptools && \
    rm -rf /root/.cache

RUN apk add --no-cache python3-dev build-base gcc musl-dev linux-headers && \
    python3 -m pip install --no-cache-dir --upgrade pip && \
    pip3 install numpy && \
    rm -rf /root/.cache

WORKDIR /app

COPY main.py ./

CMD [ "python3", "main.py" ]
