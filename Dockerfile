ARG MONGO_VERSION=4.4.11

FROM mongo:$MONGO_VERSION

ARG MONGO_UID=2040
ARG MONGO_GID=2040

RUN usermod -u $MONGO_UID mongodb \
  && groupmod -g $MONGO_GID mongodb \
  && bash -c "find / -uid 999 -exec chown ${MONGO_UID}:${MONGO_GID} {} \; || true" \
  && mkdir /var/backup \
  && chown $MONGO_UID:$MONGO_GID /var/backup

VOLUME ["/var/backup"]
