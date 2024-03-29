# Magento2 Container Build Pipeline

Installs Magento2 via Composer, builds container image and pushes it to registry. The scripts and pipelines in this repository basically implement the ideas described in the [Running Magento2 in Kubernetes Part 2 article on Medium](https://medium.com/swlh/running-magento2-in-kubernetes-part-2-building-the-docker-image-8516c0ed7d48).

Github Action is currently configured to build images for Magento Community [2.4.6](https://github.com/PHOENIX-MEDIA/magento2-build/blob/main/.github/workflows/docker-image.yml#L6). Images are available on [DockerHub](https://hub.docker.com/r/phoenixmedia/magento2).

The build process is based on additionali OpenSource Composer packages maintained by [PHOENIX MEDIA](https://github.com/PHOENIX-MEDIA).

To manually execute the pipeline steps run the following command to prepare all Magento2 files first: `MAGENTO_VERSION=2.4.6 ./build.sh`.
Once all files are downloaded the Magento2 container image can be build: `docker build .`
