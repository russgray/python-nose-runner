FROM python:2.7

COPY requirements.txt /test-runner/requirements.txt
WORKDIR /test-runner

RUN ["pip", "install", "--upgrade", "pip"]
RUN ["pip", "install", "--upgrade", "nose"]
RUN ["pip", "install", "-r", "requirements.txt"]

VOLUME /test-runner/tests

ENTRYPOINT ["nosetests", "--exe", "--verbosity=3", "-x", "--with-xunit", "--xunit-file=/test-runner/tests/test_output/xunit.xml"]
