# Profiles-api

build
```
docker build -t profiles-api .
```

run
```
docker run -d --name profiles-api -p 8080:8080 --link mysql:db profiles-api
```

sql
```
INSERT into user values ("test","test","test","test","test","test");
```