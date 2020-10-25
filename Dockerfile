FROM vault:1.5.4

COPY service /service
RUN chmod 755 /service

RUN apk upgrade && apk add bash

ENTRYPOINT [ "bash" ]

CMD [ "/service" ]
