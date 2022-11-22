FROM node:18-alpine

RUN apk -U upgrade && apk add git
ENV NODE_ENV production

WORKDIR /app


COPY package*.json ./

RUN NODE_ENV=development npm install
COPY . .

RUN npm run build

EXPOSE 3001
CMD [ "npm","run", "start" ]