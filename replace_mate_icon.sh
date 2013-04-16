#!/bin/bash
#
# Script to replace the mate icons in some themes with the 'debian swirl' icon.
#

function error {
	echo $1
	exit 1
}

theme="menta"
size="24x24" 

debicon="/usr/share/icons/gnome/"$size"/places/debian-swirl.png"
themefolder="/usr/share/icons/"$theme"/"$size"/places"
mateicon=$themefolder"/start-here.png" 
mateiconbak=$themefolder"/start-here_bak.png" 

if [ -e $debicon ]; then
	if [ -e $themefolder ]; then
		if [ -e $mateicon ]; then
			if [ ! -h $mateicon ]; then
				mv $mateicon  $mateiconbak
				ln -s $debicon $mateicon
			else
				error "Mateicon already is a symlink!"					 
			fi
		else			
			error "Mateicon does not exist: "$mateicon
		fi
	else	
		error "Themefolder does not exist: "$themefolder
	fi
else
	error "Debian icon does not exist: "$debicon 		
fi


