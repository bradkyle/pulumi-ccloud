FROM golang:1.15-buster as base

RUN curl -fsSL https://get.pulumi.com | sh 

RUN curl -LJO https://github.com/pulumi/pulumictl/releases/download/v0.0.15/pulumictl-v0.0.15-linux-amd64.tar.gz \ 
				 && tar -xzf pulumictl-v0.0.15-linux-amd64.tar.gz \ 
				 && chmod +x ./pulumictl \
				 && mv ./pulumictl ~/ \
				 && mv ~/.pulumi/bin/* ~/ \
				 && rm -rf pulumictl-v0.0.15-linux-amd64.tar.gz 

ENV PATH="/root:${PATH}"

FROM base as node 

ENV NODE_VERSION=15.x
RUN set -xe; \
	# Node.js repo
	curl -fsSL https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add -; \
	echo "deb https://deb.nodesource.com/node_${NODE_VERSION} jessie main" | tee /etc/apt/sources.list.d/nodesource.list; \
	echo "deb-src https://deb.nodesource.com/node_${NODE_VERSION} jessie main" | tee -a /etc/apt/sources.list.d/nodesource.list; \
	# yarn repo
	curl -fsSL https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -; \
	echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list; \
	apt-get update >/dev/null; \
	apt-get -y --no-install-recommends install >/dev/null \
		nodejs \
		yarn \
	;\
	apt-get clean; rm -rf /var/lib/apt/lists/*;

FROM node as work
WORKDIR /work
# ADD . .
CMD ["/bin/bash"]

