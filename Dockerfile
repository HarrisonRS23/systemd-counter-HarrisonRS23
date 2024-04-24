# syntax=docker/dockerfile:1

FROM ubuntu:latest
WORKDIR /app
COPY . .
#RUN yarn install --requirements
#CMD ["node", "src/index.js"]
# EXPOSE 3000
