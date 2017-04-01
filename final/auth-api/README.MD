# todo

```
docker build -t auth-api .
```

```
docker run -d --name auth-api -p 8090:8090 --link mysql:db --link token-api:tokenservice auth-api
```
