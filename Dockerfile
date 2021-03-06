FROM python:3.5.2-slim
MAINTAINER Edu Herraiz <gshark@gmail.com>

VOLUME /data

# Things required for a python/pip environment
COPY system-requirements.apt /usr/src/app/system-requirements.apt
RUN  \
    apt-get update && \
    apt-get -y upgrade && \
    apt-get -y autoremove && \
    xargs apt-get -y -q install < /usr/src/app/system-requirements.apt && \
    apt-get -y autoremove && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*


COPY requirements.txt /usr/src/app/requirements.txt
RUN \
    pip install --no-cache-dir pip setuptools -U && \
    pip install --no-cache-dir -r /usr/src/app/requirements.txt -U

COPY create-user.sh /sbin/create-user

COPY docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["devpi-server"]

EXPOSE 8000
