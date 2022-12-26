FROM ubuntu
RUN apt-get update -y
RUN apt-get install -y python3
RUN apt-get install -y pip
RUN  apt-get install -y libmysqlclient-dev
ENV MYSQL_HOST="db"
ENV MYSQL_USER="root"
ENV MYSQL_PASSWORD="test"
RUN  pip install --upgrade pip
WORKDIR /usr/src/app
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt
COPY . .
EXPOSE 5000:5000
CMD ["python3","blog.py"]
