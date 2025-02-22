FROM ubuntu
COPY simpleApp /root/Jenkins/simpleApp
COPY Meta /root/Jenkins/
WORKDIR /root/Jenkins/
RUN ls 
RUN apt-get -y update
RUN apt-get install python3 -y
RUN apt-get -y install python3-pip
WORKDIR /root/Jenkins/
RUN pwd && ls
RUN pip install -r requirements.txt
# RUN ls /root/Jenkins/Django
RUN python3.8 manage.py makemigrations
RUN python3.8 manage.py migrate
CMD python3.8 manage.py runserver 0.0.0.0:8000
