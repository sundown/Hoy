#!/bin/sh

message="$HOYFMT"

if [ $(git rev-parse --is-inside-work-tree) != true ]; then 
  printf "Ahoy! Looks like you're not inside a Git directory.\n"
  exit
fi

if [ ! -n "$message" ]; then
	message=$(date '+Sync on %Y-%m-%d')
fi

if [ "$1" != "" ]; then
  case $1 in
    "-v")
      printf "Ahoy! I don't keep track of versions.\n"
      exit
    ;;

    "-h"*)
    printf "\e[4m\e[1mAhoy!\e[0m
    
    \e[1mUsage:\e[0m
    \t-h\tPrint this message.
    \t-f\tForce push to remote without pulling \e[4m[NOT RECOMMENDED]\e[0m.
    \t-l\tDo not push to remote.
    
    \e[1mExamples:
    \t\e[4mhoy\e[0m
    \tAdd all files (respects .gitignore),
    \tcommits with the message \$HOYFMT, \n\tand pushes to origin.
    
    \t\e[4mhoy -l \"update readme\"\e[0m
    \tAdd all files (respects .gitignore),
    \tcommits with input message,\n\tdoes not push.\n"
    exit
    ;;

    "-f"*)
      printf "Forcing in..3"
      sleep 0.333 && printf "."
      sleep 0.333 && printf "."
      sleep 0.333 && printf "2"         # 1 second
      sleep 0.333 && printf "."
      sleep 0.333 && printf "."
      sleep 0.333 && printf "1"         # 2 
      sleep 0.333 && printf "."
      sleep 0.333 && printf "."
      sleep 0.333 && printf "now\n\n"   # 3
      force=true
    ;;
    
    "-l"*)
      local=true
      printf "Local only, not pushing.\n"
    ;;
  esac
fi

if [ "$local" != true ] && [ "$force" != true ]; then
  git pull origin master
fi

if [ "$local" = true ] || [ "$force" = true ]; then
  message="${@:2}"
elif [ "$1" != "" ]; then
  message="$@"
fi 

git add * 
git commit -m "$message"

if [ "$local" != true ] ; then
  if [ "$force" = true ] ; then
    git push origin master -f
  else 
    git push origin master
  fi
fi

