### STAGE 1: Build ###
FROM node:latest AS build
WORKDIR /usr/local/app
COPY ./ /usr/local/app/
RUN npm install
RUN npm run build

### STAGE 2: Run ###

FROM nginx:latest
# COPY nginx.conf /etc/nginx/nginx.conf
COPY --from=build /usr/src/local/dist/dev_sec_ops_pipeline_poc /usr/share/nginx/html
EXPOSE 4200