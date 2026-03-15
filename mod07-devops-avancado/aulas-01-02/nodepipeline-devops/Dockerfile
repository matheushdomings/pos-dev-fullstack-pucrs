FROM node:18
RUN apt-get update && apt-get install -y git imagemagick
WORKDIR /ecs-app

COPY package*.json ./
COPY . .

RUN npm install
RUN chown -R node:node /ecs-app

ENV NODE_ENV=production
ENV ENV_ECS=true
ENV PORT=80
USER root
EXPOSE 80

ENTRYPOINT ["npm", "start"]
