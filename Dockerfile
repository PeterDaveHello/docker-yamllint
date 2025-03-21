FROM python:3-alpine3.19

ARG YAMLLINT_VERSION

LABEL name="docker-yamllint"
LABEL maintainer="Peter Dave Hello <hsu@peterdavehello.org>"

LABEL version="$YAMLLINT_VERSION"

WORKDIR /yaml

RUN pip install --no-cache-dir yamllint=="$YAMLLINT_VERSION"

USER nobody

CMD [ "yamllint", "--version" ]
