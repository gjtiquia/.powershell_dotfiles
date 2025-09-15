echo "loading profile.ps1..."

# general aliases
function admin { Start-Process wt pwsh -Verb runAs }
function v { nvim $args }
function lg { lazygit $args }
function q { exit $args }
function ff { fastfetch $args }
function c { clear }
function cf { c && ff }
function ifconfig { Get-NetIPConfiguration }
function sshd { Start-Service sshd }

# dotfiles location aliases
function nvimrc { cd ~\AppData\Local\nvim }
function lazygitrc { cd ~\AppData\Local\lazygit }

# dotfile management
$DOTFILES_HOME = $HOME
$DOTFILES_GIT_DIR = ".powershell_dotfiles"
function dotfiles { git --git-dir=$DOTFILES_HOME/$DOTFILES_GIT_DIR/ --work-tree=$DOTFILES_HOME $args }

# PSFzf setup
# fh = alias for fzf command history
Set-PSFzfOption -EnableAliasFuzzyHistory
# fcd = alias for fzf cd
function fcd { Invoke-FuzzySetLocation }

# yazi - y shell wrapper - use the y command to use yazi
# https://yazi-rs.github.io/docs/quick-start#shell-wrapper
function y {
    $tmp = [System.IO.Path]::GetTempFileName()
    yazi $args --cwd-file="$tmp"
    $cwd = Get-Content -Path $tmp -Encoding UTF8
    if (-not [String]::IsNullOrEmpty($cwd) -and $cwd -ne $PWD.Path) {
        Set-Location -LiteralPath ([System.IO.Path]::GetFullPath($cwd))
    }
    Remove-Item -Path $tmp
}

# zoxide setup - z shell wrapper - use the z command to use zoxide
# https://github.com/ajeetdsouza/zoxide
Invoke-Expression (& { (zoxide init powershell | Out-String) })
