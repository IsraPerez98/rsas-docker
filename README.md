# rsas-docker

This is a docker image for the [Rocket Streaming Audio Server (RSAS)](https://rocketbroadcaster.com/streaming-audio-server/)

## Installation

- Pull the image from docker hub

```bash
docker pull israperez98/rsas
```

- Build the image from the Dockerfile

```bash
docker build -t israperez98/rsas https://github.com/IsraPerez98/rsas-docker
```

## Usage

### docker run

```bash
docker run --name rsas -d --restart=always \
--publish 8000:8000 \
--volume /path/to/your/rsas.xml:/etc/rsas/rsas.xml \
--volume /path/to/your/license.key:/etc/rsas/license.key \
israperez98/rsas
```
### docker-compose

```yaml

version: "3"

services:

  rsas:
    image: israperez98/rsas
    container_name: rsas
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

## License

[MIT](https://choosealicense.com/licenses/mit/)