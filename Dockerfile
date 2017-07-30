FROM node:7

COPY ./clicker-react/package.json /clicker-react/
RUN cd /clicker-react && npm install

COPY ./clickery-socket/package.json /clickery-socket/
RUN cd /clickery-socket && npm install

COPY ./clickery-socket /clickery-socket
COPY ./clicker-react /clicker-react

RUN mkdir /clickery-socket/public
RUN cd /clicker-react && npm run build-deploy

WORKDIR /clickery-socket
RUN npm run build
EXPOSE 5555
ENV NODE_ENV production
CMD npm run prod
