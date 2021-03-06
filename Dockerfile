FROM alpine
  
# Setup apt
RUN apk -U --no-cache add \
               build-base \
               git \
               linux-headers \
               python3 \
               python3-dev && \
# Setup Snare 
    git clone --depth=1 https://github.com/andy1ee11o2/snare /opt/snare && \
    cd /opt/snare/ && \
    pip3 install --no-cache-dir --upgrade setuptools && \
    pip3 install --no-cache-dir -r requirements.txt && \
    python3.6 setup.py install && \
    cd / && \
    rm -rf /opt/snare && \
# Clean up
    apk del --purge \
            build-base \
            linux-headers \
            python3-dev && \
    rm -rf /root/* && \
    rm -rf /tmp/* /var/tmp/* && \
    rm -rf /var/cache/apk/*
