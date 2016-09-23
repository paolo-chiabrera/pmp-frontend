FROM node:6

MAINTAINER Paolo Chiabrera <paolo.chiabrera@gmail.com>

ENV NODE_ENV production

# Install nginx

RUN apt-get -yq --no-install-suggests --no-install-recommends --force-yes update

RUN apt-get -yq --no-install-suggests --no-install-recommends --force-yes install nginx

# cache npm install

# ADD package.json /tmp/package.json

# RUN cd /tmp && npm install --dev

# RUN mkdir -p /home/app && cp -a /tmp/node_modules /home/app/

# copy the app content

# ADD . /home/app

# WORKDIR /home/app

# RUN npm run build

# overwrite nginx config

RUN mkdir -p /home/app

ADD . /home/app

WORKDIR /home/app

RUN yes | cp ./nginx.conf /etc/nginx/nginx.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
