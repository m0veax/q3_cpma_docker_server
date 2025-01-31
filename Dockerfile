FROM alpine

# install deps
RUN apk add --no-cache libunwind unzip

#Download Server Stuff
## Server executable
ADD https://playmorepromode.com/files/latest/cnq3 cnq3_server.zip 

## server shellscripts
ADD https://cdn.playmorepromode.com/files/cnq3-ded-server-scripts.zip server-scripts.zip

## server config
ADD https://cdn.playmorepromode.com/files/server.cfg /opt/q3/cpma/server.cfg

## maps
ADD https://cdn.playmorepromode.com/files/cpma-mappack-full.zip cpma-mappack-full.zip

## cpma mod files
ADD https://playmorepromode.com/files/latest/cpma cpma_mod.zip

ADD pk3_files/* /opt/q3/baseq3/

# unzip mod to destination
RUN unzip cpma_mod.zip -d /opt/q3/cpma

# unzip mappack
RUN unzip cpma-mappack-full.zip -d /opt/q3/baseq3

# unzip server executables
RUN unzip cnq3_server.zip -d /opt/q3

# unzip server scripts
RUN unzip server-scripts.zip -d /opt/q3

