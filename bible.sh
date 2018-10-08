#!/bin/bash
ver=`echo "\"$@\"" | grep -o "ver=.*" | sed 's/ver=//'`
#echo "$ver test 1"    ###############TEST##############
if [ "$ver" == "" ] ; then
	ver=KJV
fi
#echo "$ver test 2"    ###############TEST##############
passage=`echo "$@" | sed 's/ //g' | sed 's/ver=.*//'`
bac=`echo "$passage" | cut -d: -f1`
#echo "$passage test 3"    ###############TEST##############
if [ "`echo "$passage" | grep -o "-"`" == "-" ] ; then
#	echo "$bac test 4"    ###############TEST##############
	ver1=`echo "$passage" | cut -d: -f2 | cut -d\- -f1`
#	echo "$ver1 test 5"    ###############TEST##############
        ver2=`echo "$passage" | cut -d: -f2 | cut -d\- -f2`
#	echo "$ver2 test 6"    ###############TEST##############
	for i in $(seq $ver1 $ver2) ; do
#	echo "https://www.biblegateway.com/passage/?search=$bac:$i&version=$ver test 7"    ###############TEST##############
	curl -s "https://www.biblegateway.com/passage/?search=$bac:$i&version=$ver" | grep '.*passage-display.*">' | html2text | sed -e 's/[0-9]*Â //' -e 's/â/“/g' -e 's/â/”/g' -e 's/â/‘/g' -e 's/â/’/g' -e 's/â/—/g'
	echo ""
	done
else curl -s "https://www.biblegateway.com/passage/?search=$passage&version=$ver" | grep '.*passage-display.*">' | html2text | sed -e 's/[0-9]*Â //' -e 's/â/“/g' -e 's/â/”/g' -e 's/â/‘/g' -e 's/â/’/g' -e 's/â/—/g'
#echo "https://www.biblegateway.com/passage/?search=$bac:$i&version=$ver test 8"    ###############TEST##############
fi
