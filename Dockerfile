# Stage 1

FROM node:14.20.1-alpine as build-step

# RUN mkdir -p /usr/src/app

WORKDIR /usr/src/app

COPY package.json package.json

COPY . .
# COPY . /app

# RUN ng build --prod

RUN npm install

RUN npm run build --prod

# Stage 2
# FROM nginx:1.17.1-alpine

# COPY --from=build-step /app/dist /usr/share/nginx/html

FROM nginx:1.17.1-alpine
COPY --from=build-step /usr/src/app/dist /usr/share/nginx/html
# EXPOSE 80 443
# CMD [ "nginx", "-g", "daemon off;" ]