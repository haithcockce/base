# base

Homebase for all my stuff. 

### Contents

* `base.py` the main backend for the webserver (written in 
  [flask](http://flask.pocoo.org/)). 
* `content/` HTML/CSS/JS guts of the site
* `Dockerfile` build file for the docker container

### How to run it
```bash
docker build -t base:latest
docker run -it --rm -p 80:80 -v <PROJ ROOT>:/base base:latest
```
