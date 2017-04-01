# todo

```
docker build -t image-api .
```

```
docker run -d --name image-api -p 8092:8092 --link mysql:db --link token-api:tokenservice image-api
```
