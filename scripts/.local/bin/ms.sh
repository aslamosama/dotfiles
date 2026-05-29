#!/bin/env bash

current_sem=$(find ~/ms -maxdepth 1 -type d -name "sem[0-9]*" |
  sed 's/.*sem//' |
  sort -n |
  tail -1)
if [ -z "$current_sem" ]; then
  echo "No sem folders found in ~/ms"
  exit 1
fi

sem_path="$HOME/ms/sem$current_sem"
course_folders=$(fd . "$sem_path" --max-depth=1 --type=directory --exec=basename | sort)
if [ -z "$course_folders" ]; then
  echo "No course folders found in $sem_path"
  exit 1
fi

selected_course=$(echo "$course_folders" | fzf \
  --prompt="Select course: " --height=100% \
  --preview-window "right,60%,border-top" \
  --border=block --margin=5%,10%,5%,10% \
  --preview "fuz-preview $sem_path/{}/cover.jpg" )
if [ -z "$selected_course" ]; then
  echo "No course selected"
  exit 0
fi

link_path="$HOME/ms/current"
target_path="$sem_path/$selected_course"
[ -L "$link_path" ] && rm "$link_path"
ln -s "$target_path" "$link_path"

cd "$link_path" && yazi
