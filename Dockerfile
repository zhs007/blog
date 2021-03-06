FROM centos:7

USER root
ENV NODE_VERSION v10.15.0

RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash

RUN source ~/.nvm/nvm.sh \
    && nvm install $NODE_VERSION \
    && nvm use $NODE_VERSION

ENV NVM_DIR /root/.nvm
ENV NODE_PATH $NVM_DIR/versions/node/$NODE_VERSION/lib/node_modules
ENV PATH      $NVM_DIR/versions/node/$NODE_VERSION/bin:$PATH

COPY ./blog /home/blog

WORKDIR /home/blog

RUN npm i -g hexo-cli \
    && npm i \
    && hexo generate

CMD ["hexo", "server", "-s"]