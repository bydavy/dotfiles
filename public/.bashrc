# Lazy way to make sure everything is up-to-date
~/.dotfiles/setup.sh

# Some necessary functions (available in any other ".bash_" file)
. ~/.bash_base

sourceIfReadPermission ~/.bash_init_extra # Hook for any further change
sourceIfReadPermission ~/.bash_init
sourceIfReadPermission ~/.bash_prompt
sourceIfReadPermission ~/.bash_aliases
sourceIfReadPermission ~/.bash_functions
sourceIfReadPermission ~/.bash_android
sourceIfReadPermission ~/.bash_secure
sourceIfReadPermission ~/.bash_extra # Hook for any further change
