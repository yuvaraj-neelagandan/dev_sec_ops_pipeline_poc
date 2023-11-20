FROM node:20.6.1-alpine as build
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
COPY package.json /app
# RUN npm ci
COPY . .
RUN npm install
RUN npm run build
FROM nginx:latest
COPY --from=build dist/dev_sec_ops_pipeline_poc /usr/share/nginx/html
EXPOSE 80
