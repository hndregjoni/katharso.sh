#! /bin/bash

ARGUMENT=$1
WDIR=~/Documents/.Diary

function seal() {
  draft=$1

  who=`whoami`

  beginstamp=`basename $draft .draft`
  endstamp=`date +%s`

  cat >>$draft <<EOF

=====
Started: `date -d @$beginstamp`
Sealed: `date -d @$endstamp`
$who
EOF

  openssl des3 -salt -pbkdf2 -in $draft -out $WDIR/pages/$beginstamp.sealed
}

case $ARGUMENT in
  new)
    timestamp=`date +%s`

    touch $WDIR/drafts/$timestamp.draft

    echo $WDIR/drafts/$timestamp.draft created.

    ;;
  seal)
    toseal=$2

    [[ ! $toseal =~ ^.*.draft$ ]] && toseal=$toseal.draft

    if [ ! -f $WDIR/drafts/$toseal ]; then
      echo "File $toseal doesn't exist" 1>&2
      exit 0
    fi

    seal $WDIR/drafts/$toseal

    rm $WDIR/drafts/$toseal

    ;;
  peek)
    topeak=$2

    [[ ! $topeak =~ ^.*.sealed$ ]] && topeak=$topeak.sealed

    if [ ! -f $WDIR/pages/$topeak ]; then
      echo "File $topeak doesn't exist" 1>&2
      exit 0
    fi

    read key

    openssl des3 -d -k $key -salt -pbkdf2 -in $WDIR/pages/$topeak 
    ;;
  list)
    ls $WDIR/pages/
    ;;
  list-drafts)
    ls $WDIR/drafts/
    ;;
esac
