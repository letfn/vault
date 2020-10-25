FROM vault:1.5.4

COPY service /service

ENTRYPOINT [ "/service" ]

CMD [ ]
