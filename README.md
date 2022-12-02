infra
=====
nginx based reverse proxy that is run on my vm

How it works
------------

```mermaid
graph TD;
    Web[Single Page App] --> RevProxy[nginx container on :80];
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
``` bash
sudo bash
curl -fsSL "https://raw.githubusercontent.com/abhinababasu/infra/main/deploy.sh?token=GHSAT0AAAAAAB26S7FFMCSRHQ23PFOQPDTGY4HBHLA" | bash
```
