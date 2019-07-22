# docker-yamllint

[![Build Status](https://travis-ci.com/PeterDaveHello/docker-yamllint.svg?branch=master)](https://travis-ci.com/PeterDaveHello/docker-yamllint)
[![Docker Hub pulls](https://img.shields.io/docker/pulls/peterdavehello/yamllint.svg)](https://hub.docker.com/r/peterdavehello/yamllint/)
[![Docker image layers](https://images.microbadger.com/badges/image/peterdavehello/yamllint.svg)](https://microbadger.com/images/peterdavehello/yamllint/)
[![Docker image version](https://images.microbadger.com/badges/version/peterdavehello/yamllint.svg)](https://hub.docker.com/r/peterdavehello/yamllint/tags/)

[![Docker Hub badge](http://dockeri.co/image/peterdavehello/yamllint)](https://hub.docker.com/r/peterdavehello/yamllint/)

Dockerized [yamllint](https://github.com/adrienverge/yamllint) with various versions, easy to use and easy to integrate with CI.

## Table of Contents

- [Usage](#usage)
  - [Command line](#command-line)
    - [Use latest version](#use-latest-version)
    - [Use specific version](#use-specific-version)
  - [Continuous Integration (CI)](#continuous-integration-ci)
    - [Travis CI](#travis-ci)
    - [GitLab CI](#gitlab-ci)
- [Build](#build)

## Usage

### Command line

#### Use latest version

```sh
docker run --rm -v $PATH_TO_YAML:/yaml peterdavehello/yamllint YAML_FILE.yml

# Please replace "$PATH_TO_YAML" with your custom path,
# and replace "YAML_FILE.yml" with your real yaml file filename.
```

#### Use specific version

Just like above, but you can specify version of yamllint, for example:

```sh
docker run --rm -v $PATH_TO_YAML:/yaml peterdavehello/yamllint:1.16.0 YAML_FILE.yml

# Please replace "1.16.0" with the version number you want.
# Don't forget to replace "$PATH_TO_YAML" & "YAML_FILE.yml".
```

### Continuous Integration (CI)

#### Travis CI

Enable Docker service in your `.travis.yml`:

```yaml
services:
  - docker
```

And use the same command in the `scripts` part as the command line mentions, for example:

```yaml
services:
  - docker

scripts:
  - docker run --rm -v $TRAVIS_BUILD_DIR:/yaml peterdavehello/yamllint:1.16.0 .travis.yml
```

This will lint the Travis CI config file `.travis.yml`

#### GitLab CI

Add this block to your `.gitlab-ci.yml`:

```yaml
yamllint:
  stage: lint
  variables:
    yamllint_version: "1.16.0"
  image: peterdavehello/yamllint:$yamllint_version
  only:
    changes:
      - "**/*.yml"
      - "**/*.yaml"
  script:
    - find . -name "*.yml" -o -name "*.yaml" | xargs -n 1 yamllint
```

Replace "1.16.0" with the version you want to use, you can also use "latest" for the very new version.

## Build

Build command, you need to specify a valid yamllint version argument to `YAMLLINT_VERSION`:

```sh
docker build --build-arg YAMLLINT_VERSION="1.16.0" -t docker-yamllint .

# Replace "docker-yamllint" with the preferred image name
```

You can find a valid version in the [release history](https://pypi.org/project/yamllint/#history) on PyPI, or just poke the [API](https://pypi.org/pypi/yamllint/json) to retrieve more details.
