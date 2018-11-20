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
alias titan="ssh -X -o ServerAliveInterval=60 dwillcox@titan.ccs.ornl.gov"
alias rhea="ssh -X -o ServerAliveInterval=60 dwillcox@rhea.ccs.ornl.gov"
alias olcf="ssh -X -o ServerAliveInterval=60 dwillcox@home.ccs.ornl.gov"

# Misc aliases
alias xclip="xclip -selection c"
alias n="nautilus ."
alias wgetff="wget --user-agent=\"Mozilla/5.0 (Windows NT 5.2; rv:2.0.1) Gecko/20100101 Firefox/4.0.1\""

# Emacs Editor Setup
alias ecs="emacs -nw"
export EDITOR="emacs -nw"
export SVN_EDITOR="emacs -nw"

# Emacs editor daemon
alias cem="emacsclient -nw"
alias cemacs="emacsclient -nw"
emacs --daemon >/dev/null 2>&1

# Set terminal for screen
export TERM="xterm"

# Function definitions
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

# Add scripts to path
export PATH="$HOME/scripts:$PATH"
export PATH="$HOME/job-run-scripts:$PATH"

# Add Python code directories to PYTHONPATH
export PYTHONPATH="$HOME/mesautils:$PYTHONPATH"
export PYTHONPATH="$HOME/ND-Tile:$PYTHONPATH"
export PYTHONPATH="$HOME/pyreaclib:$PYTHONPATH"
export PYTHONPATH="$HOME/MAESTRO/Util/postprocessing/central_angle_average:$PYTHONPATH"

# Declare HOMEs for AMReX, MAESTRO, CASTRO, Microphysics
export AMREX_HOME="$HOME/amrex"
export MAESTRO_HOME="$HOME/MAESTRO"
export CASTRO_HOME="$HOME/Castro"
export MICROPHYSICS_HOME="$HOME/Microphysics"

# Declare location and init function for the MESA SDK
export MESASDK_ROOT="$HOME/mesasdk"
export MESA_DIR="$HOME/mesa"

mesasdk() {
    source $MESASDK_ROOT/bin/mesasdk_init.sh
    export PS1='\e[1;32m(MESASDK)\e[m[\u@\[\e[1;34m\]\h\[\e[0m\] \W]\[\e[1;34m\]$(__git_ps1 "(%s)")\[\e[0m\]$ '
}

# Path for LAPACK
export LAPACK_HOME="$HOME/local/lapack-3.7.0"

# Add visit to path
export PATH="$HOME/local/visit/bin:$PATH"

# SVN UPDATE
export SVN_EDITOR="emacs -nw"

# pyjournal
alias pj="pyjournal.py"
alias ptd="pytodo.py"
export PATH="$HOME/pyjournal":$PATH

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

# added by Anaconda3 4.2.0 installer
export PATH="$HOME/anaconda3/bin:$PATH"

# Rotate rightmost screen so it's in portrait mode
#xrandr --output DVI-D-2 --rotate left
