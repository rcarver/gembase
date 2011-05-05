curl -sO "https://github.com/rcarver/gembase/blob/master/Rakefile.base"

if [ ! -d .git ]; then
  dir=$(cd `dirname $0` && pwd)
  name=`basename $dir`
  `bundle gem $name`
  `cd $name`
fi
