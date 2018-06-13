# Download base image
FROM barbak/alpine-s6:latest

# Define the ARG variables
ARG VERSION
ARG BUILD_DATE
ARG VCS_REF

# Labels
LABEL org.label-schema.name="Beets" \
      org.label-schema.description="Alpine based Beets Docker image" \
      org.label-schema.vendor="Paul NOBECOURT <paul.nobecourt@orange.fr>" \
      org.label-schema.url="https://github.com/pnobecourt/" \
      org.label-schema.version=$VERSION \
      org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.vcs-url="https://github.com/pnobecourt/docker-beets" \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.schema-version="1.0"

# Define the ENV variables
ENV CONF_LOCATION=/srv/conf/beets

# Install Traccar
RUN apk update && \
    apk add --no-cache \
        python2 \
        py2-pip \
        gcc \
        ffmpeg && \
    pip install \
        beets  \
        discogs-client \
        flask \
        flask-cors \
        gmusicapi \
        pyacoustid \
        pylast \
        python-mpd2 \
        requests \
        requests_oauthlib \
        soco

# Add files
ADD /root /

# Ports configuration
EXPOSE 8337

# Entrypoint
ENTRYPOINT [ "/init" ]
