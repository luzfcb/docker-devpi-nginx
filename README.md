
[![Updates](https://pyup.io/repos/github/luzfcb/docker-devpi-nginx/shield.svg)](https://pyup.io/repos/github/luzfcb/docker-devpi-nginx/)


REQUIRE: Docker >= 1.11.2 and docker-compose >= 1.7.0

```bash
git clone https://github.com/luzfcb/docker-devpi-nginx.git
```


Edit the `docker-compose.yml` and change value of `DEVPI_PASSWORD`


```bash
cd docker-devpi-nginx


docker-compose up -d
```

wait build a conteiner


Next, on the users machines, configure pip to use the devpi server:

create `pip.conf` in `$HOME/.config/pip/`

```bash
mkdir -p $HOME/.config/pip/

nano $HOME/.config/pip/pip.conf

```

add:

```bash

[global]
index-url = http://root:DEVPI_PASSWORD@DOCKER_SERVER_EXTERNAL_IP:4040/root/pypi/+simple/
trusted-host = DOCKER_SERVER_EXTERNAL_IP


```

one line version:
```bash
mkdir -p ~/.config/pip/ ; echo -e "[global]\nindex-url = http://root:DEVPI_PASSWORD@DOCKER_SERVER_EXTERNAL_IP/root/pypi/+simple/\ntrusted-host = DOCKER_SERVER_EXTERNAL_IP\nextra-index-url = https://pypi.python.org/simple" | tee ~/.config/pip/pip.conf

```



https://pip.pypa.io/en/stable/user_guide/#config-file




