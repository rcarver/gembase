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

echo 'Creating CHANGELOG.md'
echo "0.0.1 / `date '+%Y-%m-%d'`" > CHANGELOG.md

echo 'Creating README.md'
echo "# $name" > README.md

git add .
git commit -m "Initialize with gembase"
