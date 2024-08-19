FROM node:20-alpine as angular
WORKDIR /ng-app
COPY package*.json .
RUN npm ci
COPY . .
RUN npm run build

FROM nginx:alpine
ARG name
# ENV name=saurabh
COPY --from=angular /ng-app/dist/myapp/browser /usr/share/nginx/html
EXPOSE 80