eval "$(/opt/homebrew/bin/brew shellenv fish)"
status --is-interactive; and rbenv init - --no-rehash fish | source
set -x NVM_DIR ~/.nvm
set -x EDITOR nvim
set -x CONSOLE_USER tommy.crumrine

test -s "$NVM_DIR/nvm.sh"; and bass source "$NVM_DIR/nvm.sh"  # This loads nvm
nvm use default --silent

alias vim nvim
alias vi nvim
set -gx PATH '/Users/tommy/.rbenv/shims' $PATH
set -gx RBENV_SHELL fish


# pnpm
set -gx PNPM_HOME "/Users/tommy/Library/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

export PATH="$HOME/.local/bin:$PATH"

# Added by Raindrop installer
fish_add_path "$HOME/.raindrop/bin"
# End Raindrop installer
