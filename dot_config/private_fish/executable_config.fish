# function fish_prompt -d "Write out the prompt"
#     # This shows up as USER@HOST /home/user/ >, with the directory colored
#     # $USER and $hostname are set by fish, so you can just use them
#     # instead of using `whoami` and `hostname`
#     printf '%s@%s %s%s%s > ' $USER $hostname \
#         (set_color $fish_color_cwd) (prompt_pwd) (set_color normal)
# end

if status is-interactive
    # Commands to run in interactive sessions can go here
    set fish_greeting

end

set PATH $PATH:/home/josh/.cargo/bin

zoxide init fish | source

# starship init fish | source
# if test -f ~/.cache/ags/user/generated/terminal/sequences.txt
#     cat ~/.cache/ags/user/generated/terminal/sequences.txt
# end

alias pamcan=pacman
alias ins="sudo pacman -S"
alias rem="sudo pacman -R"
alias fishconfig="nvim ~/.config/fish/config.fish"
alias chat-delete-all="firebase -P chat-e91eb firestore:delete --all-collections"
alias :q="exit"
alias ls="exa"
alias lsl="exa -l"
alias lst="exa -T"
alias lslong="ls -lbBghHmiMOSuU"
alias kittyconfig="nvim /home/josh/.config/kitty/kitty.conf"
alias nvimconfig="nvim /home/josh/.config/nvim/"
alias hyprconfig="nvim /home/josh/.config/hypr/hyprland/keybinds.conf"
alias cd="z"
alias fzfb="fzf --preview 'bat --color=always {}' --preview-window '~3'"
alias clone="git clone"
alias myhouse="gzdoom -iwad ~/.config/gzdoom/DOOM2.WAD -file ~/.config/gzdoom/myhouse.pk3"

set BROWSER librewolf.desktop

function repo
    cd /home/josh/repos/$argv[1]
    nvim /home/josh/repos/$argv[1]
end

function rust-install
    RUSTC_WRAPPER=sccache cargo install $argv[1]
end

function fish_prompt
    echo ""
    set_color grey
    string replace /home/josh "~" (pwd)
    set_color green
    echo '> '
end

# pnpm
set -gx PNPM_HOME "/home/josh/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
    set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
