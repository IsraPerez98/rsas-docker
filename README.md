# rsas-docker
[![Docker Image CI](https://github.com/IsraPerez98/rsas-docker/actions/workflows/docker-image.yml/badge.svg)](https://github.com/IsraPerez98/rsas-docker/actions/workflows/docker-image.yml)
[![Docker Pulls](https://img.shields.io/docker/pulls/israperez98/rsas-docker)](https://hub.docker.com/r/israperez98/rsas-docker)
[![Docker Image Size](https://img.shields.io/docker/image-size/israperez98/rsas-docker/latest)](https://hub.docker.com/r/israperez98/rsas-docker)
[![License](https://img.shields.io/github/license/IsraPerez98/rsas-docker)](https://github.com/IsraPerez98/rsas-docker/blob/master/LICENSE)

This is a docker image for the [Rocket Streaming Audio Server (RSAS)](https://rocketbroadcaster.com/streaming-audio-server/)

## Installation

- Pull the image from docker hub

```bash
docker pull israperez98/rsas-docker
```

- Build the image from the Dockerfile

```bash
docker build -t israperez98/rsas-docker https://github.com/IsraPerez98/rsas-docker
```

## Usage

### docker run

```bash
docker run --name rsas-docker -d --restart=always \
--publish 8000:8000 \
--volume /path/to/your/rsas.xml:/etc/rsas/rsas.xml \
--volume /path/to/your/license.key:/etc/rsas/license.key \
israperez98/rsas-docker
```
### docker-compose

```yaml

version: "3"

services:

  rsas-docker:
    image: israperez98/rsas-docker
    container_name: rsas-docker
    restart: always
    ports:
      - 8000:8000
    volumes:
      - /path/to/your/rsas.xml:/etc/rsas/rsas.xml
      - /path/to/your/license.key:/etc/rsas/license.key
```

Keep in mind that the `rsas.xml` file must be configured to use the same ports as the ones you are publishing in the docker run command.

The `license.key` file is optional, if you don't have one you can use the free version of RSAS.

An example of the `rsas.xml` file is provided in this repository, for more information about the configuration of RSAS check the [official documentation](https://www.rocketbroadcaster.com/streaming-audio-server/docs/configuration/).