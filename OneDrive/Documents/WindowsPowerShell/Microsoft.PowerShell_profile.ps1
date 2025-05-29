echo "loading profile.ps1..."

# general aliases
function admin { Start-Process wt powershell -Verb runAs }
function vim { nvim $args }
function lg { lazygit $args }
function q { exit $args }
function c { clear $args }

# dotfiles location aliases
function nvimrc { cd ~\AppData\Local\nvim }
function lazygitrc { cd ~\AppData\Local\lazygit }

# project aliases
function obsidian { cd D:\Documents\SelfProjects\obsidian-vault }
function 9cat { cd D:\Documents\UnityProjects\9cat-2d-2 }

# dotfile management
$DOTFILES_HOME = $HOME
$DOTFILES_GIT_DIR = ".powershell_dotfiles"
function dotfiles { git --git-dir=$DOTFILES_HOME/$DOTFILES_GIT_DIR/ --work-tree=$DOTFILES_HOME $args }

# PSFzf setup
# fh = alias for fzf command history
Set-PSFzfOption -EnableAliasFuzzyHistory
# fcd = alias for fzf cd
function fcd { Invoke-FuzzySetLocation }
