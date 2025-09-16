FROM python:3.10-slim
WORKDIR /app
COPY Webserver/requirements.txt .
RUN pip install -r requirements.txt
COPY Webserver/ .
EXPOSE 5000
CMD ["python", "app.py"]