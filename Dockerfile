FROM python:3.9

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
RUN mkdir /code
WORKDIR /code
RUN pip install --upgrade pip
COPY requirements.txt /code/

RUN pip install -r requirements.txt
COPY app_python /code/

RUN chown daemon:daemon -R /home/app
VOLUME /etc/files/

EXPOSE 8000

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]