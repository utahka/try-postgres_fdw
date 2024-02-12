# try-postgres_fdw

■ イメージビルド

```sh
docker build -t try-postgres_fdw --platform linux/amd64 .
```

■ コンテナ起動

```sh
docker compose up -d
```

■ コンテナの作り直し

```sh
docker compose down
rm -rf ./volumes
docker compose up -d
```
