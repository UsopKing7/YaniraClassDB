FROM node:22-bookworm-slim

RUN apt-get update && apt-get install -y swi-prolog postgresql-client

WORKDIR /app

COPY package*.json ./

RUN npm install --only=production

COPY . .
RUN npm run build

RUN cp src/prolog/base_conocimiento.pl dist/services/base_conocimiento.pl

EXPOSE 3000
CMD [ "node", "dist/app.js" ]

