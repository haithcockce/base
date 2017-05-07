FROM fedora:latest

LABEL maintainer "haithcockce@gmail.com"

EXPOSE 80

RUN dnf update -y && \
    dnf install -y python-pip python-devel python3-pip python3-devel

# We copy just the requirements.txt first to leverage Docker cache
ADD /exports/docker-content/base/requirements.txt /app/requirements.txt

WORKDIR /app

RUN pip install -r requirements.txt

ADD /exports/docker-content/base /app

ENTRYPOINT [ "python" ]

CMD [ "app.py" ]

