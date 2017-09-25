FROM alpine
RUN \
	apk add --no-cache libpcap-dev && \
	apk add --no-cache --virtual .build-dependencies clang clang-dev git build-base linux-headers && \
	cd /tmp && \
	git clone https://github.com/r0p0s3c/masscan && \
	cd masscan && \
	make -j && \
	mv bin/masscan /bin && \
	rm -rf /tmp/masscan && \
	apk del --purge .build-dependencies
ENTRYPOINT ["/bin/masscan"]
