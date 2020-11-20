FROM python
WORKDIR /app
COPY . .
RUN pip3 install flask
RUN pip3 install -r requirements.txt
EXPOSE 5000
ENTRYPOINT ["python3", "app.py"]
