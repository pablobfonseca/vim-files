function bcp --description "Remove brew plugins"
  set -l inst (brew leaves | eval "fzf --height=50% --min-height=15 -m --header='[brew:update]'")

  if not test (count $inst) = 0
    for prog in $inst
      brew uninstall "$prog"
    end
  end
end
