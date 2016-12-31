FROM fpco/stack-build
MAINTAINER Michael Litchard
RUN apt-get upgrade && apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -yq git
RUN git clone https://github.com/mlitchard/primenator.git
WORKDIR primenator
RUN git config --global http.postBuffer 1048576000
RUN git checkout master
RUN git pull
RUN stack install
ENTRYPOINT ["/root/.local/bin/primenator-exe"]

