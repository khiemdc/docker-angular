## Build Angular application ##

FROM node:8 as builder

COPY angular-app /angular-app
WORKDIR angular-app

RUN npm install
RUN $(npm bin)/ng build

## Run nginx to ser angular application ##

FROM nginx

COPY --from=builder /angular-app/dist/* /usr/share/nginx/html/

EXPOSE 80