FROM java:8-jre-alpine
MAINTAINER Molindo GmbH <build@molindo.at>

RUN set -x \
    && apk add --no-cache curl gnupg bash \
	&& curl -o /usr/local/bin/gosu -fSL "https://github.com/tianon/gosu/releases/download/1.10/gosu-amd64" \
	&& curl -o /usr/local/bin/gosu.asc -fSL "https://github.com/tianon/gosu/releases/download/1.10/gosu-amd64.asc" \
    && key="B42F6819007F00F88E364FD4036A9C25BF357DD4" \
    && gpg --keyserver ha.pool.sks-keyservers.net --recv-keys "$key" || gpg --keyserver keyserver.pgp.com --recv-keys "$key" \
	&& gpg --verify /usr/local/bin/gosu.asc \
    && apk del --no-cache gnupg \
	&& rm /usr/local/bin/gosu.asc \
	&& chmod +x /usr/local/bin/gosu

ENV JAVA_OPTS ""
ENV JAVA_ARGS ""
ENV USER_SPEC "nobody:nobody"

ENTRYPOINT ["/usr/local/bin/java.sh"]
CMD ["-version"]

ADD java.sh /usr/local/bin/
