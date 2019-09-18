FROM alpine:3.10
MAINTAINER Molindo GmbH <build@molindo.at>

ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

ENV DEFAULT_JAVA_OPTS ""
ENV DEFAULT_JAVA_ARGS ""
ENV JAVA_OPTS ""
ENV JAVA_ARGS ""

RUN set -x \
	&& apk add --no-cache curl bash wget gnupg openjdk11-jre coreutils \
	&& echo -e '#!/bin/sh\nexec /usr/bin/java -XX:ActiveProcessorCount=$(nproc) $DEFAULT_JAVA_OPTS $JAVA_OPTS "$@" $DEFAULT_JAVA_ARGS $JAVA_ARGS' > /usr/local/bin/java.sh \
	&& chmod +x /usr/local/bin/* \
	&& /usr/local/bin/java.sh -XshowSettings:vm -version

ENTRYPOINT ["/usr/local/bin/java.sh"]
CMD ["-version"]
