FROM node:7

COPY ./clicker-react/package.json /clicker-react/
RUN cd /clicker-react && npm install

COPY ./node-clicker-api/package.json /node-clicker-api/
RUN cd /node-clicker-api && npm install

COPY ./node-clicker-api /node-clicker-api
COPY ./clicker-react /clicker-react

RUN mkdir /node-clicker-api/public
RUN cd /clicker-react && npm run build-deploy

WORKDIR /node-clicker-api

EXPOSE 3000

CMD npm run start
