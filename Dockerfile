FROM centos:7

USER root

RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash

RUN source ~/.nvm/nvm.sh \
    nvm install 10.15.0 \
    nvm use 10.15.0 \
    npm install -g hexo-cli

COPY ./blog /home/blog

WORKDIR /home/blog

RUN npm i 

CMD ["hexo", "server", "-s"]