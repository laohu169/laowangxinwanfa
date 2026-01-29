FROM node:20-alpine3.20

WORKDIR /tmp

ENV UUID=b2db14a9-52ea-448b-999a-2e88749d1df5 \
    ARGO_DOMAIN=shiper.svip888.us.kg \
    ARGO_AUTH=eyJhIjoiMGU3ZjI2MWZiY2ExMzcwNzZhNGZmODcxMzU3ZjYzNGQiLCJ0IjoiOGVkYWEzMzItOGI5Ny00NmM2LTk5Y2UtMWIxYWRmMzQ2NDg2IiwicyI6IlpXTTJNekF6TXpBdE16QXdaaTAwTUdReUxXSmtaVGt0TnpZek9HVTFaV0kzWW1ZMCJ9
    NEZHA_SERVER=mbb.svip888.us.kg:53100 \
	NEZHA_KEY=VnrTnhgoack6PhnRH6lyshe4OVkHmPyM \

RUN apk update && apk add --no-cache bash openssl curl &&\
    npm i node-sbx

CMD ["npx", "node-sbx"]
