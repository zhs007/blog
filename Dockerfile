FROM centos:7

USER root
ENV NVM_DIR /usr/local/nvm
ENV NODE_VERSION 10.15.0

RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash

RUN source ~/.nvm/nvm.sh \
    nvm install 10.15.0 \
    nvm use 10.15.0 \
    npm install -g hexo-cli
    
ENV PATH      $NVM_DIR/v$NODE_VERSION/bin:$PATH

COPY ./blog /home/blog

WORKDIR /home/blog

RUN npm i 

CMD ["hexo", "server", "-s"]