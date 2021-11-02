#base image
FROM ubuntu
RUN apt-get update && apt-get upgrade -y
RUN apt-get install openjdk-8-jre -y
RUN apt-get install git -y


ARG KOTLIN_VERSION=1.3.72
ENV DEBIAN_FRONTEND=noninteractive
# Get OS-level updates:
RUN apt-get update \
 && apt-get install --no-install-recommends --assume-yes \
      curl \
      unzip
# and if you need C/Python dependencies, those too

# Download and unpack Kotlin
RUN cd /opt \
 && curl -LO https://github.com/JetBrains/kotlin/releases/download/v${KOTLIN_VERSION}/kotlin-compiler-${KOTLIN_VERSION}.zip \
 && unzip kotlin-compiler-${KOTLIN_VERSION}.zip \
 && rm kotlin-compiler-${KOTLIN_VERSION}.zip

# Add its directory to $PATH
ENV PATH=/opt/kotlinc/bin:$PATH

COPY ./helloworld.sh /
RUN chmod +x /helloworld.sh
ENTRYPOINT ["/helloworld.sh"]
