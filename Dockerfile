FROM python:3.11-alpine

# Set environment variables to avoid interactive prompts
ENV PYTHONUNBUFFERED=1
ENV PYTHONDONTWRITEBYTECODE=1

# Install dependencies with proper error handling
RUN apk add --no-cache \
    bash \
    git \
    py3-argparse \
    py3-flask \
    py3-pygments \
    python3-tkinter \
    sqlite \
    py3-pip \
    && pip3 install --no-cache-dir --upgrade pip \
    && git clone https://github.com/SystemRage/py-kms.git /tmp/py-kms \
    && git clone https://github.com/coleifer/sqlite-web.git /tmp/sqlite_web \
    && mv /tmp/py-kms/py-kms /home/ \
    && mv /tmp/sqlite_web/sqlite_web /home/ \
    && rm -rf /tmp/py-kms /tmp/sqlite_web \
    && pip3 install --no-cache-dir peewee tzlocal pysqlite3 \
    && apk del git

# Create a startup script
RUN echo '#!/bin/sh' > /usr/bin/start.sh \
    && echo 'cd /home/py-kms' >> /usr/bin/start.sh \
    && echo 'python3 pykms_Server.py --ip 0.0.0.0 --port 1688' >> /usr/bin/start.sh \
    && chmod +x /usr/bin/start.sh

# Expose the KMS port
EXPOSE 1688

# Set the working directory
WORKDIR /home/py-kms

# Start the KMS server
CMD ["/usr/bin/start.sh"]
