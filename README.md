![Docker](https://github.com/Mizux/java-ortools/workflows/Docker/badge.svg)
![Linux](https://github.com/Mizux/java-ortools/workflows/Linux/badge.svg)
![MacOS](https://github.com/Mizux/java-ortools/workflows/MacOS/badge.svg)
![Windows](https://github.com/Mizux/java-ortools/workflows/Windows/badge.svg)

# Introduction
Sample project explaining how to use Google OR-Tools java artifact.

## HowTo
First dowload and extract the correct archive:
* [java_linux.tar.gz](https://github.com/google/or-tools/releases/download/v8.0/java_linux.tar.gz)
* [java_osx.zip](https://github.com/google/or-tools/releases/download/v8.0/java_osx.zip)
* [java_win.zip](https://github.com/google/or-tools/releases/download/v8.0/java_win.zip)

Then install both packages `ortools-java` and `ortools-<platform>`.<br>

Since `ortools-java` have dependencies, you must provide a custom `pom.xml` since
the auto-generated one won't contain them...<br>
Luckily, you can use the `pom.xml` already contain in the jar file aka `META-INF/maven/com.google.ortools/ortools-java/pom.xml`

e.g.
```sh
unzip -j ortools-java-8.0.8283.jar META-INF/maven/com.google.ortools/ortools-java/pom.xml
mvn org.apache.maven.plugins:maven-install-plugin:2.5.2:install-file \
-Dfile=ortools-java-8.0.8283.jar -DpomFile=pom.xml
```

For installing the `ortools-<platform>` it's easier.<br>
e.g. for GNU/Linux
```sh
mvn org.apache.maven.plugins:maven-install-plugin:2.5.2:install-file \
-Dfile=ortools-linux-x86-64-8.0.8283.jar -DgeneratePom=true
```

## Testing
You can test using the provided Dockerfile
```sh
docker build --tag=java_ortools .
```

note: Don't hesitate to look at [github action workflows](.github/workflows)
too.
