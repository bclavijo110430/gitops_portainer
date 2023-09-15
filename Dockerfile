FROM python:3.8-alpine

WORKDIR /app

COPY requirements.txt .

RUN  apk --no-cache add curl

RUN pip install --no-cache-dir -r requirements.txt

COPY gunicorn_config.py /app/
COPY main.py /app/
COPY requirements.txt /app/
EXPOSE 5100
EXPOSE 5200

CMD ["gunicorn", "main:app", "-c" ,"gunicorn_config.py"]