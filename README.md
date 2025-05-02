# README

Simple script to run [zimit](https://github.com/openzim/zimit) with fewer mistakes.

Usage:

``` bash
bash ./zimit.sh URL ARCHIVE-NAME
```

The archive name you supply will be used to 1) make a folder in your working directory, 2) label the archive, and 3) name a docker container. If a docker container already exists with this name, it will be removed first. Docker will run headlessly (`-d`) and will remove the container afterwards (`--rm`).
