# syntax=docker/dockerfile:1

FROM ubuntu:latest
WORKDIR /app
COPY . .
RUN apt-get update && apt-get install -y python3
CMD ["python3", "/app/src/counter.py"]
