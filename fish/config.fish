if status is-interactive
    abbr --add ga 'git add'
    abbr --add gc 'git commit'
    abbr --add gco 'git checkout'
    abbr --add gd 'git diff'
    abbr --add gds 'git diff --staged'
    abbr --add gp 'git push'
    abbr --add gpm 'git emma'
    abbr --add gs 'git status'
    abbr --add gst 'git stash'
    abbr --add gsts 'git stash --staged'
    abbr --add gstu 'git stash --keep-index'
    abbr --add gu 'git restore --staged'

    export EDITOR=nvim

    # if not set -q TMUX
    #     exec tmux
    # end
end

# Start Hyprland at login
if status is-login
    if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
        exec Hyprland
    end
end

bind \cs forward-char

set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME
set -gx PATH $HOME/.cabal/bin $HOME/.ghcup/bin $PATH # ghcup-env
set -gx PATH $HOME/.local/bin $PATH
