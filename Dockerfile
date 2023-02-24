FROM python:3.10-alpine3.16 

# tell python not buffer the output. makes sure puts are realiable
ENV PYTHONUNBUFFERED 1

COPY requirements.txt /requirements.txt 
RUN apk add --upgrade --no-cache build-base linux-headers &&\
    pip install --upgrade pip && \
    pip install -r /requirements.txt 

COPY app/ /app
WORKDIR /app

# add user that will help us run the django application. We are not going to run in oot user mode 
RUN adduser --disabled-password --no-create-home django

# swtich this user django
USER django

# run this wsgi commads to run the servers
CMD ["uwsgi", "--socket", ":9000", "--workers", "4", "--master", "--enabled-threads", "--module", "app.wsgi"]