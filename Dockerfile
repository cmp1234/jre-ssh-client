FROM cmp1234/java:8u131-jre-alpine3.6

COPY build_openssh.sh /build_openssh.sh 
RUN chmod +x /build_openssh.sh

RUN set -ex; \
	\
 apk add --no-cache --virtual .build-deps \
		coreutils \
		gcc \
		curl \
		linux-headers \
		make \
		musl-dev \
		zlib \
		zlib-dev \
		openssl \
		openssl-dev \
	; \
	apk add --no-cache --virtual .run-deps \
		libcrypto1.0 \
	; \
  /build_openssh.sh; \
	apk del .build-deps; \
	rm -f /build_openssh.sh;
