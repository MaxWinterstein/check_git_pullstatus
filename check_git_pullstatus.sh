# idea from http://stackoverflow.com/a/16920556/635876

#!/bin/bash
GITNAME="myRepository"
DIR="/path/to/myRepo"

cd $DIR

if [ "`git log --pretty=%H ...refs/heads/master^ | head -n 1`" = "`git ls-remote origin -h refs/heads/master |cut -f1`" ] ; then
    status=0
    statustxt="up to date"
else
    status=2
    statustxt="not up to date"
fi

if [[ `git status --porcelain` ]]; then
    status=1
    statustxt="uncommited"
fi


echo "$status git_status_$GITNAME - $statustxt"



