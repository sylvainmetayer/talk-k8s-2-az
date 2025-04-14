#!/usr/bin/env bash

# sudo dnf install inotify-tools
# https://github.com/asciidoctor/asciidoctor-reveal.js/issues/248#issuecomment-629611778
# https://github.com/asciidoctor/asciidoctor-reveal.js/issues/248#issuecomment-579277817
while inotifywait -e close_write index.adoc slides js images diagrams css index-docinfo-footer.html docker-compose.yaml; do
  echo -n "Detected changes, rebuild presentation... "
  docker compose up asciidoctor --build
  echo "Done !"
done
