# # FROM ubuntu:22.04
# # FROM python:3.11-slim

# RUN apt-get update && apt-get install -y \
#     python3.11 \
#     python3-pip \
#     git

# RUN pip3 install PyYAML

# COPY feed.py /usr/bin/feed.py

# COPY entrypoint.sh /entrypoint.sh

# ENTRYPOINT [ "/entrypoint.sh" ]





FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
  python3.11 \
  python3-pip \
  git

RUN pip3 install PyYAML

COPY feed.py /usr/bin/feed.py

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]




# # 1. Use an official Python image that already includes 3.11 and pip
# FROM python:3.11-slim

# # 2. Install git (and clean up temporary files to keep the image small)
# RUN apt-get update && apt-get install -y \
#   git \
#   && rm -rf /var/lib/apt/lists/*

# # 3. Install your Python package (works instantly without environment blocks)
# RUN pip install --no-cache-dir PyYAML

# # 4. Copy your files over
# COPY feed.py /usr/bin/feed.py
# COPY entrypoint.sh /entrypoint.sh

# # 5. Fix permissions to make sure the script can actually run
# RUN chmod +x /entrypoint.sh

# # 6. Tell Docker how to start your container
ENTRYPOINT ["/entrypoint.sh"]
