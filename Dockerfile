FROM python:3.9-alpine

RUN apk add --no-cache --update \
    bash \
    git \
    py3-argparse \
    py3-flask \
    py3-pygments \
    python3-tkinter \
    sqlite-libs \
    py3-pip && \
    git clone https://github.com/SystemRage/py-kms.git /tmp/py-kms && \
    git clone https://github.com/coleifer/sqlite-web.git /tmp/sqlite_web && \
    mv /tmp/py-kms/py-kms /home/ && \
    mv /tmp/sqlite_web/sqlite_web /home/ && \
    rm -rf /tmp/py-kms && \
    rm -rf /tmp/sqlite_web && \
    pip3 install peewee tzlocal pysqlite3 && \
    chmod a+x /usr/bin/start.sh && \
    apk del git

EXPOSE 1688

CMD ["python3", "/home/py-kms/pykms_Server.py", "--ip", "0.0.0.0", "--port", "1688"]
