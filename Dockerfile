FROM python:3.7.2
MAINTAINER "ashisharivastava1872@gmail.com"

ARG BUILD_DATE
LABEL org.label-schema.build-date=$BUILD_DATE

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY req.txt /usr/src/app/
RUN pip install -r req.txt

COPY . /usr/src/app

EXPOSE 5000
CMD ["python", "trg_assign.py"]