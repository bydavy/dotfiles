# My dot-files

This is a collection of my public dot-files for MacOs and Linux.
It includes:

- bash aliases, functions and whatnot
- git configuration
- vim configuration
- gdb configuration
- etc

## Installation

> ./setup.sh

## Make it your own

Once installed, you simply have to make it your own by editing files and open a new bash session for changes to be applied.

### Directory structure

Two directory are used to copies dot-files from:

- `public`: This directory is versioned and you should not check-in ssh key, work related credentials or secure tokens.
Anything that is sensitive should go into the `secure` directory.
- `secure`: This directory is excluded from the repository. Put your more secure things here.

### Customize .bashrc/.bash_profile

Two files can be created and used as hooks to tweak by setting or unsetting what you want:

- `.bash_init_extra`: one of the first script executed on new bash session
- `.bash_extra`: one of the last script executed on new bash sessions
