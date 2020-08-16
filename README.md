### Ahoy!

Little sh script to sync with Git in a single command. :octocat:

Commit message can be manually input or derived from the `HOYFMT` shell variable.

**How:**
```sh
$ hoy 
# Add all files (respects .gitignore), 
# commits with message from the HOYFMT, 
# and pushes to origin.

# Equivalent to:
$ git pull origin master && git add * && git commit $HOYFMT && git push origin master

```	

```sh
$ hoy -l
# -l (local) skips pulling from and pushing to remote .
```

```sh
$ hoy -f
# -f (force) skips pulling from remote and pushes with the -f flag.
```

```sh
$ hoy -h
# Displays help as well as some examples.
```

**Why?**

Sick typing the same 4 commands and an alias was not appropriate. 

---

My first sh script. Any feedback is appreciated. :evergreen_tree:
