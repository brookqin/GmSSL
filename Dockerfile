ARG ALPINE_VERSION=3.19.1

FROM alpine:${ALPINE_VERSION}

ARG GMSSL_VERSION=v3.1.1

WORKDIR /

RUN apk add --no-cache --virtual .build-deps \
	llvm15-dev clang15 g++ \
	gcc make cmake \
	git && \
	git clone -b ${GMSSL_VERSION} https://github.com/guanzhi/GmSSL.git && \
	cd GmSSL && \
	mkdir build && cd build && \
	cmake .. -DBUILD_SHARED_LIBS=OFF -DCMAKE_BUILD_TYPE=Release && \
	make