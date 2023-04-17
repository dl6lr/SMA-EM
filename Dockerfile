FROM alpine:3

# Prepare base system
RUN apk update && apk upgrade && \
    apk add python3 py3-pip git 

# Install sma-em daemon
RUN mkdir -p /opt/smaemd && mkdir -p /etc/smaemd
WORKDIR /opt/smaemd
RUN git clone https://github.com/dervomsee/SMA-EM .
RUN pip3 install -r requirements.txt 

ADD run_smaemd.sh /root/
RUN chmod +x /root/*
CMD ["/root/run_smaemd.sh"]
