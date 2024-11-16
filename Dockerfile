FROM ubuntu:24.04
ARG NORM_VERSION=3.3.51
RUN apt update && apt upgrade -y && apt install -y build-essential clang valgrind libssl-dev libpq-dev libbsd-dev sudo curl lsb-release git python3-dev python3-wheel pipx
RUN pipx ensurepath
RUN pipx install norminette==$NORM_VERSION
RUN bash -c "$(curl -fsSL https://raw.github.com/xicodomingues/francinette/master/bin/install.sh)"
RUN apt clean && rm -rf /var/lib/apt/lists/*
RUN mkdir /src
ENV PATH="$PATH:/root/.local/bin"
WORKDIR /src
ENTRYPOINT [ "/bin/bash", "/root/francinette/tester.sh" ]
