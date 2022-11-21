FROM node:18-alpine

RUN apk -U upgrade && apk add git

ENV NODE_ENV production
WORKDIR /app

COPY  package.json  ./
COPY src /app/
COPY tsconfig.build.json tsconfig.json /app/
 
WORKDIR /app/

RUN NODE_ENV=development yarn install
EXPOSE 3001
RUN yarn build

CMD [ "yarn","start" ]