FROM node:18-alpine

RUN apk add --no-cache git neovim python3 py3-pip gzip curl gcc musl-dev ripgrep fzf make && \
    rm -rf /var/cache/apk/* /usr/share/man /tmp/*

RUN node -v && \
    npm -v && \
    python3 --version && \
    pip3 --version && \
    nvim --version

WORKDIR /build

RUN git clone "https://github.com/emanuel-xavier/.dotfiles" && \
    mkdir ~/.config && \
    mv /build/.dotfiles/nvim ~/.config && \
    rm -rf /build/*

ENV PROFILE="docker"

RUN nvim --headless +"Lazy! sync" +qall

WORKDIR ~

ENTRYPOINT ["nvim"]
