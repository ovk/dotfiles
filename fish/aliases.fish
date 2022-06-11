alias vi="nvim"
alias vim="nvim"

alias ll='ls -lh --group-directories-first'
alias la='ls -alh --group-directories-first'

alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'

alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -I'

# nb -> newsboat
if not type -q nb; and type -q newsboat
  alias nb=newsboat
end

# k -> kubecolor | kubectl
if not type -q k
  if type -q kubecolor
    function k --wraps kubectl
      kubecolor $argv
    end
  else if type -q kubectl
    alias k=kubectl
  end
end

