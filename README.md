# Dotfiles

Configs and scripts.

## Install

```shell
$ git clone
$ ./install
```

## Other requirements

* [homebrew](https://brew.sh/)
    * pyenv - `brew install pyenv`
        * `pyenv install {2.7.14, 3.6.4}` and `pyenv global 2.7.14 3.6.4 system`
    * git - `brew install git`
    * vim - `brew install vim --with-override-system-vi`
        * `vim` then `:PlugInstall` for vim plugins
    * neovim - `brew install neovim` (for Sublime Text + ActualVim, PyCharm)
    * ripgrep - `brew install ripgrep`
* [Sublime Text 3](https://www.sublimetext.com/)
* [Leiningen (Clojure)](https://leiningen.org/) - `brew install leiningen`
    * [Java SE](http://www.oracle.com/technetwork/java/javase/downloads/index.html)
* [iTerm2](https://www.iterm2.com/)
    * Settings -> Preferences -> Load preferences from a custom folder or URL
    * For italic-enabled themes (e.g. for comments): set font to [MonacoB](https://github.com/mnpk/monaco-italic-iterm2)

```shell
# xterm-256color-italic.terminfo
xterm-256color-italic|xterm with 256 colors and italic,
    sitm=\E[3m, ritm=\E[23m,
    use=xterm-256color,

# install
tic xterm-256color-italic.terminfo
echo 'alias ssh="TERM=xterm-256color ssh"' >> ~/.bash_profile.local
echo 'export TERM=xterm-256color-italic' >> ~/.bash_profile.local
```

