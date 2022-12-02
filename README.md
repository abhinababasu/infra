infra
=====
nginx based reverse proxy that is run on my vm

How it works
------------

```mermaid
graph TD;
    Web[Single Page App] --> |REST| RevProxy[nginx container on :80];
    RevProxy --> |/| default[index.html];
    RevProxy --> |/elemental| elemental[elemental app container :8080];
    RevProxy --> |/wordament| wordament[wordament app container :8090];

```

Build
-----
``` bash
./build.sh
```

Deploy
------
Just this container can be run with
``` bash
sudo bash
curl -fsSL "https://raw.githubusercontent.com/abhinababasu/infra/main/deploy.sh?token=GHSAT0AAAAAAB26S7FFMCSRHQ23PFOQPDTGY4HBHLA" | bash
```

All containers can be depoloyed with
``` bash
sudo bash
curl -fsSL "https://raw.githubusercontent.com/abhinababasu/infra/main/deployall.sh?token=GHSAT0AAAAAAB26S7FFMCSRHQ23PFOQPDTGY4HBHLA" | bash
```