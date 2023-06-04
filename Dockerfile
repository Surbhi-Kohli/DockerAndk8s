FROM node:14

WORKDIR /app

COPY package.json .

RUN npm install

COPY . .

ARG DEFAULT_PORT=80

ENV PORT $DEFAULT_PORT



EXPOSE $PORT


VOLUME ["/app/node_modules"]
# This is the path inside of the container, that should be mapped to some path 
# outside of the container,where data should servive.This will create anonymous volume

CMD ["npm","start"]