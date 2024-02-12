# try-postgres_fdw

- 記事 : [【PostgreSQL】potgres_fdw を使って同インスタンス上の別 DB を参照してみた | Zenn](https://zenn.dev/utahka/articles/4238218058f5f2)

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
