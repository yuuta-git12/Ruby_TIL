FROM ruby:3.3
# apt-get update -qq:Linuxでインストール可能なパッケージの「一覧」を更新する(インストール、アップデートはしない)
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
WORKDIR /app
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN bundle install
ENV LANG=ja_JP.UTF-8
ENV TZ=Asia/Tokyo