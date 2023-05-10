# for syntax details, see https://docs.docker.com/engine/reference/builder/
# trick to get environment variables https://vsupalov.com/docker-build-pass-environment-variables/
FROM python:3.11-slim

ARG api_ip

ENV TODO_API_IP=${api_ip}

WORKDIR /opt/app

COPY requirements.txt .

RUN pip install -r requirements.txt

EXPOSE 5000/tcp

COPY todolist.py .

COPY templates/ templates/

ENTRYPOINT ["python"]
CMD ["todolist.py"]