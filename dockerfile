FROM ubuntu
COPY simpleApp /root/Jenkins/Django
RUN apt-get -y update
RUN apt-get install python3 -y
RUN apt-get -y install python3-pip
RUN pip install -r /root/Jenkins/Django/requirements.txt
# RUN ls /root/Jenkins/Django
RUN python3.8 /root/Jenkins/Django/manage.py makemigrations
RUN python3.8 /root/Jenkins/Django/manage.py migrate
CMD python3.8 /root/Jenkins/Django/manage.py runserver 0.0.0.0:8000
