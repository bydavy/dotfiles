#!/bin/bash
set -e

###############################################################
# This script installs all dotfiles containes in the project.
###############################################################

BASEDIR=$(dirname "$0")
if [ "$BASEDIR" = '.' ]; then
	BASEDIR=$(pwd)
fi
cd "$BASEDIR"

NOW=$(date +"%m_%d_%Y__%H_%M_%S")

# Directory containing this project
DOTFILES_ROOT=${DOTFILES_ROOT:-$BASEDIR}
# Directory to backup existing files or directories to
DOTFILES_BACKUP=${DOTFILES_BACKUP:-$DOTFILES_ROOT/backup/$NOW}
DOTFILES_PUBLIC=${DOTFILES_PUBLIC:-$DOTFILES_ROOT/public}
DOTFILES_SECURE=${DOTFILES_SECURE:-$DOTFILES_ROOT/secure}
IGNORED_FILES="put_secure_dotfiles_here"

cd "$DOTFILES_ROOT"

# Backup a file or Directory
#
# $1 file or directory to backup
# $2 backup destination
backup() {
	local SRC=$1
	local DST=$2

	# Create backup dir if doesn't exist
	[ ! -d "$DST" ] && mkdir -p "$DST"

	echo "Moving existing $SRC to $DST"
	mv "$SRC" "$DST/"
}

# Tests $1 is a symbolink link to $2
#
# $1 source of the lin
# $2 destination of the link
islinkOf() {
	local SRC=$1
	local DST=$2

	if [ -L "$DST" -a "$(readlink "$DST")" = "$SRC" ]; then
		return 0
	fi

	return -1
}

# Creates a link from $1 to $2 only if the $1 exists
#
# $1 source file or directory
# $2 destination file
createLinkIfExists() {
	if ! islinkOf "$1" "$2"; then
		[ -f "$1" ] && ln -fs "$1" "$2" && echoLinkCreation "$2" &
		[ -d "$1" ] && ln -fsn "$1" "$2" && echoLinkCreation "$2" &
	fi
}

echoLinkCreation() {
	echo "Created link to $1"
}

# Creates links for all files or directory in $1, destination of the symbolink
# link is $2. File and directory names are concerved.
#
# $2 source
# $3 destination
createLinks() {
	local SRC=$1
	local DST=$2

	for FILE in $(ls -A "$SRC"); do
		if [[ $IGNORED_FILES =~ (^|[[:space:]])"$FILE"($|[[:space:]]) ]]; then
			continue;
		fi
		FILE_SRC=$SRC/$FILE
		FILE_DST=$DST/$FILE
	    if ! islinkOf "$FILE_SRC" "$FILE_DST"; then
	    	if [ -e "$FILE_DST" ]; then
	    		backup "$FILE_DST" "$DOTFILES_BACKUP"
	    	fi

	    	createLinkIfExists "$FILE_SRC" "$FILE_DST"
	    fi
	done
}

# Scan DOTFILES_PUBLIC dir to create links
createLinks "$DOTFILES_PUBLIC" "$HOME" &

# Scan DOTFILES_SECURE dir to create links
createLinks "$DOTFILES_SECURE" "$HOME" &
