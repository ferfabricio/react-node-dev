FROM node:10.13.0-alpine

WORKDIR /app

ENV PATH=/app/node_modules/.bin:~/.npm-global/bin:$PATH

RUN mkdir ~/.npm-global

RUN apk --no-cache add --virtual native-deps \
  g++ gcc libgcc libstdc++ linux-headers make python && \
  npm install -g npm && \
  npm cache verify
  
RUN  npm install -g react-scripts react-app-rewired

ENV PORT 80
EXPOSE 80
EXPOSE 35729

CMD ["npm", "start"]
