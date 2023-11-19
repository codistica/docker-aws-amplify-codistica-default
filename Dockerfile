FROM node:lts-hydrogen

# SETUP SHELL
SHELL ["/bin/bash", "-l", "-c"]

# INSTALL OS PACKAGES
RUN apt-get -y update \
    && apt-get -y install \
        curl \
        git \
        libc6 \
        ssh \
        libgtk2.0-0 \
        libgtk-3-0 \
        libgbm-dev \
        libnotify-dev \
        libnss3 libxss1 \
        libasound2 \
        libxtst6 \
        xauth \
        xvfb \
    && apt-get -y clean

# INSTALL GIT LFS
RUN curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | bash \
    && apt-get -y install git-lfs \
    && git lfs install

# INSTALL NVM
ENV NODE_VERSION lts/hydrogen
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash \
    && source ~/.bashrc \
    && nvm install $NODE_VERSION \
    && nvm alias default $NODE_VERSION

# ENABLE NODE'S COREPACK
RUN corepack enable

# VERIFY AWS AMPLIFY REQUIREMENTS
RUN curl --version
RUN git --version
RUN ldd --version
RUN node --version
RUN npm --version
RUN ssh -V

# VERIFY OTHER REQUIREMENTS
RUN git lfs --version
RUN nvm --version
