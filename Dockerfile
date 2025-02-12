FROM debian:bookworm-slim

# install deps
RUN apt update
RUN apt install -y libunwind-dev unzip screen

#Download Server Stuff
## Server executable
ADD https://playmorepromode.com/files/latest/cnq3 cnq3_server.zip 

## server shellscripts
ADD https://cdn.playmorepromode.com/files/cnq3-ded-server-scripts.zip server-scripts.zip

## maps
ADD https://cdn.playmorepromode.com/files/cpma-mappack-full.zip cpma-mappack-full.zip

## cpma mod files
ADD https://playmorepromode.com/files/latest/cpma cpma_mod.zip

ADD pk3_files/* /opt/q3/baseq3/

ADD custom_start.sh /opt/q3

# unzip mod to destination
RUN unzip cpma_mod.zip -d /opt/q3/

## server config
ADD config/* /opt/q3/cpma

# unzip mappack
RUN unzip cpma-mappack-full.zip -d /opt/q3/baseq3

# unzip server executables
RUN unzip cnq3_server.zip -d /opt/q3

# unzip server scripts
RUN unzip server-scripts.zip -d /opt/q3

RUN ["chmod", "+x", "/opt/q3/custom_start.sh"]
RUN ["chmod", "+x", "/opt/q3/start_server_1.sh"]
RUN ["chmod", "+x", "/opt/q3/cnq3-server-x64"]

#WORKDIR /opt/q3

CMD ["bash", "-c", "/opt/q3/start_server_1.sh"]
CMD ["sh", "-c", "sleep infinity"]
#ENTRYPOINT ["bash", "-c", "/opt/q3/custom_start.sh"]
#CMD ["sh", "sleep", "30000"]
#ENTRYPOINT ["/bin/sh","-c","sleep infinity"]
