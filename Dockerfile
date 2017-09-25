FROM alpine
RUN \
	apk add --no-cache libpcap-dev && \
	apk add --no-cache --virtual .build-dependencies git build-base linux-headers && \
	cd /tmp && \
	git clone https://github.com/robertdavidgraham/masscan && \
	cd masscan && \
	make -j && \
	mv bin/masscan /bin && \
	rm -rf /tmp/masscan && \
	apk del --purge .build-dependencies
ENTRYPOINT ["/bin/masscan"]
