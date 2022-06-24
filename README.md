# Magento2 Container Build Pipeline

Installs Magento2 via Composer, builds container image and pushes it to registry.

Github Action is currently configured to build images for Magento Community [2.4.4](https://github.com/PHOENIX-MEDIA/magento2-build/blob/main/.github/workflows/docker-image.yml#L6). Images are available on [DockerHub](https://hub.docker.com/r/phoenixmedia/magento2).

The build process is based on additionali OpenSource Composer packages maintained by [PHOENIX MEDIA](https://github.com/PHOENIX-MEDIA).
