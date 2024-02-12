\c app

-- postgres_fdw をインストール
CREATE EXTENSION postgres_fdw WITH SCHEMA public;

-- fdw の権限を app ロールに付与
GRANT USAGE ON FOREIGN DATA WRAPPER postgres_fdw TO app;

-- cs_dblink サーバーを作成
CREATE SERVER cs_dblink
  FOREIGN DATA WRAPPER postgres_fdw
  OPTIONS (dbname 'cs');

-- cs_dblink サーバーの権限を app ロールに付与
GRANT USAGE ON FOREIGN SERVER cs_dblink TO app;

-- USER MAPPING を作成 (Docker 環境では、password_required=false でないとコケる)
CREATE USER MAPPING
  FOR app SERVER cs_dblink
  OPTIONS (user 'app', password_required 'false');

-- cs まわりの最低限の権限を app に付与
\c cs
GRANT USAGE ON SCHEMA public TO app;
GRANT SELECT ON customers TO app;

-- cs.public から customers をインポート
\c app app
IMPORT FOREIGN SCHEMA public
  LIMIT TO (customers)
  FROM SERVER cs_dblink INTO public;
