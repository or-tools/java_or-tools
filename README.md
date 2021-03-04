[![Build Status][docker_status]][workflow_link]
[![Build Status][linux_status]][workflow_link]
[![Build Status][macos_status]][workflow_link]
[![Build Status][win_status]][workflow_link]

[docker_status]: https://github.com/or-tools/java_or-tools/workflows/Docker/badge.svg?branch=master
[linux_status]: https://github.com/or-tools/java_or-tools/workflows/Linux/badge.svg?branch=master
[macos_status]: https://github.com/or-tools/java_or-tools/workflows/MacOS/badge.svg?branch=master
[win_status]: https://github.com/or-tools/java_or-tools/workflows/Windows/badge.svg?branch=master
[workflow_link]: https://github.com/or-tools/java_or-tools/actions

# Introduction
Sample project explaining how to use Google OR-Tools java artifact.

## HowTo
First dowload and extract the correct archive:
* [java_linux.tar.gz](https://github.com/google/or-tools/releases/download/v8.2/java_linux.tar.gz)
* [java_osx.zip](https://github.com/google/or-tools/releases/download/v8.2/java_osx.zip)
* [java_win.zip](https://github.com/google/or-tools/releases/download/v8.2/java_win.zip)

Then install both packages `ortools-java`, e.g.:<br>
```sh
mvn org.apache.maven.plugins:maven-install-plugin:3.0.0-M1:install-file -Dfile=ortools-java-8.2.8710.jar
```
and `ortools-<platform>`, e.g.:<br>
e.g. for GNU/Linux
```sh
mvn org.apache.maven.plugins:maven-install-plugin:3.0.0-M1:install-file -Dfile=ortools-linux-x86-64-8.2.8710.jar
```

## Testing
You can test using the provided Dockerfile
```sh
docker build --tag=java_ortools .
```

note: Don't hesitate to look at [github action workflows](.github/workflows)
too.
