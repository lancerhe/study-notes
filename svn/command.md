```bash
# Tree conflicts:
svn resolve --accept working -R app/Test.php

# Add Ignore
echo '.svnignore
vendor
composer.lock' > .svnignore

svn propset svn:ignore -F .svnignore .

# Remove .svn folder
find . -type d -name ".svn" | xargs rm -rf
```
