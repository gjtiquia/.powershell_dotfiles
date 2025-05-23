echo "loading profile.ps1..."

function obsidian { cd D:\Documents\SelfProjects\obsidian-vault }
function 9cat { cd D:\Documents\UnityProjects\9cat-2d-2 }
function nvimrc { cd ~\AppData\Local\nvim }

# dotfile management
$DOTFILES_HOME = $HOME
$DOTFILES_GIT_DIR = ".powershell_dotfiles"
function dotfiles { git --git-dir=$DOTFILES_HOME/$DOTFILES_GIT_DIR/ --work-tree=$DOTFILES_HOME $args }

# PSFzf setup
# fh = alias for fzf command history
Set-PSFzfOption -EnableAliasFuzzyHistory
# fcd = alias for fzf cd
function fcd { Invoke-FuzzySetLocation }
