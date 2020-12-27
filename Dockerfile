FROM node:14.15.1-alpine as build
WORKDIR /usr/src/app
COPY ./ ./
RUN npm install
RUN npm run build:p


FROM nginx as web-server
ENV API_LOCATION /api/thunder/
ENV API_PATH http://localhost:8090/storm/
ENV PROXY_COOKIE_PATH_ORIGIN /storm
ENV PROXY_COOKIE_PATH_TARGET /api/thunder

COPY --from=build /usr/src/app/nginx/run.sh /www/html/run.sh
COPY --from=build /usr/src/app/nginx/bookrenting.conf /www/html/bookrenting.conf
COPY --from=build /usr/src/app/dist/book-renting-front /www/html/bookrenting

RUN chmod 777 /www/html/run.sh

CMD /www/html/run.sh
