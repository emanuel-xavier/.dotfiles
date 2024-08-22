FROM alpine

RUN apk add --no-cache git neovim nodejs npm python3 py3-pip gzip curl gcc musl-dev ripgrep fzf make && \
    rm -rf /var/cache/apk/* /usr/share/man /tmp/*

RUN node -v && \
    npm -v && \
    python3 --version && \
    pip3 --version && \
    nvim --version

WORKDIR /build

COPY . /build/

RUN mkdir ~/.config && \
    mv /build/nvim ~/.config && \
    rm -rf /build/*

ENV PROFILE=docker

RUN nvim --headless +"Lazy! sync" +qall

WORKDIR ~

ENTRYPOINT ["nvim"]
