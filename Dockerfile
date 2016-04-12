FROM python:2-alpine

RUN apk add --update build-base postgresql-dev && rm -rf /var/cache/apk/*

ENTRYPOINT ["nosetests", "--exe", "--verbosity=3", "-x", "--with-xunit", "--xunit-file=/test-runner/tests/test_output/xunit.xml"]
VOLUME /test-runner/tests

COPY requirements.txt /test-runner/requirements.txt
WORKDIR /test-runner
RUN ["pip", "--no-cache-dir", "install", "--upgrade", "pip"]
RUN ["pip", "--no-cache-dir", "install", "--upgrade", "nose"]
RUN ["pip", "--no-cache-dir", "install", "-r", "requirements.txt"]

