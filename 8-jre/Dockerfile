FROM debian:stretch-slim
MAINTAINER Molindo GmbH <build@molindo.at>

ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

ENV JAVA_OPTS ""
ENV JAVA_ARGS ""

RUN set -x \
	&& mkdir -p /usr/share/man/man1 \
	&& apt-get update \
	&& apt-get install -y --no-install-recommends \
		ca-certificates \
		curl \
	&& apt-get install -y \
		openjdk-8-jre-headless \
		ca-certificates-java \
	&& rm -rf /var/lib/apt/lists/* \
	&& echo '#!/bin/sh\nexec /usr/bin/java -XX:+UnlockExperimentalVMOptions -XX:+UseCGroupMemoryLimitForHeap $JAVA_OPTS "$@" $JAVA_ARGS' > /usr/local/bin/java.sh \
	&& chmod +x /usr/local/bin/* \
	&& /usr/local/bin/java.sh -version

ENTRYPOINT ["/usr/local/bin/java.sh"]
CMD ["-version"]