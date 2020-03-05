FROM ubuntu

RUN apt-get update
RUN apt-get install python python-pip -y
RUN pip install flask
RUN pip install flask-mysql

COPY app.py /opt/app.py

ENTRYPOINT FLASK_APP=/opt/app.py flask run --host=0.0.0.0
