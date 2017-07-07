alias ll="ls -ailh"
alias grep='grep --color=auto'
alias json="python -mjson.tool"

alias dec2hex='printf "%x\n" $1'
alias hex2dec='printf "%d\n" 0x$1'

# Git
alias gl="git log --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --graph"
alias gpr="open https://github.com/xxxxx/compare/\`git symbolic-ref --short HEAD\`?expand=1"
alias github="open \`git remote -v | grep github.com | grep fetch | head -1 | field 2 | sed 's/git:/http:/g'\`"
alias gclear="find . -type d -name \".git\" -exec rm -rf \{\} \;"

# Colordiff
if [ -x /usr/bin/colordiff ]; then
	alias diff='colordiff'
fi

if isMac; then
	alias update="brew update && brew upgrade && brew cask update && brew cleanup && brew cask cleanup"

	# Java
	alias setjdk17='export JAVA_HOME=$(/usr/libexec/java_home -v 1.7)'
	alias setjdk18='export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)'

	# Finder
	alias showDotFiles='defaults write com.apple.finder AppleShowAllFiles YES;
	killall Finder /System/Library/CoreServices/Finder.app'

	alias hideDotFiles='defaults write com.apple.finder AppleShowAllFiles NO;
	killall Finder /System/Library/CoreServices/Finder.app'

	# Lock the screen (when going AFK)
	# alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"
	# Sleep the display but keep the machine running
	alias afk="pmset displaysleepnow"
fi

# Reload the shell (i.e. invoke as a login shell)
alias reload="exec $SHELL -l"
