# --- VI MODE ---
bindkey -v
KEYTIMEOUT=1
DISABLE_AUTO_TITLE="true"

# --- ENV ---
export NVM_DIR="$HOME/.nvm"
export STARSHIP_CONFIG=~/.config/starship/starship.toml

# --- NVM ---
source "$(brew --prefix nvm)/nvm.sh"

# --- STARSHIP ---
eval "$(starship init zsh)"

# --- COMPLETIONS ---
autoload -Uz compinit && compinit

# --- AUTOSUGGESTIONS ---
source "$(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh"

# --- AUTOCOMPLETE ---
source "$(brew --prefix)/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh"

# --- TOOLS ---
export CARAPACE_BRIDGES='zsh,fish,bash'
eval "$(zoxide init zsh)"
eval "$(carapace _carapace zsh)"

# --- ALIASES ---
alias ls="eza"
alias cd="z"
alias cdi="zi"
alias sm="btop"
alias vim="nvim"
alias ..="cd .."
alias lg="lazygit"

# --- SYNTAX HIGHLIGHTING ---
source "$(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
