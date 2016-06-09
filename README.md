docker-clearvm
==============
Run ClearLinux VM inside docker containers by using [RancherVM Project](https://github.com/rancher/vm)

How to build it?
----------------
```
  git clone https://github.com/obedmr/docker-clearvm
  cd docker-clearvm/
  docker build -t obedmr/clearvm .
```

RancherVM Web Administration tool
---------------------------------
In order to make it easier to admin, you can use the RancherVM webapp
```
  docker run -d -v /var/run:/var/run -p 8080:80 \
      --name web-ranchervm -v /var/lib/rancher/vm:/vm rancher/ranchervm
  
```

Let's run it ...
----------------
You can just use the run.sh script to run it

```
  ./run.sh
```

Then, you can access the wen console at:
```
  http://localhost:8080
```