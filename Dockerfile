FROM node:14-alpine
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
COPY package.json /app
# RUN npm ci
COPY . .
RUN ng serve
# RUN npm run build --prod
EXPOSE 4200
CMD ["npm", "start"]