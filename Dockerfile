FROM golang:1.23-alpine

# install git and nodejs
RUN apk add --no-cache git curl nodejs npm

# install hugo
RUN apk add --no-cache --repository=https://dl-cdn.alpinelinux.org/alpine/edge/community hugo

# test go
RUN go version

# set the workdir
WORKDIR /site

# install npm dependencies for PostCSS/Tailwind
COPY package*.json ./
RUN npm ci

# expose the default port
EXPOSE 1313

# Run hugo in watch mode
CMD ["hugo", "server", "--bind", "0.0.0.0"]
