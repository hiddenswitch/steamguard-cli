FROM mono:latest
WORKDIR /
COPY ./ ./
RUN apt-get update \
        && apt-get install -y --no-install-recommends make ca-certificates locales \
        && echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen \
        && locale-gen en_US.UTF-8 \
        && rm -rf /var/lib/apt/lists/* \
        && make
FROM mono:latest
COPY --from=0 /build /build
CMD [ "mono", "/build/steamguard"]