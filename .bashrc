alias l='ls -l'
alias ö='ls -l'
alias g='gvim &>/dev/null'
alias ..='cd ..'

# System shutdown and restart
alias die='sudo shutdown -P now'
alias restart='sudo shutdown -r now'

# Shortcuts to bashrc and vimrc
alias gvimrc='g ~/.vimrc'
alias gbashrc='g ~/.bashrc'

#Open any file with its standard application using go
alias go='xdg-open'

alias ch='chromium-browser'

# Git Shortcuts
alias gis='git status'
alias giss='git status -s'
alias giu='git fetch && git pull && git status'
alias gic='git commit'
alias gicam='git commit -am'
alias gip='git push'
alias gitlogp='git log --pretty=format:"%cn,%cr : %s" --graph -3'
alias gitdc='git diff --cached'

# Used for Power Quality
alias pqrestart='~/3pqpico/restart'
alias psp='ps -A | grep python'
alias kap='killall python'
alias startpq='cd ~/3pqpico && nohup python multi_measure2.py & '
alias startserver='cd ~/3pqpico/ui2 && nohup python webapp.py &'

# Plot any numpy file
alias plot='~/Dropbox/config/plot_npy.py'

# Open Python interpreter with numpy, matplotlib and seaborn (pretty plots) preloaded
alias numpy='python -i -c "import numpy as np;import matplotlib.pyplot as plt;import seaborn"'
alias ipython='ipython --pylab'

# Show biggest files in current directory
alias bigfiles='du -a | sort -n -r | head -n 20'

# Use portable pypy 2.4
alias py24='~/spielwiese/pypy2.4-alpha/bin/pypy'

# added by Anaconda3 4.0.0 installer
export PATH="/home/kipfer/anaconda3/bin:$PATH"
