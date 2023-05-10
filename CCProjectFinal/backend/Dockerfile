# for syntax details, see https://docs.docker.com/engine/reference/builder/
# trick to get environment variables https://vsupalov.com/docker-build-pass-environment-variables/
FROM python:3.11-slim

WORKDIR /opt/app

COPY requirements.txt .

RUN pip install -r requirements.txt

EXPOSE 5001/tcp

RUN apt-get update -y && apt-get upgrade -y && \
    apt-get install -y wget

COPY startup.sh .
COPY todolist_api.py .

CMD ["bash", "-c", "./startup.sh"]