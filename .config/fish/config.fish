set fish_function_path $fish_function_path "/usr/share/powerline/bindings/fish"
source /usr/share/powerline/bindings/fish/powerline-setup.fish
powerline-setup
~/repos/shell-color-scripts/colorscript.sh -r
alias df="df --exclude-type=tmpfs --exclude-type=devtmpfs -h"
set MP /media/tibi
set SP /usr/local/scripts
alias rr="curl -s -L http://bit.ly/10hA8iC | bash"
alias stripsql="mysqldump -u root -p -h localhost --opt users -d --single-transaction -S '/opt/lampp/var/mysql/mysql.sock' | sed 's/ AUTO_INCREMENT=[0-9]*//g' > schema.sql"
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias nope='. /usr/local/scripts/nope'
set SHELL "/usr/bin/fish"
function bind_bang
    switch (commandline -t)[-1]
        case "!"
            commandline -t $history[1]; commandline -f repaint
        case "*"
            commandline -i !
    end
end

function bind_dollar
    switch (commandline -t)[-1]
        case "!"
            commandline -t ""
            commandline -f history-token-search-backward
        case "*"
            commandline -i '$'
    end
end

function fish_user_key_bindings
    bind ! bind_bang
    bind '$' bind_dollar
end
