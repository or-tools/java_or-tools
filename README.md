Github-CI:<br>
[![Build Status][github_linux_status]][github_linux_link]
[![Build Status][github_macos_status]][github_macos_link]
[![Build Status][github_windows_status]][github_windows_link]

[![Build Status][github_amd64_docker_status]][github_amd64_docker_link]

[github_linux_status]: ./../../actions/workflows/amd64_linux.yml/badge.svg
[github_linux_link]: ./../../actions/workflows/amd64_linux.yml
[github_macos_status]: ./../../actions/workflows/amd64_macos.yml/badge.svg
[github_macos_link]: ./../../actions/workflows/amd64_macos.yml
[github_windows_status]: ./../../actions/workflows/amd64_windows.yml/badge.svg
[github_windows_link]: ./../../actions/workflows/amd64_windows.yml

[github_amd64_docker_status]: ./../../actions/workflows/amd64_docker.yml/badge.svg
[github_amd64_docker_link]: ./../../actions/workflows/amd64_docker.yml

# Introduction

Sample project explaining how to use Google OR-Tools in a maven project.

# Build

```sh
mvn compile -B
```

# Run

```sh
mvn exec:java
```

# Package

```sh
mvn package -B
```

## Testing
You can test using the provided Dockerfile
```sh
docker build --tag=java_or-tools .
```

