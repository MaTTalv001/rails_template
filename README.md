## Rails Template
Railsアプリを構築するためのdocker環境構築用テンプレート

## How to use
環境変数ファイルを追加
```
touch .env.local
```
その他、必要に応じて項目を追記した上で
```bash
docker-compose run web rails new . --force --database=mysql --skip-docker
```
config/database.ymlを編集
```
default: &default
  adapter: mysql2
  encoding: utf8mb4
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
  username: root
  # 下記2 行を修正
  password: password
  host: db
```

アプリを起動
```
docker compose exec backend bash
rails db:create 
```
```
docker-compose run web rake db:create
```
```
touch .gitignore
```
.env.localに追加
```
#追記
.env.local
```
`http://localhost:3000`にアクセス