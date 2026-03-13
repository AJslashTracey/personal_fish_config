# Add ~/.local/bin to PATH (for agent, cursor-agent, etc.)
fish_add_path -g ~/.local/bin ~/bin

# OpenClaw dev: openclaw CLI from repo
fish_add_path -g ~/github/openclaw/node_modules/.bin

if status is-interactive
    # Commands to run in interactive sessions can go here
    function app-datacheck
        sudo systemctl status app-datacreation
    end
end

if status is-interactive
    function app-datacheck-10s
        sudo systemctl status app-datacreation-10s
    end
end

function 10s-log
    journalctl -u app-datacreation-10s -f
end
abbr -a -- ls ls -a
