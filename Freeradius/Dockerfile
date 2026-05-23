#Pulls freeradius image from official source
FROM freeradius/freeradius-server:latest

#Installs additional tools into the package that freeradius doesn't come with. This gives basic IP functionality for ping, ip route, etc.
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
