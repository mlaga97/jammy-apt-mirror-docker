FROM ubuntu:jammy
RUN apt update && apt install -y apt-mirror
CMD apt-mirror
