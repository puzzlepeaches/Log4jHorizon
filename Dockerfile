FROM alpine
ADD . /Log4jHorizon
RUN apk update && \
    apk add git openjdk11 py3-pip python3 maven 
WORKDIR /Log4jHorizon
RUN mvn package -f /Log4jHorizon/utils/rogue-jndi/
RUN pip3 install -r requirements.txt
ENTRYPOINT ["python3","exploit.py"]
