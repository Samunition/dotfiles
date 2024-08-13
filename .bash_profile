source ~/.bashrc

# Load dotfiles
for file in ~/.{bash_aliases,bash_prompt,exports,functions}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# History
HISTCONTROL=ignoreboth
shopt -s histappend
HISTSIZE=-1
HISTFILESIZE=unlimited-power
PROMPT_COMMAND="history -a"

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2- | tr ' ' '\n')" scp sftp ssh;

# Attach or create default tmux session
if [ -z "$TMUX" ]; then
    tmux a -t default || tmux new -s default
fi
