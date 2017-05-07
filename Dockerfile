FROM fedora:latest

LABEL maintainer "haithcockce@gmail.com"

EXPOSE 80

RUN dnf update -y && \
    dnf install -y python-pip python-devel python3-pip python3-devel && \
    pip3 install --upgrade pip setuptools && \
    dnf remove git && \
    rm -rf /root/.cache

# We copy just the requirements.txt first to leverage Docker cache
ADD requirements.txt /app/requirements.txt

WORKDIR /app

# Repurpose a flask app docker file for sanic
# RUN pip install -r requirements.txt
RUN pip3 install git+https://github.com/channelcat/sanic

ADD . /app

ENTRYPOINT [ "python3" ]

CMD [ "app.py" ]

