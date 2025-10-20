export ZSH="$HOME/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="agnoster"

plugins=(git vscode web-search brew zsh-completions zsh-syntax-highlighting)

source "$ZSH/oh-my-zsh.sh"

alias ll='exa --long --header --git'        # Preferred 'ls' implementation
alias l='ll'
alias ~="cd ~"                              # ~:            Go Home
alias c='clear'                             # c:            Clear terminal display

# Writes AWS CLI v2 commands straight to console i.e. without paging
export AWS_PAGER=''
export EDITOR='nano'


# For Android development
# export JAVA_HOME=/Library/Java/JavaVirtualMachines/zulu-17.jdk/Contents/Home
# export ANDROID_HOME=$HOME/Library/Android/sdk
# export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools

complete -C "$(which aws_completer)" aws

source "$ZSH/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"

# For zsh-completions
autoload -U compinit && compinit -i

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

function awssso() {
    aws sso login --profile $1
    export AWS_PROFILE=$1
}

# Extend path with VS Code, Python, Homebrew support
export PATH="/usr/local/bin/code:/opt/homebrew/bin:$HOME/.local/bin:$PATH"

# bun completions
[ -s "/Users/jamie/.bun/_bun" ] && source "/Users/jamie/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/jamie/.docker/completions $fpath)
autoload -Uz compinit
compinit
# End of Docker CLI completions
