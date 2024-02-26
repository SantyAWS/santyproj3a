FROM python:3.10-slim-buster
# FROM public.ecr.aws/docker/library/python:3

USER root

WORKDIR /src

COPY ./requirements.txt requirements.txt

RUN chmod 1777 /tmp 


# Installing postgres binaries
RUN apt-get update -y && apt-get install -y build-essential libpq-dev

#additional code to install psql
RUN apt-get install -y postgresql-client 

# Installing dependencies
RUN pip install -r requirements.txt

COPY . .

CMD python app.py

