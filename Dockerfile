FROM vault:1.6.2

RUN apk upgrade && apk add bash

COPY service /service
RUN chmod 755 /service

ENTRYPOINT [ "/service" ]

CMD [ ]
