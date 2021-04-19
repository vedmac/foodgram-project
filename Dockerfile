FROM python:3.8-alpine as builder


ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
ENV APP_HOME=/usr/src/web

RUN apk update \
    && apk add --no-cache postgresql-dev gcc python3-dev musl-dev wkhtmltopdf zlib zlib-dev jpeg-dev \
    && ln -s /lib/libz.so /usr/lib/

COPY ./requirements.txt ./

RUN python3 -m pip install --upgrade pip \
    && pip3 install -r requirements.txt --no-cache-dir

WORKDIR $APP_HOME
COPY . $APP_HOME
RUN chmod a+x /usr/src/web/entrypoint.sh
ENTRYPOINT [ "/usr/src/web/entrypoint.sh" ]
CMD gunicorn foodgram.wsgi:application --bind 0.0.0.0:8000