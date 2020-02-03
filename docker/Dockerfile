FROM python:3.7.2
LABEL maintainer="ashisharivastava1872@gmail.com"

ARG BUILD_DATE
LABEL org.label-schema.build-date=$BUILD_DATE

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY . /usr/src/app
RUN pip install -r /app/req.txt


EXPOSE 5000
CMD ["python", "trg_assign.py"]