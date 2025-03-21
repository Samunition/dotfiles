function get_git_branch() {
    echo "($(git branch 2>/dev/null | grep '^*' | colrm 1 2))"
}


function get_tf_workspace() {
    if [ -x "$(command -v terraform)" ]; then
        if [ -d .terraform ]; then
            echo "($(terraform workspace show 2>/dev/null))"
        fi
    fi
}

# source /etc/bash_completion.d/git-prompt
# alternatively add git-prompt.sh to ~/.bashrc.d/
PS1='\[\033[01;32m\]sam@gofannon\[\033[00m\]:\[\033[01;34m\]\w\[\033[38;5;166m\]$(__git_ps1)\[\033[00m\]\[\033[35m\]$(get_tf_workspace 2> /dev/null)\[\033[00m\]\$ '

export PS1

