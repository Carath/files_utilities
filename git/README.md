## Commit (first time):

In the project directory:

```
git commit
```


## Commit a single file:

```
git add filepath
git commit -m "Commit description"
```


## Commit all files:

```
git add -A && git commit -m "Commit description"
```


## Show history:

```
git log
```

More detailed:

```
git log --all
```

Last commit only:

```
git log -1
```


## Hard reset, when everything else fails:

```
git reset --hard <commit_hash>
```


## Pushing (first time):

```
git remote add origin https://github.com/<username>/<projectname>
```

Variant:

```
git remote add origin git@github.com:<username>/<projectname>.git
```

Actual push:

```
git push --set-upstream origin master
```


## Pushing (afterhand):

```
git push origin master
```


## Pushing an empty directory:

In said directory:

```
touch .gitkeep // not working with git properly
git add .gitkeep
git commit -m "Adding empty directories"
```

Then push.


## Cloning:

```
git clone https://github.com/<username>/<projectname>.git
```

## Pulling:

In the project directory(!)

```
git pull
```


## Shell script for creating an empty file in every empty directory, recursively:

```sh
#!/bin/sh

find . -type d -empty -not -path "./.git/*" -exec touch {}/.gitkeep \;
```


## Show local tags (pull to get remote ones):

```
git tag
```


## Create a tag, and push the change:

```
git tag tagname
git push origin tagname
```


## Remove the desired tag, and push the change:

```
git tag -d tagname
git push origin :refs/tags/tagname
```
