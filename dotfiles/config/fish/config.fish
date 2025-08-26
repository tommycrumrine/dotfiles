if status is-interactive
    # Commands to run in interactive sessions can go here
end
set -x NVM_DIR ~/.nvm
set -x EDITOR nvim
set -x CONSOLE_USER tommy.crumrine
nvm use default --silent
alias vim nvim
alias vi nvim
status --is-interactive; and rbenv init - fish | source

# pnpm
set -gx PNPM_HOME "/Users/tommy/Library/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
