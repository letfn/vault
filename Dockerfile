FROM vault:1.6.1

RUN apk upgrade && apk add bash

COPY service /service
RUN chmod 755 /service

ENTRYPOINT [ "bash" ]

CMD [ "/service" ]
