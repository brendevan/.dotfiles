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

The syntax convention for new aliases is `<program>-<custom command name>`. E.g. `docker-wipe` is my alias for `docker system prune -a --volumes` which "wipes" (i.e. deletes) everything. 