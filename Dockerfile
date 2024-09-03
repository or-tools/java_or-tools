# Create a virtual environment with all tools installed
# ref: https://hub.docker.com/_/ubuntu
FROM ubuntu:latest AS env
# Install system build dependencies
ENV PATH=/usr/local/bin:$PATH
RUN apt update -qq \
&& DEBIAN_FRONTEND=noninteractive apt install -yq default-jdk maven \
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
ENV JAVA_HOME=/usr/lib/jvm/default-java

# Copy project
FROM env AS devel
WORKDIR /home/project
COPY . .

# Build
FROM devel AS build
RUN mvn compile -B

# Run
FROM build AS run
RUN mvn exec:java

# Pack
FROM build AS pack
RUN mvn package -B
