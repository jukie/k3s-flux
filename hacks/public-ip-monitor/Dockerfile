FROM alpine as base

FROM base AS base-amd64
ENV ARCH=amd64

FROM base as base-arm64
ENV ARCH=arm64

FROM base-$TARGETARCH 
RUN apk add curl bash --no-cache -U \
    && curl -s https://toolkit.fluxcd.io/install.sh | bash \
    && curl -L "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/${ARCH}/kubectl" -o /usr/local/bin/kubectl \
    && chmod +x /usr/local/bin/kubectl
COPY entrypoint.sh /entrypoint.sh