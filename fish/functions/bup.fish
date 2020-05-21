function bup --description "Update brew plugins"
  set -l inst (brew leaves | eval "fzf --height=40% -m --header='[brew:update]'")

  if not test (count $inst) = 0
    for prog in $inst
      brew upgrade "$prog"
    end
  end
end
