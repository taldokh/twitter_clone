# syntax=docker/dockerfile:1

FROM node:12.18.3

WORKDIR /app

COPY package.json package.json
COPY package-lock.json package-lock.json

RUN npm install --only=prod

COPY . .

CMD ["node", "build/app.js"]


