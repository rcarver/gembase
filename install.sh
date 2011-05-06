if [ ! -d .git ]; then
  dir=$(cd `dirname $0` && pwd)
  name=`basename $dir`
  echo "Initializing $name with bundle gem"
  cd .. && bundle gem $name
  cd $name
fi

echo 'Creating Rakefile'
echo 'load "Rakefile.base"' > Rakefile

echo 'Creating Rakefile.base'
curl -sO "https://github.com/rcarver/gembase/raw/master/Rakefile.base"

git add .
