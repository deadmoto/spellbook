FROM ubuntu:20.04

RUN \
  apt-get update && \
  apt-get install -y \
    libatomic1 wget && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

RUN \
  mkdir /etc/earnapp && \
  echo -n sdk-node-3b45c816f49a493194272f1cb1df2da1 > /etc/earnapp/uuid && \
  wget -qO- https://brightdata.com/static/earnapp/install.sh > /tmp/earnapp.sh && \
  bash /tmp/earnapp.sh -y

CMD earnapp run
