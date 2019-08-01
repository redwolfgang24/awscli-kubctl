FROM ubuntu:latest
MAINTAINER Larry Borrero <redwolfgang20@gmail.com>

RUN apt-get -y update
RUN apt-get -y install awscli
RUN apt-get -y install curl

RUN curl -o kubectl https://amazon-eks.s3-us-west-2.amazonaws.com/1.13.7/2019-06-11/bin/linux/amd64/kubectl
RUN chmod +x ./kubectl
RUN mkdir -p $HOME/bin && cp ./kubectl $HOME/bin/kubectl && export PATH=$HOME/bin:$PATH
RUN export PATH=/home/ec2-user/.local/bin:$PATH

# Set Default Behavior
ENTRYPOINT ["aws"]
