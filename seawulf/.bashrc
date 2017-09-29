# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
alias emacs="emacs -nw"
export EDITOR="emacs -nw"
export SVN_EDITOR="emacs -nw"

# Boxlib codes
export AMREX_USE_MPI_WRAPPERS=1
export AMREX_HOME="/gpfs/home/dwillcox/codes/amrex"
export MICROPHYSICS_HOME="/gpfs/home/dwillcox/codes/Microphysics"
export MAESTRO_HOME="/gpfs/home/dwillcox/codes/MAESTRO"
export CASTRO_HOME="/gpfs/home/dwillcox/codes/Castro"

# Job control scripts
export PATH="/gpfs/home/dwillcox/job-run-scripts:$PATH"

# added by Anaconda3 4.1.1 installer
export PATH="/gpfs/home/dwillcox/anaconda3/bin:$PATH"

# Modules to load on login
module load shared maui torque anaconda/3 gcc openmpi

# prompt -- this gets the git branch in the prompt
# we also use some coloring.  Note that we need to put the 
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
