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

## Testing
You can test using the provided Dockerfile
```sh
docker build --tag=java_ortools .
```

note: Don't hesitate to look at [github action workflows](.github/workflows)
too.
