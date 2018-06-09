# Download base image
FROM barbak/alpine-s6:latest

# Define the ARG variables for creating docker image
ARG VERSION
ARG BUILD_DATE
ARG VCS_REF

# Labels
LABEL org.label-schema.name="Shinobi Pro" \
      org.label-schema.description="Alpine based Shinobi Pro Docker image" \
      org.label-schema.vendor="Paul NOBECOURT <paul.nobecourt@orange.fr>" \
      org.label-schema.url="https://github.com/pnobecourt/" \
      org.label-schema.version=$VERSION \
      org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.vcs-url="https://github.com/pnobecourt/docker-shinobipro" \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.schema-version="1.0"

# Install Shinobi Pro
RUN apk update && \
    apk add --no-cache ffmpeg mysql nodejs

# Add files
ADD /root /

# Ports configuration
EXPOSE 80

# Entrypoint
ENTRYPOINT [ "/init" ]
