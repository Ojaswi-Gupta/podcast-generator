# # FROM ubuntu:latest
# FROM python:3.11-slim

# RUN apt-get update && apt-get install -y \
#     # python3.11 \
#     python3-pip \
#     git

# RUN pip3 install PyYAML

# COPY feed.py /usr/bin/feed.py

# COPY entrypoint.sh /entrypoint.sh

# ENTRYPOINT [ "/entrypoint.sh" ]





FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
  python3.10 \
  python3-pip \
  git

RUN pip3 install PyYAML

COPY feed.py /usr/bin/feed.py

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
