FROM node:20-alpine

WORKDIR /app

# ===== 你的变量，全部保留 =====
ENV UUID=b2db14a9-52ea-448b-999a-2e88749d1df5 \
    ARGO_DOMAIN=shiper.svip888.us.kg \
    ARGO_AUTH=eyJhIjoiMGU3ZjI2MWZiY2ExMzcwNzZhNGZmODcxMzU3ZjYzNGQiLCJ0IjoiOGVkYWEzMzItOGI5Ny00NmM2LTk5Y2UtMWIxYWRmMzQ2NDg2IiwicyI6IlpXTTJNekF6TXpBdE16QXdaaTAwTUdReUxXSmtaVGt0TnpZek9HVTFaV0kzWW1ZMCJ9 \
    NEZHA_SERVER=mbb.svip888.us.kg:53100 \
    NEZHA_KEY=VnrTnhgoack6PhnRH6lyshe4OVkHmPyM

# ===== 安装依赖 =====
RUN apk add --no-cache bash curl openssl \
 && npm install -g node-sbx

# ===== 平台需要的 Web 端口 =====
EXPOSE 3000

# ===== 同时跑 node-sbx + 假 Web 服务 =====
CMD sh -c "\
  node-sbx & \
  node -e \"require('http').createServer((_,res)=>res.end('ok')).listen(3000)\" \
"
