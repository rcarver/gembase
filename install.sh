if [ ! -d .git ]; then
  dir=$(cd `dirname $0` && pwd)
  name=`basename $dir`
  echo "Initializing $name with bundle gem"
  cd .. && bundle gem $name
  cd $name
fi

echo "Initializing Rakefile"
echo 'load "Rakefile.base"' > Rakefile

echo 'Updating Rakefile.base'
curl -sO "https://github.com/rcarver/gembase/raw/master/Rakefile.base"
