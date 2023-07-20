if status is-interactive
    abbr --add ga 'git add'
    abbr --add gc 'git commit'
    abbr --add gco 'git checkout'
    abbr --add gd 'git diff'
    abbr --add gds 'git diff --staged'
    abbr --add gp 'git push'
    abbr --add gs 'git status'
    abbr --add gst 'git stash'
    abbr --add gsts 'git stash --staged'
    abbr --add gstu 'git stash --keep-index'
    abbr --add gu 'git restore --staged'

    export EDITOR=nvim

    if not set -q TMUX
        exec tmux
    end
end

