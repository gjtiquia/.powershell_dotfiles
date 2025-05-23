echo "loading profile.ps1..."

function so { . $PROFILE }

# dotfile management
$DOTFILES_HOME = $HOME
$DOTFILES_GIT_DIR = ".powershell_dotfiles"
function dotfiles { git --git-dir=$DOTFILES_HOME/$DOTFILES_GIT_DIR/ --work-tree=$DOTFILES_HOME $args }

