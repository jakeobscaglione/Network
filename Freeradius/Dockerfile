FROM freeradius/freeradius-server:latest

RUN apt update && apt install -y \
vim \
nano \
iputils-ping \
net-tools \
tcpdump \
curl \
iproute2 \
&& apt clean

EXPOSE 1812/udp 1813/udp
