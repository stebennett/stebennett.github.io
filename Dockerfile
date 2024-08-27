FROM golang:1.23.0-alpine3.20

# Arguments
ARG DART_SASS_VERSION=1.62.0

# install git
RUN apk add --no-cache git curl

# install hugo
RUN apk add --no-cache --repository=https://dl-cdn.alpinelinux.org/alpine/edge/community hugo

# test go
RUN go version

# install dart-sass
RUN curl -sSL https://github.com/sass/dart-sass/releases/download/${DART_SASS_VERSION}/dart-sass-${DART_SASS_VERSION}-linux-x64.tar.gz | tar -xz -C /opt && \
  ln -s /opt/dart-sass/sass /usr/local/bin/sass

# set the workdir
WORKDIR /site

# expose the default port
EXPOSE 1313

# Run hugo in watch mode
CMD ["hugo", "server", "--bind", "0.0.0.0"]
