# path: ./Dockerfile

FROM node:16-alpine
# Installing libvips-dev for sharp Compatibility
RUN apk update && apk add  build-base gcc autoconf automake zlib-dev libpng-dev nasm bash vips-dev
ARG NODE_ENV=development
ENV NODE_ENV=${NODE_ENV}
WORKDIR /opt/app
COPY ./ .
RUN yarn config set network-timeout 600000 -g && yarn install
RUN yarn build
EXPOSE 1337
CMD ["yarn", "develop"]
