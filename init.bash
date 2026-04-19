#!/usr/bin/env bash

set -e

echo "🚀 Updating system..."
sudo apt update && sudo apt upgrade -y

echo "📦 Installing base packages..."
sudo apt install -y \
  zsh \
  git \
  curl \
  unzip \
  fzf \
  btop \
  zoxide \
  nodejs \
  npm \
  eza

# -----------------------------
# ZSH SETUP
# -----------------------------
echo "🐚 Setting zsh as default shell..."
chsh -s $(which zsh)

mkdir -p ~/.zsh

echo "🔌 Installing zsh plugins..."
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions || true
git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.zsh/zsh-syntax-highlighting || true
git clone https://github.com/marlonrichert/zsh-autocomplete ~/.zsh/zsh-autocomplete || true

# -----------------------------
# STARSHIP
# -----------------------------
echo "✨ Installing starship..."
curl -sS https://starship.rs/install.sh | sh -s -- -y

# -----------------------------
# NVM
# -----------------------------
echo "🟢 Installing nvm..."
export NVM_DIR="$HOME/.nvm"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

# -----------------------------
# FZF FULL SETUP
# -----------------------------
echo "🔍 Installing full fzf features..."
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf || true
~/.fzf/install --all

# -----------------------------
# OPTIONAL: CARAPACE
# -----------------------------
echo "🔧 Installing carapace..."
curl -sS https://carapace.sh/install.sh | bash || true

# -----------------------------
# NEOVIM (LATEST)
# -----------------------------
echo "📝 Installing Neovim latest..."
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
tar xzf nvim-linux-x86_64.tar.gz
sudo mv nvim-linux-x86_64 /opt/nvim

# -----------------------------
# ZSH CONFIG
# -----------------------------
echo "⚙️ Writing .zshrc..."

cat > ~/.zshrc << 'EOF'
# --- VI MODE ---
bindkey -v
KEYTIMEOUT=1
DISABLE_AUTO_TITLE="true"

# --- ENV ---
export NVM_DIR="$HOME/.nvm"
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"
export PATH="/opt/nvim/bin:$PATH"

# --- NVM ---
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# --- STARSHIP ---
eval "$(starship init zsh)"

# --- COMPLETIONS ---
autoload -Uz compinit && compinit

# --- AUTOSUGGESTIONS ---
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# --- AUTOCOMPLETE ---
source ~/.zsh/zsh-autocomplete/zsh-autocomplete.plugin.zsh

# --- TOOLS ---
eval "$(zoxide init zsh)"
eval "$(carapace _carapace zsh 2>/dev/null)"

# --- FZF ---
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --border"

# --- ALIASES ---
alias ls="eza"
alias cd="z"
alias cdi="zi"
alias sm="btop"
alias vim="nvim"
alias ..="cd .."

# --- SYNTAX HIGHLIGHTING (MUST BE LAST) ---
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
EOF

# -----------------------------
# DONE
# -----------------------------
echo "✅ Setup complete!"
echo "👉 Restart terminal or run: exec zsh"
