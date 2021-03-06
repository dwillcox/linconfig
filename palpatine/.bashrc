# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

## Remote LOGINS
alias handy="ssh -X dwillcox@handy.iacs.stonybrook.edu"
alias eldorado="ssh -X dwillcox@eldorado.astro.sunysb.edu"
alias zwicky="ssh -X dwillcox@zwicky.astro.sunysb.edu"
alias melvin="ssh -X dwillcox@melvin.astro.sunysb.edu"
alias delorean="ssh -X dwillcox@delorean.astro.sunysb.edu"
alias kirk="ssh -X dwillcox@kirk.astro.sunysb.edu"
alias fleetwood="ssh -X dwillcox@fleetwood.astro.sunysb.edu"
alias electra="ssh -X dwillcox@electra.iacs.stonybrook.edu"
alias alcyone="ssh -X dwillcox@alcyone.iacs.stonybrook.edu"
alias bender="ssh -X dwillcox@bender.astro.sunysb.edu"
alias variable="ssh -X dwillcox@variable.ph.ua.edu"
alias sbumerger="ssh -X -o ServerAliveInterval=60 dwillcox@merger.astro.sunysb.edu"
alias titan="ssh -X -o ServerAliveInterval=60 dwillcox@titan.ccs.ornl.gov"
alias rhea="ssh -X -o ServerAliveInterval=60 dwillcox@rhea.ccs.ornl.gov"
alias olcf="ssh -X -o ServerAliveInterval=60 dwillcox@home.ccs.ornl.gov"
alias zilla="ssh -X -o ServerAliveInterval=60 dewillcox@zilla.lbl.gov"

# Misc aliases
alias xclip="xclip -selection c"
alias n="nautilus ."
alias wgetff="wget --user-agent=\"Mozilla/5.0 (Windows NT 5.2; rv:2.0.1) Gecko/20100101 Firefox/4.0.1\""

# Emacs Editor Setup
alias emacs="emacs -nw"
export EDITOR="emacs -nw"
export SVN_EDITOR="emacs -nw"

# Emacs editor daemon
alias cem="emacsclient -nw"
alias cemacs="emacsclient -nw"

# Set terminal for screen
export TERM="xterm"

# Function definitions
start_emacs_server() {
        emacs --daemon >/dev/null 2>&1
}

fork() {
	$1 >/dev/null 2>&1 &
}

ddoc() {
	nohup evince $1 >/dev/null 2>&1 &
}

dimg() {
	nohup display $1 >/dev/null 2>&1 &
}

pdfcat() {
	gs -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite -sOutputFile="$1" "${@:2}"

}

# prompt -- this gets the git branch in the prompt
# we also use some coloring. Note that we need to put the 
# coloring escape codes inside \[ \], otherwise, bash will include
# them in the line length calculation and things will be messed up.
# also deal with root
source /usr/share/git-core/contrib/completion/git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1

if [ $(id -u) -eq 0 ]; then
    # root
    export PS1='\[\e[0;31m\][\u@\h \W]# \[\e[0m\]'
else
    # normal user 
    export PS1='[\u@\[\e[1;34m\]\h\[\e[0m\] \W]\[\e[1;34m\]$(__git_ps1 "(%s)")\[\e[0m\]$ '
fi

