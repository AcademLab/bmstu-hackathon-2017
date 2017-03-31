docker build -t token-api .
docker run -d --name token-api -p 8091:8091 --link mysql:db token-api

