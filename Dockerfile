FROM nginx

COPY . /app

RUN echo "Hello from RUN"

CMD echo "Hello World"
