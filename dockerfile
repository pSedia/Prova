#base image
FROM ubuntu
RUN apt-get update && apt-get upgrade -y
RUN apt-get install openjdk-8-jre -y
RUN apt-get install git -y


COPY ./helloworld.sh /
RUN chmod +x /helloworld.sh
ENTRYPOINT ["/helloworld.sh"]
