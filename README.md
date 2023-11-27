# .dotfiles

## Symlink dotfiles

* **Windows**: Open command prompt as admin and run

```
%HOMEPATH%\.dotfiles\scripts\windows\link_dotfiles.bat
```

* **Linux**: 

```
(sudo) bash ~/.dotfiles/scripts/link_dotfiles.sh
```

* **Docker**: Automatically setup from `Dockerfile` on container build


## Aliases

**Bash aliases are defined within `dotfiles/.bash_aliases`**. This file is then sourced within `.bashrc` and `.zshrc`. 

The syntax convention for new aliases is `<program>-<custom command name>`. E.g. `docker-wipe` is my alias for a bunch of docker commands which "wipe" (i.e. delete) everything docker related.

### `dockerdev` aliases

[`dockerdev`](https://github.com/brendevan/.dockerdev) is my custom Docker development environment. 