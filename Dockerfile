# /path/to/app/Dockerfile
FROM ruby:3.0.2-alpine

# Установка часового пояса
RUN apk add --update tzdata && \
    cp /usr/share/zoneinfo/Europe/London /etc/localtime && \
    echo "Europe/London" > /etc/timezone

# Установка в контейнер runtime-зависимостей приложения
RUN apk add --update --virtual runtime-deps postgresql-client nodejs libffi-dev readline sqlite

# Соберем все во временной директории
WORKDIR /tmp
ADD Gemfile* ./

RUN apk add --virtual build-deps build-base openssl-dev postgresql-dev libc-dev linux-headers libxml2-dev libxslt-dev readline-dev && \
    bundle install --jobs=2 && \
    apk del build-deps

# Копирование кода приложения в контейнер
ENV APP_HOME /app
COPY . $APP_HOME
WORKDIR $APP_HOME

# Настройка переменных окружения для production
ENV RAILS_ENV=development \
    RACK_ENV=development

# Проброс порта 3000 
EXPOSE 3000

# Запуск по умолчанию сервера puma
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]      