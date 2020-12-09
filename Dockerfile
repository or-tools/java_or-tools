# Create a virtual environment with all tools installed
# ref: https://hub.docker.com/_/ubuntu
FROM ubuntu:rolling AS env
LABEL maintainer="mizux.dev@gmail.com"
# Install system build dependencies
ENV PATH=/usr/local/bin:$PATH
RUN apt-get update -qq \
&& DEBIAN_FRONTEND=noninteractive apt-get install -yq \
wget default-jdk maven unzip \
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
ENV JAVA_HOME=/usr/lib/jvm/default-java

# Install ortools in maven local cache
FROM env AS base
WORKDIR /home/project/repo
RUN wget "https://github.com/google/or-tools/releases/download/v8.0/java_linux.tar.gz" \
&& tar xzvf java_linux.tar.gz \
&& rm java_linux.tar.gz

# We must provide the pom.xml so we need to extract it...
#RUN unzip -j ortools-java-8.0.8283.jar META-INF/maven/com.google.ortools/ortools-java/pom.xml
#RUN mvn org.apache.maven.plugins:maven-install-plugin:2.5.2:install-file \
#-Dfile=ortools-java-8.0.8283.jar -DpomFile=pom.xml

RUN mvn org.apache.maven.plugins:maven-install-plugin:3.0.0-M1:install-file \
-Dfile=ortools-java-8.0.8283.jar

#RUN mvn org.apache.maven.plugins:maven-install-plugin:3.0.0-M1:install-file \
#-Dfile=ortools-java-8.0.8283-javadoc.jar -Dclassifier=javadoc
#RUN mvn org.apache.maven.plugins:maven-install-plugin:3.0.0-M1:install-file \
#-Dfile=ortools-java-8.0.8283-sources.jar -Dclassifier=sources

RUN mvn org.apache.maven.plugins:maven-install-plugin:3.0.0-M1:install-file \
-Dfile=ortools-linux-x86-64-8.0.8283.jar

#RUN mvn org.apache.maven.plugins:maven-install-plugin:3.0.0-M1:install-file \
#-Dfile=ortools-linux-x86-64-8.0.8283-sources.jar -Dclassifier=sources

# Copy project
FROM base AS devel
WORKDIR /home/project
COPY . .

# Build
FROM devel AS build
RUN mvn compile

# Run test
FROM build AS test
RUN mvn exec:java -Dexec.mainClass="org.mizux.ortools.Test"
