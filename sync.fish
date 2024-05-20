#!/usr/bin/env fish

set conf_dir $HOME/.config
set dots_dir (realpath -s (dirname (status filename)))
set ignore (cat $dots_dir/ignore)
set dots

echo "Copying from $conf_dir to $dots_dir"

for conf in $conf_dir/*
    if not contains (basename $conf) $ignore
        set -a dots $conf
    end
end

for conf in $dots
    echo $conf
end

set confirm
read -P "Confirm[Y/n] " confirm

if test $confirm = y; or test $confirm = Y; or test -z $confirm
    for dot in $dots
        cp -r $dot $dots_dir
        echo $dot
    end
else if test $confirm = n; or test $confirm = N
    echo "Aborting..."
    exit
else
    echo "Invalid input, aborting..."
    exit
end

# TODO: Add git stuff
