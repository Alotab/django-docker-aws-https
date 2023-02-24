# django-docker-aws-https
Django deploy with HTTPS with letsencrypt


Run the docker-compose.yml and create a django app
`docker-compose run --rm app sh -c "django-admin startproject app ."`

Run the app on port 127.0.0.1:8000
`docker compose up`

create an app inside the project
`docker-compose run --rm app sh -c "python manage.py startapp home"`

## setup nginx

cd docker/proxy
`docker build .`