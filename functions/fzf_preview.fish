function fzf_preview --description "Fuzzy find files with preview"
    set -l selected (fzf --preview 'bat --color=always --style=numbers {}' \
                         --preview-window='right:70%:wrap')
    if test -n "$selected"
        if test (count $argv) -gt 0; and test "$argv[1]" = "-e"
            $EDITOR $selected
        else
            echo $selected
        end
    end
end