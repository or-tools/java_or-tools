# Create a virtual environment with all tools installed
# ref: https://hub.docker.com/_/ubuntu
FROM ubuntu:rolling AS env
LABEL maintainer="mizux.dev@gmail.com"
# Install system build dependencies
ENV PATH=/usr/local/bin:$PATH
RUN apt-get update -qq \
&& DEBIAN_FRONTEND=noninteractive apt-get install -yq \
wget default-jdk maven \
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
ENV JAVA_HOME=/usr/lib/jvm/default-java

FROM env AS base
# Install ortools
WORKDIR /home/project/repo
RUN wget "https://github.com/google/or-tools/releases/download/v7.7/java_linux.tar.gz" \
&& tar xzvf java_linux.tar.gz \
&& rm java_linux.tar.gz

RUN mvn org.apache.maven.plugins:maven-install-plugin:2.5.2:install-file \
-Dfile=ortools-java-7.7.7810.jar
RUN mvn org.apache.maven.plugins:maven-install-plugin:2.5.2:install-file \
-Dfile=ortools-linux-x86-64-7.7.7810.jar

#ortools-java-7.7.7810-javadoc.jar
#ortools-java-7.7.7810-sources.jar
#ortools-java-7.7.7810.jar
#ortools-linux-x86-64-7.7.7810-sources.jar
#ortools-linux-x86-64-7.7.7810.jar

RUN mvn deploy:deploy-file \
-DgroupId=com.google.ortools \
-DartifactId=ortools-java \
-Dversion=7.7.7810 \
-Durl=file:./ -DrepositoryId=local-repo \
-DupdateReleaseInfo=true \
-Dfile=ortools-java-7.7.7810.jar

RUN mvn deploy:deploy-file \
-DgroupId=com.google.ortools \
-DartifactId=ortools-linux-x86-64 \
-Dversion=7.7.7810 \
-Durl=file:./ -DrepositoryId=local-repo \
-DupdateReleaseInfo=true \
-Dfile=ortools-linux-x86-64-7.7.7810.jar

# Copy project
FROM base AS devel
WORKDIR /home/project
COPY . .
RUN ls -R

# Build
FROM devel AS build
RUN mvn compile

# Run test
FROM build AS test
RUN mvn exec:java -Dexec.mainClass="org.mizux.ortools.Test"
