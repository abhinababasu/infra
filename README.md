infra
=====
nginx based reverse proxy that is run on my vm

How it works
------------

```mermaid
graph TD;
    Web(bonggeek)-->nginx;
    nginx --> default;
    nginx(/elemental) --> localhost:8080;
    nginx(/wordament) --> localhost:8090;

```

Build
-----
``` bash
./build.sh
```

Deploy
------
``` bash
sudo bash
curl -fsSL "https://raw.githubusercontent.com/abhinababasu/infra/main/deploy.sh?token=GHSAT0AAAAAAB26S7FFMCSRHQ23PFOQPDTGY4HBHLA" | bash
```
