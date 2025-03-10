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
