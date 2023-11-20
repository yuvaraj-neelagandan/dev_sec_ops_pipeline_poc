# Stage 1
FROM node:20.6.1-alpine as build-step
RUN mkdir -p /app
WORKDIR /app
COPY package.json /app
COPY . /app
RUN npm install
RUN npm run build --prod
# Stage 2
FROM nginx:1.17.1-alpine
COPY --from=build-step /app/docs /usr/share/nginx/html
