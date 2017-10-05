```
docker build -t daronco/presentations .
docker run --rm -v `pwd`/mconf-docker-ansible/images:/opt/presentation/images -v `pwd`/mconf-docker-ansible/index.html:/opt/presentation/index.html -p 8000:8000 daronco/presentations
```
