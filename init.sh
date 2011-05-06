dir=$(cd `dirname $0` && pwd)
name=`basename $dir`

echo "Initializing $name with bundle gem"
cd .. && echo 'a' | bundle gem $name && cd $name

echo 'Creating Rakefile'
echo 'load "Rakefile.base"' > Rakefile

echo 'Creating Rakefile.base'
curl -sO "https://github.com/rcarver/gembase/raw/master/Rakefile.base"

echo 'Creating CHANGELOG.md'
echo "0.0.1 / `date '+%Y-%m-%d'`\n==================\n\n  * Initial version" > CHANGELOG.md

echo 'Creating README.md'
echo "# $name" > README.md

# bundler adds to git so we will too.
git add .
