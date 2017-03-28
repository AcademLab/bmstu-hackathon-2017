# Places-api

build
```
docker build -t places-api .
```

run
```
docker run -d --name places-api -p 8081:8080 --link mysql:db places-api
```
