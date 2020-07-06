# Create a virtual environment with all tools installed
# ref: https://hub.docker.com/_/ubuntu
FROM ubuntu:rolling AS base
LABEL maintainer="mizux.dev@gmail.com"
# Install system build dependencies
ENV PATH=/usr/local/bin:$PATH
RUN apt-get update -qq \
&& DEBIAN_FRONTEND=noninteractive apt-get install -yq \
wget default-jdk maven \
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV JAVA_HOME=/usr/lib/jvm/default-java

# Install ortools
RUN wget "https://github.com/google/or-tools/releases/download/v7.7/java_linux.tar.gz" \
&& tar xzvf java_linux.tar.gz \
&& rm java_linux.tar.gz

RUN mvn org.apache.maven.plugins:maven-install-plugin:2.5.2:install-file \
-Dfile=ortools-java-7.7.7810.jar

RUN mvn org.apache.maven.plugins:maven-install-plugin:2.5.2:install-file \
-Dfile=ortools-linux-x86-64-7.7.7810.jar

# Copy project
WORKDIR /home/project
COPY . .

# Build
RUN mvn compile

# Run test
RUN mvn exec:java -Dexec.mainClass="org.mizux.ortools.Test"
