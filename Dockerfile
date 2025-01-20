ARG BUILD_FROM
FROM $BUILD_FROM

# Install requirements for add-on
RUN \
  apk add --no-cache \
    python3

RUN python3 -m ensurepip
#RUN pip3 install --no-cache --upgrade pip setuptools
RUN pip3 install pytz
RUN pip3 install paho-mqtt

# Copy data for add-on
COPY run.sh /
RUN chmod a+x /run.sh

COPY src/ /

CMD [ "/run.sh" ]
