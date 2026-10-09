if status is-interactive
    ############################
    # ===== Abbreviations ==== #
    ############################

    # Git abbreviations
    abbr --add ga 'git add'
    abbr --add gc 'git commit'
    abbr --add gca 'git commit --amend --no-edit'
    abbr --add gco 'git checkout'
    abbr --add gd 'git diff'
    abbr --add gds 'git diff --staged'
    abbr --add gp 'git push'
    abbr --add gpf 'git push --force-with-lease'
    #abbr --add gpm 'git emma'
    abbr --add gs 'git status'
    abbr --add gst 'git stash'
    abbr --add gsts 'git stash --staged'
    abbr --add gstu 'git stash --keep-index'
    abbr --add gu 'git restore --staged'

    # Other abbreviations
    # e=explicitly installed
    abbr --add pacinst 'pacman -Qqe | fzf --preview \'pacman -Qil {}\' --layout=reverse --bind \'enter:execute(pacman -Qil {} | less)\''

    ###################################
    # ===== Interactive env vars ==== #
    ###################################

    # `set -gx NAME VALUE` is functionally identical to `export NAME=VALUE`

    set -gx EDITOR nvim
    set -gx VISUAL nvim
    set -gx PAGER less

    # if not set -q TMUX
    #     exec tmux
    # end
end

# See the following:
#   Systemd users can also start Hyprland, using uwsm. This is the recommended method of launching
#   Hyprland on systemd-based distros, as it provides additional features such as xdg-autostart
#   support, launching any application as a systemd-unit with uwsm app helper, and the ability to
#   enable services for programs that rely on a graphical session and provide such services (e.g
#   waybar). See uwsm page for further instructions.

bind \cs forward-char

##### SYSTEM VARIABLES #####
set -q XDG_DATA_HOME; or set -gx XDG_DATA_HOME "$HOME/.local/share"
set -q XDG_CONFIG_HOME; or set -gx XDG_CONFIG_HOME "$HOME/.config"
set -q XDG_CACHE_HOME; or set -gx XDG_CACHE_HOME "$HOME/.cache"

##### APPLICATION SPECIFIC VARIABLES #####
# Add .local/bin to path
#set -gx PATH $HOME/.local/bin $PATH

# Add cargo bin directory to path
set -gx PATH $HOME/.cargo/bin $PATH

# Haskell (ghcup)
set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME
set -gx PATH $HOME/.cabal/bin $HOME/.ghcup/bin $PATH # ghcup-env

# Go (I think this is default and doesn't matter)
set -gx GOPATH "$XDG_DATA_HOME/go"
set -gx GOMODCACHE "$XDG_CACHE_HOME/go"

##### WINDOW MANAGER #####
# Start Hyprland at login
if status is-login
    if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
        # exec Hyprland
        exec start-hyprland
    end
end

# uv
fish_add_path "/home/johannes/.local/share/../bin"
