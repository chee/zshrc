# git
alias ga="git add -p"
alias gc="git commit -v"
alias gcd="git checkout develop"
alias gcp="git cherry-pick"
alias gd="git diff"
alias gpl="git pull"
alias gps="git push"
alias gr="git root"
alias gs='git status; git ls-files -v | grep \^h'


# hosts
alias bpr="open \$(echo https://bitbucket.org/\$(git remote -v | head -1 | perl -p -e 's|.*:([^ ]+).*|\1|' | sed 's/\.git$//')/pull-requests/new?source=\$(git current-branch))"
alias bpre="echo https://bitbucket.org/\$(git remote -v | head -1 | perl -p -e 's|.*:([^ ]+).*|\1|' | sed 's/\.git$//')/pull-requests/new?source=\$(git current-branch)"
alias pr="open \"\$(echo https://github.com/\$(git remote -v | head -1 | perl -p -e 's|.*:([^ ]+)(.git)?.*|\1|' | sed 's/\.git$//')/compare/\$(git current-branch))\""
alias pre="echo https://github.com/\$(git remote -v | head -1 | perl -p -e 's|.*:([^ ]+)(.git)?.*|\1|' | sed 's/\.git$//')/compare/\$(git current-branch)"
