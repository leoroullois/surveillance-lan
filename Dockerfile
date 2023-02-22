FROM debian:latest

RUN apt update && apt install -y \
    iproute2 \
    iputils-ping \
    net-tools \
    tcpdump \
    vim \
    dsniff

CMD ["/bin/bash"]
