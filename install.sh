echo 'Updating Rakefile.base'
curl -sO "https://github.com/rcarver/gembase/raw/master/Rakefile.base"

if [ ! -d .git ]; then
  dir=$(cd `dirname $0` && pwd)
  name=`basename $dir`
  echo "Initializing $name with bundle gem"
  cd .. && bundle gem $name
fi
