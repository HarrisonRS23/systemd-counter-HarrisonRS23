# syntax=docker/dockerfile:1

FROM ubuntu:latest
WORKDIR /app
COPY . .
#COPY startCounter.sh /app/startCounter.sh
#RUN chmod +x /app/startCounter.sh
#RUN yarn install --requirements
RUN apt-get update && apt-get install -y python3
CMD ["python3", "/app/src/counter.py"]
# EXPOSE 3000
