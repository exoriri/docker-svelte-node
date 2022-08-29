#Загружаем образ минифицированный образ node
#base это наше общее окружение
FROM node:18.8.0-alpine as base

#Устанавливаем рабочую директорию frontend в докер контейнере
WORKDIR /usr/app/frontend
#Копируем все файлы frontend в директорию в контейнере
COPY ./frontend /usr/app/frontend
#Устанавливаем зависимости
RUN npm install
#Делаем так, чтобы порт был доступен вне контейнера
EXPOSE 8080
EXPOSE 24678

#Устанавливаем рабочую директорию backend в докер контейнере
WORKDIR /usr/app/backend
#Копируем все файлы backend в директорию в контейнере
COPY ./backend /usr/app/backend/
#Устанавливаем зависимости
RUN npm install
#Делаем так, чтобы порт был доступен вне контейнера
EXPOSE 1000

#Команды для dev окружения
FROM base as dev
#...Тут команды для dev

#Команды для prod окружения
FROM base as prod
#...Тут команды для prod
ENV NODE_ENV=production