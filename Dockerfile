FROM python:3.6-slim
RUN mkdir /helloworld
WORKDIR /helloworld
ADD . /helloworld
RUN pip install -r requirement.txt
EXPOSE 8000
CMD python manage.py runserver 0:8000
