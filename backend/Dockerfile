FROM python
COPY . .
RUN pip3 install flask
RUN pip3 install -r requirements.txt
EXPOSE 5001
ENTRYPOINT ["python3", app.py]
