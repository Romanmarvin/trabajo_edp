FROM debian:latest

RUN apt update && apt upgrade -y && apt install imagemagick -y && apt-get install git -y

RUN git clone https://Romanmarvin@github.com/Romanmarvin/trabajo_edp.git 

WORKDIR /trabajo_edp

CMD /trabajo_edp/menu.sh

