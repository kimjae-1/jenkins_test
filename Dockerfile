FROM python:3.11.8-slim

WORKDIR /

RUN pip install poetry

COPY ./poetry.lock ./poetry.lock
COPY ./pyproject.toml ./pyproject.toml

RUN poetry export -f requirements.txt --output requirements.txt --without-hashes

RUN pip install --no-cache-dir --upgrade -r ./requirements.txt

COPY ./ ./
COPY ./start.sh /start.sh

ENTRYPOINT ["bash", "./start.sh"]