FROM ubuntu
COPY simpleApp /root/Jenkins/
COPY Meta /root/Jenkins/
WORKDIR /root/Jenkins/
RUN pwd
RUN ls 
RUN apt-get -y update
RUN apt-get install python3 -y
RUN apt-get -y install python3-pip
WORKDIR /root/Jenkins/Django/simpleApp
RUN pwd && ls
RUN pip install -r ./Meta/requirements.txt
# RUN ls /root/Jenkins/Django
RUN python3.8 ./Meta/manage.py makemigrations
RUN python3.8 ./Meta/manage.py migrate
CMD python3.8 ./Meta/manage.py runserver 0.0.0.0:8000
