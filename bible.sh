#!/bin/bash

# Set user input (iu) variable
ui=$@

# Set version ($ver) variable
translation () {

if [ "$(echo $ui | egrep -o 'ver=|\-ver=\-\-ver')" == "" ] ; then
	export ver=KJV
	else
	export ver=$(echo $ui | sed -r 's/.*ver=(.*\>).*/\1/')
fi

}

passage_bac_varibles () {

# Set passage variable by removing space and version
export passage=$(echo $ui | sed -r "s/[\-]*ver=.*\>//" | sed 's/ //g')

# Set book and chapter (bac) variable by removing anything before the colon
export bac=$(echo "$passage" | cut -d: -f1)

}

hyphen () {

	# Set verse 1 (ver1) variable
	ver1=$(echo "$passage" | cut -d: -f2 | cut -d\- -f1)
	# Set verse 2 (ver2) variable
	ver2=`echo "$passage" | cut -d: -f2 | cut -d\- -f2`
	for num in $(seq $ver1 $ver2) ; do
		curl -s "https://www.biblegateway.com/passage/?search=$bac:$num&version=$ver" | grep '.*passage-display.*">' | html2text | sed -e 's/[0-9]*Â //' -e 's/â/“/g' -e 's/â/”/g' -e 's/â/‘/g' -e 's/â/’/g' -e 's/â/—/g'
		echo ""
	done

}

whole_chapter () {

curl -s "https://www.biblegateway.com/passage/?search=$passage&version=$ver" | grep '.*passage-display.*">' | html2text | sed -e 's/â<80><9d>/“/g' -e 's/â<80><9c>/”/g' -e 's/â<80><98>/‘/g' -e 's/â<80><99>/’/g' -e 's/â<80><94>/—/g' | sed -r '2s/[0-9]+Â/1/' | sed -r 's/([0-9]+)Â/\1/'

}

logic () {

#Check for hyphens
if [ "$(echo "$passage" | grep -o "-")" == "-" ] ; then
	# If there is a hyphen run hyphen function
	hyphen
else 
	#Check if there are any verses
	if ! [ "$(echo "$passage" | grep -o ":")" == ":" ] ; then
		whole_chapter
	else
		curl -s "https://www.biblegateway.com/passage/?search=$passage&version=$ver" | grep '.*passage-display.*">' | html2text | sed -e 's/[0-9]*Â //' -e 's/â/“/g' -e 's/â/”/g' -e 's/â/‘/g' -e 's/â/’/g' -e 's/â/—/g'
	fi
fi

}

translation
passage_bac_varibles
logic
