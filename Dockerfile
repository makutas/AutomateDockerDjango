FROM python:3.12

MAINTAINER Exergio

# Install PostgreSQL dependencies
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        postgresql-client \
    && rm -rf /var/lib/apt/lists/*

# Step 1: Install any Python packages
# ----------------------------------------
ENV PYTHONUNBUFFERD 1

WORKDIR /usr/src/app
COPY requirements.txt ./
RUN pip install -r requirements.txt

COPY runserver.sh ./
# Step 2: Copy Django Code
# ----------------------------------------
COPY . .

EXPOSE 8000

ENTRYPOINT ["/bin/bash", "/usr/src/app/runserver.sh"]