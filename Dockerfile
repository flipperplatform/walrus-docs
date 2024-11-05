FROM mysten/sui-tools:sui-v1.37.0-release

# Install sui client environment
RUN sui client -y

RUN sui client switch --env testnet

RUN apt-get update
RUN apt-get install ca-certificates curl --quiet --yes

RUN mkdir -p /usr/bin/walrus
ADD https://storage.googleapis.com/mysten-walrus-binaries/walrus-latest-ubuntu-x86_64 /usr/bin/walrus/

RUN chmod +x /usr/bin/walrus/walrus-latest-ubuntu-x86_64

RUN ln -s /usr/bin/walrus/walrus-latest-ubuntu-x86_64 /usr/bin/walrus/walrus-cli

ENV PATH="/usr/bin/walrus:${PATH}"

COPY entry.sh /entry.sh

COPY client_config.yaml /usr/bin/walrus/


RUN chmod +x /entry.sh


CMD ["/bin/bash", "/entry.sh"]