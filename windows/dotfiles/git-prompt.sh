# =================================================================
#                  GITBASH PROMPT CUSTOMIZATION
# =================================================================
# Modified from default (which sources this file in its place) at:
# /C/Program Files/Git/etc/profile.d/git-prompt.sh

# =================================================================
#                       SYMBOLS AND COLORS
# =================================================================
# SYMBOLS:
# More symbols here: https://en.wikipedia.org/wiki/List_of_emoticons

SYM_STYLE='🐟 '       # 🦑 🐙 🐠 🐟 🐡 🦈 🐬 🐳 🐋
SYM_TRUNC_DIRS='…/'   # 
SYM_PROMPT=' 🠊 '     # ❯ ▶ 👉 🠊 🠖 ⯮ ⮚ 🠶

# COLORS:
# More colors here: https://gist.github.com/vratiu/9780109
Black="\[\033[0;30m\]"        # Black
Red="\[\033[0;31m\]"          # Red
Green="\[\033[0;32m\]"        # Green
Yellow="\[\033[0;33m\]"       # Yellow
Blue="\[\033[0;34m\]"         # Blue
Purple="\[\033[0;35m\]"       # Purple
Cyan="\[\033[0;36m\]"         # Cyan
White="\[\033[0;37m\]"        # White
# '...[<1=bold; 0=reg>;<col as XXm>]'
COL1=$Blue
COL2=$Purple
COL3=$Purple
COL4=$Blue
COL5=$Blue
COL_INPUT=$Black

# =================================================================
#                       PROMPT ARRANGEMENT
# =================================================================
# Start creating prompt from left: 

# Element 1: Style symbol
PS1=""$COL1
PS1="$PS1"$SYM_STYLE

# Element 2: Truncated directory symbol
PS1="$PS1"$COL2           
PS1="$PS1"$SYM_TRUNC_DIRS

# Element 3: Working directory (truncated to last)
# Note: \w = full working directory; \W = trunc. to last
PS1="$PS1"$COL3  
PS1="$PS1"'\W'                 

# Element 4: git branch
if test -z "$WINELOADERNOEXEC"
then
  GIT_EXEC_PATH="$(git --exec-path 2>/dev/null)"
  COMPLETION_PATH="${GIT_EXEC_PATH%/libexec/git-core}"
  COMPLETION_PATH="${COMPLETION_PATH%/lib/git-core}"
  COMPLETION_PATH="$COMPLETION_PATH/share/git/completion"
  if test -f "$COMPLETION_PATH/git-prompt.sh"
  then
    . "$COMPLETION_PATH/git-completion.bash"
    . "$COMPLETION_PATH/git-prompt.sh"
    PS1="$PS1"$COL4
    PS1="$PS1"'`__git_ps1`'
  fi
fi

# Element 5: Prompt symbol
PS1="$PS1"$COL5       
PS1="$PS1"$SYM_PROMPT

# Color of non-prompt text
PS1="$PS1"$COL_INPUT


# =================================================================
#                    UNCHANGED FROM DEFAULT
# =================================================================
MSYS2_PS1="$PS1"     # for detection by MSYS2 SDK's bash.basrc

# Evaluate all user-specific Bash completion scripts (if any)
if test -z "$WINELOADERNOEXEC"
then
	for c in "$HOME"/bash_completion.d/*.bash
	do
		# Handle absence of any scripts (or the folder) gracefully
		test ! -f "$c" ||
		. "$c"
	done
fi
