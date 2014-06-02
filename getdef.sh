#!/bin/bash
# define - command line dictionary

#From http://linuxtidbits.wordpress.com/2008/01/30/command-line-dictionary/

# Program name from it's filename
prog=${0##*/}

# Text color variables
txtbld=$(tput bold)             # Bold
bldred=${txtbld}$(tput setaf 1) #     red
bldwht=${txtbld}$(tput setaf 7) #     white
txtrst=$(tput sgr0)             # Reset
warn=${bldred}!${txtrst}

sedbldwht='\c[[1;37m'           # Sed white  - bold
sedtxtrst='\c[[0m'              #     text reset


# Suggest possible words if not in dictionary, otherwise define
wordchecknum=$(echo "$1" | aspell -a | sed '1d' | wc -m)
wordcheckprnt=$(echo "$1" | aspell -a | sed '1d' | sed 's/^.*: //')


# Lookup word and reformat/highlight
sdcv -u "WordNet"  "$1" | \
# lookup, delete extrenous first lines, delete last empty line
sed '1,3d' | sed '/^*$/d' | \
# print more obvious word type
sed "h; :b; \$b ; N; /^${1}\n     n/ {h;x;s// ${sedbldwht}Noun${sedtxtrst}\n/; bb}; \$b ; P; D" | \
sed "h; :b; \$b ; N; /^     v/ {h;x;s// ${sedbldwht}Verb${sedtxtrst}\n/; bb}; \$b ; P; D" | \
sed "h; :b; \$b ; N; /^     adv/ {h;x;s// ${sedbldwht}Adverb${sedtxtrst}\n/; bb}; \$b ; P; D" | \
sed "h; :b; \$b ; N; /^     adj/ {h;x;s// ${sedbldwht}Adjective${sedtxtrst}\n/; bb}; \$b ; P; D" | \
# reformat to left (ok, there's gotta be a better way to do this)
sed 's/^     / /g' | \
sed 's/^      /    /g' | \
sed 's/^      /    /g' | \
sed 's/^     /    /g' | \
# rename single entry for conformity
sed 's/^ : / 1: /g' | sed "/^${1}.*/d" | sed "s/^ \[/    \[/g" | \

#Non-linux text editors don't recognize the coloring
#and display a garbled string next to the word being colored.
#You can easily use the "Replace" feature of your text editor to remove those strings.

#BUG FIXED!! see commit "Added code to remove coloring."

# and coloring
sed "s/${1}/${sedbldwht}${1}${sedtxtrst}/g"

