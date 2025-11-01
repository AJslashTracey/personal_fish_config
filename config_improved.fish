# Fish Shell Configuration
# Improved version with better practices

# ============================================================================
# Interactive Session Setup
# ============================================================================
if status is-interactive
    # Initialize modern CLI tools
    
    # Zoxide - smarter cd (already installed!)
    # Learn: After using 'z' to jump to directories, it learns your habits
    zoxide init fish | source
    
    # thefuck - corrects your previous console command (already installed!)
    # Learn: Type 'fuck' after a failed command to auto-correct it
    thefuck --alias | source
    
    # fzf key bindings (Ctrl-R for history, Ctrl-T for files)
    # Learn: Ctrl-R gives you fuzzy searchable command history
    if type -q fzf
        fzf --fish | source
    end
end

# ============================================================================
# Environment Variables
# ============================================================================

# Add common paths
fish_add_path /Applications/Cursor.app/Contents/Resources/app/bin
fish_add_path /Library/TeX/texbin

# Set preferred editor (since you have nvim)
set -gx EDITOR nvim
set -gx VISUAL nvim

# Better history
set -g fish_history_size 100000

# ============================================================================
# Abbreviations (Better than functions for simple navigation)
# Learn: Abbreviations expand when you press space, so you see what runs
# ============================================================================

# Navigation shortcuts
abbr -a -- conf 'cd ~/.config'
abbr -a -- fishconf 'cd ~/.config/fish && $EDITOR config.fish'
abbr -a -- desk 'cd ~/Desktop'
abbr -a -- gitp 'cd ~/Desktop/GitHub/Untitled'

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

# Modern CLI replacements
# Learn: These use your installed tools for better output
abbr -a -- ls 'eza --icons --group-directories-first'
abbr -a -- ll 'eza -l --icons --group-directories-first'
abbr -a -- la 'eza -la --icons --group-directories-first'
abbr -a -- lt 'eza --tree --icons --group-directories-first'
abbr -a -- cat 'bat'  # bat has syntax highlighting!
abbr -a -- find 'fd'  # fd is faster and easier

# Docker shortcuts (you have docker)
abbr -a -- d 'docker'
abbr -a -- dc 'docker compose'
abbr -a -- dps 'docker ps'
abbr -a -- di 'docker images'

# Kubernetes shortcuts (you have kubectl)
abbr -a -- k 'kubectl'
abbr -a -- kgp 'kubectl get pods'
abbr -a -- kgs 'kubectl get services'
abbr -a -- kd 'kubectl describe'
abbr -a -- kl 'kubectl logs'

# System utilities
abbr -a -- reload 'exec fish'
abbr -a -- src 'source ~/.config/fish/config.fish'

# ============================================================================
# Conda Initialize (keeping your existing setup)
# ============================================================================
if test -f /opt/anaconda3/bin/conda
    eval /opt/anaconda3/bin/conda "shell.fish" "hook" $argv | source
else
    if test -f "/opt/anaconda3/etc/fish/conf.d/conda.fish"
        . "/opt/anaconda3/etc/fish/conf.d/conda.fish"
    else
        set -x PATH "/opt/anaconda3/bin" $PATH
    end
end

# ============================================================================
# Custom Functions (keep complex ones, put in separate files in functions/)
# ============================================================================
# Note: Simple functions moved to separate files for better organization
# See: ~/.config/fish/functions/

