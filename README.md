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