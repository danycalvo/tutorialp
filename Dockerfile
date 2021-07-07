FROM registry.access.redhat.com/ubi8/python-38
ADD requirements.txt .
RUN python -m pip install -r requirements.txt

WORKDIR /app
ADD . /app

USER 1001
ENV MI_DATA="DC says The result is:"
#ENV URL_DB="mongodb-26-rhel7:27017"
ENV URL_DB="dc-mongodb:27017"
EXPOSE 5000
CMD ["gunicorn", "--bind", "0.0.0.0:5000","--workers","2","app.app:app"]