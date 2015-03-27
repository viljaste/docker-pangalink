# docker-pangalink

### Build the image

    TMP="$(mktemp -d)" \
      && git clone http://git.simpledrupalcloud.com/simpledrupalcloud/docker-pangalink.git "${TMP}" \
      && cd "${TMP}" \
      && sudo docker build -t simpledrupalcloud/pangalink:latest . \
      && cd -

## License

**MIT**
