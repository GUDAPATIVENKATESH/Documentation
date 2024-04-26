Docker Installation in RHEL 8.8 from Binaries
---------------------------------------------
* Followed official [docker](https://docs.docker.com/engine/install/binaries/#install-daemon-and-client-binaries-on-linux) installation guide.
* Download required [docker version](https://download.docker.com/linux/static/stable/x86_64/) binarie tal file.
* Add the required version `docker-*.tgz` file to `/tmp` folder.
* Untar it with `tar -xvzf docker-*.tgz`, after this `docker` folder will get created with below pacakges.
    ```
    docker-proxy
    docker-init
    container-shim-runc-v2
    dockerd
    containerd
    runc
    ctr
    ```
* Copy the `docker` folder to `/usr/bin` directory, for adding `docker` to `PATH`.
    `sudo cp docker/* /usr/bin/`
* Start `docker daemon` as a background process `sudo dockerd &`.
* Check the `docker` version and `docker network` for cross check.
