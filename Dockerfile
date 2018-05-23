FROM alpine:3.7

ENV PATH /google-cloud-sdk/bin:$PATH
RUN apk --no-cache add \
        wget \
        python \
    && wget https://dl.google.com/dl/cloudsdk/release/google-cloud-sdk.tar.gz && \
    tar xzf google-cloud-sdk.tar.gz && \
    rm google-cloud-sdk.tar.gz && \
    ln -s /lib /lib64 && \
    gcloud config set core/disable_usage_reporting true && \
    gcloud --version
VOLUME ["/root/.config"]
