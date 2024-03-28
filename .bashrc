# .bashrc

# User specific aliases and functions

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

alias dcps='docker-compose ps -a'
alias dbounce='docker-compose down ; sleep 5 ; docker-compose up -d'
alias nagios='docker-compose exec nagios bash'
alias pg='docker-compose exec pg bash'

# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi
