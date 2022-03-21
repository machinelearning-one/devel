<div align="center">

# machinelearning-one/devel

A clean template to kick-start your deep learning research 🚀⚡🔥<br>

_Suggestions are always welcome!_

![](https://resources.machinelearning.one/devel.png)

</div>

## Prerequisites

Download and install:

- [Docker](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-20-04) 
- [Docker Compose](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-compose-on-ubuntu-20-04)
- [NVIDIA Container Toolkit](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/install-guide.html#docker)
- [VS Code](https://code.visualstudio.com/)

## Getting Started

Clone the repository:

```sh
git clone https://github.com/machinelearning-one/devel.git
cd devel
```

Set up environment variables and rename the example file:

```sh
mv .env.example .env
```

Build and save the image:

```sh
export DOCKER_BUILDKIT=1
export COMPOSE_DOCKER_CLI_BUILD=1
docker compose build --build-arg PASSWORD={PASSWORD}
```

Create a shared directory and instantiate the container:

```sh
export SHARED_DIR={SHARED_DIR}
mkdir -p $SHARED_DIR
docker compose up -d
```
Use VS Code's remote containers extension to connect to the container to have a holistic development experience.


## Cleanup

To remove the container, run the following command from the same folder:

```sh
docker compose down
```

## License

This project is licensed under the MIT License.

```
MIT License

Copyright (c) 2022 machinelearning-one

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```