FROM python:3.9

WORKDIR /app

COPY . /app

RUN pip install -e .

EXPOSE 8000

CMD ["python", "server.py"]
