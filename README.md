## Rails Template
Railsアプリを構築するためのdocker環境構築用テンプレート

## How to use
必要に応じて項目を追記した上で
```bash
docker-compose build
docker-compose run web rails new . --force --database=mysql
```
gemfileにmysql2を追記
```
# Gemfile

source 'https://rubygems.org'

gem 'rails', '~> 6.1.4'
gem 'mysql2', '>= 0.5.3'

```
config/database.ymlを編集
```
default: &default
  adapter: mysql2
  encoding: utf8
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
  host: db
  username: user
  password: password
```

アプリを起動
```
docker compose up
```
```
docker-compose run web rake db:create
```
`http://localhost:3000`にアクセス