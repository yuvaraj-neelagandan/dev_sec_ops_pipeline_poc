FROM node:20.6.1-alpine as build-step
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
COPY package.json /app
# RUN npm ci
COPY . .
RUN npm install
RUN npm run build --prod
# RUN npm start
FROM nginx:1.17.1-alpine
COPY --from=build-step /app/docs /usr/share/nginx/html
