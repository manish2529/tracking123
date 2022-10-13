FROM python:3

RUN apt-get update && apt-get install sudo -y

RUN pip install django==3.2 && pip install xlwt

RUN pip install mysqlclient

COPY . .

RUN  python3 manage.py migrate

CMD ["python3","manage.py","runserver","0.0.0.0:8000"]

