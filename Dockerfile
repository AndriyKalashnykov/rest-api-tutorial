FROM node:15-alpine as build

RUN mkdir -p /app

WORKDIR /app

COPY . .

RUN sed -i "s/mongodb:\/\/localhost/mongodb:\/\/mongo/g" common/services/mongoose.service.js

RUN npm install -g npm@7.9.0
RUN npm install express mongoose --save
EXPOSE 3600
CMD ["npm", "run", "start"]

# RUN yarn
# RUN yarn build
# # production environment
# FROM nginx:stable-alpine
# COPY --from=build /app/build /usr/share/nginx/html
# COPY --from=build /app/nginx/nginx.conf /etc/nginx/conf.d/default.conf
# EXPOSE 80
# CMD ["nginx", "-g", "daemon off;"]