# Dockerfile

FROM ruby:3.0.2

# 環境変数の設定
ENV LANG C.UTF-8
ENV TZ Asia/Tokyo

# 依存関係のインストール
RUN apt-get update -qq && apt-get install -y nodejs default-mysql-client build-essential libmysqlclient-dev

# 作業ディレクトリの設定
WORKDIR /myapp

# GemfileとGemfile.lockをコピー
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock

# Gemのインストール
RUN bundle install

# アプリケーションのコードをコピー
COPY . /myapp

# ポート3000を公開
EXPOSE 3000

# アプリケーション起動コマンド
CMD ["rails", "server", "-b", "0.0.0.0"]
