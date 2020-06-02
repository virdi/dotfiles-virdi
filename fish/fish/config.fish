# Show the full pathnames
set -U fish_prompt_pwd_dir_length 0
set -Ux EDITOR "atom --wait"

# Start SSH Agent using functions/fish_ssh_agent.fish
fish_ssh_agent

if test -d ~/.local/fish
  for f in ~/.local/fish/*.fish
    source $f
  end
end

# Install fisher
if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end

# Set up the nvm
function nvm
   bass source (brew --prefix nvm)/nvm.sh --no-use ';' nvm $argv
end
set -Ux  NVM_DIR "$HOME/.nvm"
# Uncomment the following line if you are using node frequently
# nvm use default --silent

# Set up rbenv
status --is-interactive; and source (rbenv init -|psub)

# Source the broot helper function
if test -d ~/Library/Preferences/org.dystroy.broot/launcher/fish/br
  source ~/Library/Preferences/org.dystroy.broot/launcher/fish/br
end
set -g fish_user_paths "/usr/local/opt/sqlite/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/sbin" $fish_user_paths

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval /usr/local/anaconda3/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<
