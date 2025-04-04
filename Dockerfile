FROM asciidoctor/docker-asciidoctor:1.82
RUN apk add --update nodejs npm
RUN apk upgrade
RUN npm install -g @mermaid-js/mermaid-cli

# https://github.com/asciidoctor/docker-asciidoctor/issues/121#issuecomment-617778326
#RUN apk add graphicsmagick-dev ruby-dev musl-dev gcc
#RUN gem install prawn-gmagick
