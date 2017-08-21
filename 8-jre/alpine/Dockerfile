FROM alpine:3.6
MAINTAINER Molindo GmbH <build@molindo.at>

ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

ENV USER_SPEC "nobody:nobody"

ENV JAVA_OPTS ""
ENV JAVA_ARGS ""

RUN set -x \
	&& apk add --no-cache curl gnupg bash openjdk8-jre \
	&& curl -o /usr/local/bin/gosu -fSL "https://github.com/tianon/gosu/releases/download/1.10/gosu-amd64" \
	&& curl -o /usr/local/bin/gosu.asc -fSL "https://github.com/tianon/gosu/releases/download/1.10/gosu-amd64.asc" \
	&& key="B42F6819007F00F88E364FD4036A9C25BF357DD4" \
	&& gpg --keyserver ha.pool.sks-keyservers.net --recv-keys "$key" || gpg --keyserver pgp.mit.edu --recv-keys "$key" || gpg --keyserver keyserver.pgp.com --recv-keys "$key" \
	&& gpg --verify /usr/local/bin/gosu.asc \
	&& apk del --no-cache gnupg \
	&& rm /usr/local/bin/gosu.asc \
	&& echo -e '#!/bin/sh\nexec /usr/local/bin/gosu "$USER_SPEC" "java" -XX:+UnlockExperimentalVMOptions -XX:+UseCGroupMemoryLimitForHeap $JAVA_OPTS "$@" $JAVA_ARGS' > /usr/local/bin/java.sh \
	&& chmod +x /usr/local/bin/*

ENTRYPOINT ["/usr/local/bin/java.sh"]
CMD ["-version"]
