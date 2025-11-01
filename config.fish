if status is-interactive
    # Initialize modern CLI tools

    # Zoxide - smarter cd (learns your directory habits)
    # Learn: Use 'z' to jump to frequently used directories
    # Example: 'z github' jumps to ~/Desktop/GitHub/Untitled
    if type -q zoxide
        zoxide init fish | source
    end

    # thefuck - corrects your previous console command
    # Learn: Type 'fuck' after a failed command to auto-correct it
    # Example: 'gti status' -> 'fuck' -> runs 'git status'
    if type -q thefuck
        thefuck --alias | source
    end

    # fzf key bindings for fuzzy finding
    # Learn: Ctrl-R = fuzzy command history, Ctrl-T = fuzzy file search
    if type -q fzf
        fzf --fish | source
    end
end


# Set preferred editor
set -gx EDITOR cursor
set -gx VISUAL cursor

# Better command history
set -g fish_history_size 100000

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /opt/anaconda3/bin/conda
    eval /opt/anaconda3/bin/conda "shell.fish" "hook" $argv | source
else
    if test -f "/opt/anaconda3/etc/fish/conf.d/conda.fish"
        . "/opt/anaconda3/etc/fish/conf.d/conda.fish"
    else
        set -x PATH "/opt/anaconda3/bin" $PATH
    end
end
# <<< conda initialize <<<

# ============================================================================
# Abbreviations (expand when you press space - better than simple functions)
# ============================================================================

# Navigation shortcuts
abbr -a -- conf 'cd ~/.config'
abbr -a -- desk 'cd ~/Desktop'
abbr -a -- gitp 'cd ~/Desktop/GitHub/Untitled'
abbr -a -- wezterm 'cd ~/.config/wezterm'

# Git shortcuts (huge time saver!)
abbr -a -- g 'git'
abbr -a -- gs 'git status'
abbr -a -- ga 'git add'
abbr -a -- gc 'git commit'
abbr -a -- gp 'git push'
abbr -a -- gl 'git log --oneline --graph --decorate'
abbr -a -- gd 'git diff'
abbr -a -- gco 'git checkout'
abbr -a -- gcb 'git checkout -b'
abbr -a -- gpl 'git pull'

# short cuts
abbr -a -- ls 'eza --icons --group-directories-first' -a
abbr -a -- ll 'eza -l --icons --group-directories-first'
abbr -a -- la 'eza -la --icons --group-directories-first'
abbr -a -- lt 'eza --tree --icons --group-directories-first'
abbr -a -- cat 'bat'  # bat has syntax highlighting!
abbr -a -- find 'fd'  # fd is faster and easier

# Docker shortcuts
abbr -a -- d 'docker'
abbr -a -- dc 'docker compose'
abbr -a -- dps 'docker ps'
abbr -a -- di 'docker images'

# Kubernetes shortcuts
abbr -a -- k 'kubectl'
abbr -a -- kgp 'kubectl get pods'
abbr -a -- kgs 'kubectl get services'
abbr -a -- kd 'kubectl describe'
abbr -a -- kl 'kubectl logs'

# System utilities
abbr -a -- reload 'exec fish'
abbr -a -- src 'source ~/.config/fish/config.fish'

# ============================================================================
# Custom Functions (keeping your complex workflows)
# ============================================================================

function deskopen --description "Open desktop in Finder"
    open ~/Desktop
end


function fzffind --description "Fzf with preview built in"
    fzf --preview "bat {}"
end

function logs --description "shows railway logs of curent project"
    railway logs
end





# fzffinder replaced by fzf_preview function in ~/.config/fish/functions/fzf_preview.fish
# Use: fzf_preview or fzf_preview -e (to edit selected file)

function downloadData --description "Download and commit data for edge development"
    cd /Users/juristoffers/Desktop/GitHub/Untitled/edgeDevelopment
    python download_data.py
    cd /Users/juristoffers/Desktop/GitHub/Untitled
    code edgeDevelopment/
    cd /Users/juristoffers/Desktop/GitHub/Untitled/edgeDevelopment
    git add data/
    git commit -a -m "Adding data (via CLI script)"
    git push origin main
    cd /Users/juristoffers/Desktop/GitHub/Untitled/edgeDevelopment/research
    code filePath.py
end

# fishconf - edit fish config (keeping as function since it opens editor)
function fishconf --description "Edit fish config in editor"
    cd ~/.config/fish
    $EDITOR config.fish
end

# vscode and cursorPath kept for PATH management
function vscode --description "Add VSCode to PATH"
    fish_add_path /Applications/vscode.app/Contents/Resources/app/bin
end

function cursorPath --description "Add Cursor to PATH"
    fish_add_path /Applications/Cursor.app/Contents/Resources/app/bin
end

# ============================================================================
# Git Branch in Prompt
# ============================================================================
function fish_prompt
    set -l git_branch (git branch 2>/dev/null | sed -n '/\* /s///p')
    if test -n "$git_branch"
        echo -n (set_color cyan)(prompt_pwd)(set_color yellow)" ($git_branch)"(set_color normal)" > "
    else
        echo -n (set_color cyan)(prompt_pwd)(set_color normal)" > "
    end
end

# ============================================================================
# PATH Additions
# ============================================================================
fish_add_path /Applications/Cursor.app/Contents/Resources/app/bin
fish_add_path /Library/TeX/texbin
