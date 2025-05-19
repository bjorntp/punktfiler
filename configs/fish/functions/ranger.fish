function ranger
  set -l IFS
  set -l tempfile (mktemp -t tmp.XXXXXX)
  command ranger --choosedir=$tempfile $argv
  if test -f $tempfile && test (cat $tempfile) != (pwd)
    cd (cat $tempfile)
  end
  rm -f $tempfile
end
