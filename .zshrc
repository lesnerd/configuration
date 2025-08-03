export GOROOT="/opt/homebrew/Cellar/go/1.24.5/libexec"
# export MAVENROOT="/Users/davidles/dev/apache-maven-3.9.1"
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin:${MAVENROOT}/bin"
# REPLACE WITH YOUR JFROG GOPROXY URL
export GOPROXY="https://YOUR_USERNAME:YOUR_API_KEY@entplus.jfrog.io/artifactory/api/go/dev-master-go-virtual"
export GOPATH="$HOME/go"
# export GOFLAGS="-mod=mod -tags=testutil"
# export GOSUMDB="off"
export PATH="$PATH:$GOPATH/bin"[]
# export GOPRIVATE="jfrog.com,github.com/grafeas/grafeas"
# export GO111MODULE="on"
# REPLACE WITH YOUR ARTIFACTORY CREDENTIALS
export artifactory_user=YOUR_USERNAME
export artifactory_password=YOUR_API_KEY
# REPLACE WITH YOUR DOCKER REGISTRY CREDENTIALS
export DOCKER_REGISTRY_USER=YOUR_USERNAME
export DOCKER_REGISTRY_PASSWORD=YOUR_API_KEY
# REPLACE WITH YOUR ENTPLUS DEPLOYER CREDENTIALS
export int_entplus_deployer_user=YOUR_USERNAME
export int_entplus_deployer_apikey=YOUR_API_KEY
alias ll="ls -la"
alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"
alias k=kubectl
source /Users/davidles/.jfdev/package/scripts/.jfdevrc
export PATH=$PATH:/opt/homebrew/bin
export GIT_LFS_SKIP_SMUDGE=true
# export DOCKER_HOST=unix://$HOME/.docker/run/docker.sock

export ARTIFACTORY_USER=$artifactory_user
export ARTIFACTORY_PASSWORD=$artifactory_password
export GRADLE_OPTS="-Dgradle.wrapperUser=$artifactory_user -Dgradle.wrapperPassword=$artifactory_password"
# export JAVA_HOME=/Library/Java/JavaVirtualMachines/temurin-17.jdk/Contents/Home
export JAVA_HOME=$(/usr/libexec/java_home -v 21)
export PATH="$JAVA_HOME/bin:$PATH"

export JF_PRODUCT_HOME="/Users/$(whoami)/.jfff"
# export JF_PRODUCT_HOME="/Users/davidles/dev/artifactory-service/devenv/devenv/.artifactory"

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
 [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

autoload -Uz compinit
compinit

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
git 
zsh-autosuggestions
)
source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

export HOMEBREW_ARTIFACTORY_API_TOKEN=$artifactory_password

[[ -f "$HOME/devtools.sh" ]] || curl -o ~/devtools.sh -fsL -u$artifactory_user:$artifactory_password 'https://entplus.jfrog.io/artifactory/dev-rnd-local/artifactory/dev/scripts/devtools.sh'
source $HOME/devtools.sh || echo Something failed. unable to download devtools.sh from repo21 - check credentials.

function narc_prod() {
    export JFROG_SERVER_ENVIRONMENT=production
    # REPLACE WITH YOUR NARCISSUS PRODUCTION TOKEN
    export NARCISSUS_TOKEN=YOUR_PRODUCTION_TOKEN
}
function narc_stg() {
    export JFROG_SERVER_ENVIRONMENT=staging
    # REPLACE WITH YOUR NARCISSUS STAGING TOKEN
    export NARCISSUS_TOKEN=YOUR_STAGING_TOKEN
}
function narc_dev() {
    export JFROG_SERVER_ENVIRONMENT=development
    # REPLACE WITH YOUR NARCISSUS DEVELOPMENT TOKEN
    export NARCISSUS_TOKEN=YOUR_DEVELOPMENT_TOKEN
}
narc_prod
#For docker-compose command behaviour
export ADD_HOST_DOCKER_INTERNAL=true

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/davidles/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
