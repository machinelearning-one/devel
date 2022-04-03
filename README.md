<div align="center">

# machinelearning-one/devel

A clean template to kick-start your deep learning research 🚀⚡🔥<br>

_Suggestions are always welcome!_

![](https://resources.machinelearning.one/devel.png)

</div>

## What's included in the image?

- Python 3.8
    - [`numpy`](https://numpy.org)
    - [`scipy`](https://www.scipy.org)
    - [`pandas`](https://pandas.pydata.org)
    - [`scikit-learn`](https://scikit-learn.org)
        - [`scikit-image`](https://scikit-image.org)
    - [`matplotlib`](https://matplotlib.org)
    - [`seaborn`](https://seaborn.pydata.org)
    - [`torch`](https://pytorch.org)
        - [`torchvision`](https://pytorch.org/vision)
        - [`torchaudio`](https://pytorch.org/audio)
        - [`pytorch-lightning`](https://www.pytorchlightning.ai)
    - [`einops`](https://einops.rocks)
    - [`hydra-core`](https://hydra.cc)
- [`Jupyterlab`](https://jupyter.org)
- [`OpenCV`](https://opencv.org)

## What's included in this repo?

- An _example .env_ file to parametrize the build process
- A modular and easily customizable _Dockerfile_ that defines the installation of above mentioned packages
- A _docker-compose.yml_ file to handle lifecycle events such as building the image, spinning up the container and tearing it down.
- A .vscode/extensions.json file to recommend the necessary extensions to effectively use generated containers through vs code.

## Prerequisites

Download and install:

- [Docker](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-20-04) 
- [Docker Compose](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-compose-on-ubuntu-20-04)
- [NVIDIA Container Toolkit](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/install-guide.html#docker)
- [VS Code](https://code.visualstudio.com/)

## Getting Started

1. Clone the repository:

```sh
git clone https://github.com/machinelearning-one/devel.git
```

2. Open directory in VS Code and accept installing recommended extensions if prompted:
   
```sh
cd devel
code .
```

3. Set up environment variables and rename the example file:

```sh
mv .env.example .env
```
4. Create a shared directory to be mapped into the container:

```sh
export SHARED_DIR=<SHARED_DIR>
mkdir -p $SHARED_DIR
```

5. Enable Buildkit for faster and cacheable builds:
```sh
export DOCKER_BUILDKIT=1
export COMPOSE_DOCKER_CLI_BUILD=1
```

6. Set the password and start the build:

```sh
docker compose build --build-arg PASSWORD=<PASSWORD>
```

7. Instantiate the container:
```sh
docker compose up -d
```

8. Start developing!

> _Navigate to Remote Explorer tab on the sidebar and click on attach to the container to have a holistic development experience._

## Notes

**SSH Key Generation**: 

To push code to remote repositories, it is recommended to use ssh over https. To generate a key pair, run the following command:

```sh
ssh-keygen -t ed25519 -C "<comment>"
```
It is recommended you set up a passphrase different from user password.

If you accept the default prompt for the location, public key can be found at `~/.ssh/id_ed25519.pub`, otherwise it would be at the location you specified.

Copy the public key and follow the instructions of your VCS provider (GitHub/GitLab etc.) to assign it as trusted.

**Recursive Containerization**

You might need to use containers from your development environment for reasons such as (1) Developing containers, (2) Avoiding installation of heavy dependencies etc. 

The recommended approach to do so is Docker out of Docker specified [here](https://jpetazzo.github.io/2015/09/03/do-not-use-docker-in-docker-for-ci/)

To use recursive containerization, run the following commands first and then follow the same steps as above to build and start the container:

1. To switch to appropriate branch:

```sh
git checkout variant/recursive
```

2. To avoid using sudo to access docker daemon from the container
   
```sh
export DOCKER_GROUP=`stat -c '%g' /var/run/docker.sock`
```

The `variant/recursive` branch provides logic for mounting the docker socket and the python sdk. A full cli inside the container is out of scope of this template and isn't recommended.

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