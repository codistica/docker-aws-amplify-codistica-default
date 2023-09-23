FROM node:lts-hydrogen

# INSTALL OS PACKAGES
RUN touch ~/.bashrc
RUN apt-get -y update \
    && apt-get -y install \
        curl \
        git \
        libc6 \
        ssh \
    && apt-get -y clean

# ENABLE NODE'S COREPACK
RUN corepack enable

# INSTALL GIT LFS
RUN curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | bash \
    && apt-get -y install git-lfs \
    && git lfs install

# VERIFY AWS AMPLIFY REQUIREMENTS
RUN curl --version
RUN git --version
RUN ldd --version
RUN node --version
RUN npm --version
RUN ssh -V

# VERIFY OTHER REQUIREMENTS
RUN git lfs --version
