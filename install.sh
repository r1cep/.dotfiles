#!/bin/sh

for f in .??*
do
    [[ "$f" == ".git" ]] && continue
    [[ "$f" == ".DS_Store" ]] && continue
    [[ "$f" == ".gitignore" ]] && continue

    ln -snfv ".dotfiles/$f" "${HOME}/$f"
done

if [ ! -f "bin/git-prompt.sh" ]; then
    curl -Ss \
        https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh \
        -o \
        ./bin/git-prompt.sh
fi

if [ ! -f "bin/git-completion.bash" ]; then
    curl -Ss \
        https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash \
        -o \
        ./bin/git-completion.bash
fi
