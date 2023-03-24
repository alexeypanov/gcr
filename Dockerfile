# base image
FROM node:16.15.0-slim

# create and change to the app directory
WORKDIR /usr/app

# copy application dependency manifests to the container image
# a wildcard is used to ensure both package.json AND package-lock.json (when available) are copied
# copying this first prevents re-running npm install on every code change
COPY . .

# install production node packages
# if you add a package-lock.json, use npm ci instead, which will result in faster installs
RUN npm ci --only=production

RUN npm run build

CMD [ "npm", "start"]