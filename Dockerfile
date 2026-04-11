FROM ghcr.io/gohugoio/hugo:latest AS build

WORKDIR /app
COPY . .
RUN hugo

FROM nginxinc/nginx-unprivileged:alpine

COPY nginx/redirect.conf /etc/nginx/conf.d/
COPY --from=build /app/public /usr/share/nginx/html
