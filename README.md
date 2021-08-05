# Light Maglev

A light tmux theme based on [Maglev](https://github.com/caiogondim/maglev), made
to work nicely with
[bullet-train.zsh](https://github.com/caiogondim/bullet-train.zsh) for
oh-my-zsh.

## Installation

This theme depends on the following:

* [tmux](http://tmux.github.io/)
* [tpm](https://github.com/tmux-plugins/tpm)
* [tmux-prefix-highlight](https://github.com/tmux-plugins/tmux-prefix-highlight)
* [a Powerline patched font](https://github.com/powerline/fonts)

You will have to declare the tmux plugins and the theme in your `~/.tmux.conf`:

```bash
# List of plugins.
set -g @plugin 'stefanistrate/light-maglev#main'
set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-prefix-highlight'

# Initialize the tmux plugin manager.
run '~/.tmux/plugins/tpm/tpm'
```
