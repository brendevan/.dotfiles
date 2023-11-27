# .dotfiles

## Dotfiles

* **Windows**: Open command prompt as admin and run

```
%HOMEPATH%\.dotfiles\scripts\windows\link_dotfiles_win.bat
```

## Aliases

* **Windows - gitbash**: As per usual, windows is annoying and probably not worth spending the time to find a neat solution. So just manually save [`aliases.sh`](https://raw.githubusercontent.com/brendevan/.dotfiles/main/scripts/aliases.sh) as `/C/Program Files/Git/etc/profile.d/aliases.sh`.

* **Docker (linux)**: aliases are setup automatically from the `Dockerfile` on container build.