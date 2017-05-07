FROM fedora:latest

LABEL maintainer "haithcockce@gmail.com"

EXPOSE 80

# We copy just the requirements.txt first to leverage Docker cache
#ADD requirements.txt /app/requirements.txt
WORKDIR /base

# App prep via installing necessary packages
RUN dnf update -y && \
    dnf install -y python-pip python-devel python3-pip python3-devel gcc redhat-rpm-config && \
    pip3 install --upgrade pip setuptools && \
    rm -rf /root/.cache

# Repurpose a flask app docker file for sanic
# RUN pip install -r requirements.txt
RUN pip3 install sanic 


# Clean up
RUN dnf remove gcc redhat-rpm-config -y

ENTRYPOINT [ "python3" ]

CMD [ "base.py" ]

