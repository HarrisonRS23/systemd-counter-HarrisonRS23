# syntax=docker/dockerfile:1

FROM ubuntu:latest
WORKDIR /app
COPY . .
COPY startCounter.sh /startCounter.sh
RUN chmod +x /startCounter.sh
#RUN yarn install --requirements
CMD ["/startcounter.sh"]
# EXPOSE 3000
