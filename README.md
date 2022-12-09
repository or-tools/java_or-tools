[![Build Status][docker_status]][docker_link]
[![Build Status][linux_status]][linux_link]
[![Build Status][macos_status]][macos_link]
[![Build Status][windows_status]][windows_link]

[docker_status]: https://github.com/or-tools/java_or-tools/workflows/docker.yml/badge.svg
[docker_link]: https://github.com/or-tools/java_or-tools/actions/workflows/docker.yml
[linux_status]: https://github.com/or-tools/java_or-tools/workflows/linux.yml/badge.svg
[linux_link]: https://github.com/or-tools/java_or-tools/actions/workflows/linux.yml
[macos_status]: https://github.com/or-tools/java_or-tools/workflows/macos.yml/badge.svg
[macos_link]: https://github.com/or-tools/java_or-tools/actions/workflows/macos.yml
[windows_status]: https://github.com/or-tools/java_or-tools/workflows/windows.yml/badge.svg
[windows_link]: https://github.com/or-tools/java_or-tools/actions/workflows/windows.yml

# Introduction
Sample project explaining how to use Google OR-Tools with local java artifact.

## HowTo
First dowload and extract the correct archive:
* [java_linux.tar.gz](https://github.com/google/or-tools/releases/download/v8.2/java_linux.tar.gz)
* [java_osx.zip](https://github.com/google/or-tools/releases/download/v8.2/java_osx.zip)
* [java_win.zip](https://github.com/google/or-tools/releases/download/v8.2/java_win.zip)

Then install both packages `ortools-java`, e.g.:<br>
```sh
mvn org.apache.maven.plugins:maven-install-plugin:3.0.0-M1:install-file -Dfile="ortools-java-8.2.8710.jar"
```
and `ortools-<platform>`, e.g.:<br>
e.g. for GNU/Linux
```sh
mvn org.apache.maven.plugins:maven-install-plugin:3.0.0-M1:install-file -Dfile="ortools-linux-x86-64-8.2.8710.jar"
```

## Testing
You can test using the provided Dockerfile
```sh
docker build --tag=java_ortools .
```

note: Don't hesitate to look at [github action workflows](.github/workflows)
too.
