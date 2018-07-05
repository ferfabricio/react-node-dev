FROM node:9.11.2-alpine

WORKDIR /app

ENV PATH=/app/node_modules/.bin:~/.npm-global/bin:$PATH
ENV NPM_CONFIG_PREFIX=~/.npm-global

RUN mkdir ~/.npm-global

RUN apk --no-cache add --virtual native-deps \
  g++ gcc libgcc libstdc++ linux-headers make python && \
  npm install -g npm && \
  npm cache verify
  
RUN  npm install -g react-scripts react-app-rewired

RUN npm install node-sass

RUN apk del native-deps


ENV PORT 80
EXPOSE 80
EXPOSE 35729

CMD ["npm", "start"]
