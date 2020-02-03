FROM python:3.7.2

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY req.txt /usr/src/app/
RUN pip install -r req.txt

COPY . /usr/src/app

EXPOSE 5000
ENTRYPOINT ["python"]
CMD ["trg_assign.py"]