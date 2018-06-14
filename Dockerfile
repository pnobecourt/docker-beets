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
        ffmpeg \
        curl \
        expat \
        gdbm \
        jpeg \
        lame \
        libffi \
        libpng \
        nano \
        openjpeg \
        py2-gobject3 \
        py2-pip \
        python2 \
        sqlite-libs \
        tar \
        wget \
#        chromaprint 
#        fdk-aac-dev 
#        gst-plugins-good1 
#        gstreamer1 
        nasm \
        x264-dev \
        x265-dev \
        libwebp-dev \
        libass-dev \
        libcrypto1.0 \
        libssl1.0 && \
    pip install --upgrade --no-cache-dir pip && \
    pip install --no-cache-dir \
        beets  \
        beets-copyartifacts \
        discogs-client \
        flask \
        flask-cors \
#        gmusicapi 
        pillow \
        pyacoustid \
        pylast \
        python-mpd2 \
        requests \
        requests_oauthlib \
        soco \
        unidecode

# Add files
ADD /root /

# Ports configuration
EXPOSE 8337

# Entrypoint
ENTRYPOINT [ "/init" ]
