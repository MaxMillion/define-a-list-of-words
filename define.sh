#!/bin/bash

#Define a list of words v1.1 by ctrezevant
#For those times where you're looking for an easy bash mass-definer but just can't find one on the net.
#Distribute/use this freely as long as you give me (charlton trezevant) and linuxtidbits.wordpress.com credit.
#GitHub page: https://github.com/ctrezevant/define-a-list-of-words

#takes a list of words in words.txt and outputs them, along with their definitions, to defsout.txt

#Make sure you install sdcv and get the StarDict dictionary loaded before running this:
#Tutorial for loading StarDict:
#http://linuxtidbits.wordpress.com/2008/01/30/command-line-dictionary/
#Link to download StarDict:
#http://abloz.com/huzheng/stardict-dic/dict.org/

#I hope this tool is useful to you!

#Start the main loop.
for word in `cat words.txt`; do

#Formatting for messages sent to stdout.
echo ' '
echo "the next word to define is $word"
#Formatting for definitions.
echo ' ' >>defsout.colored
echo ' ' >>defsout.colored
#Print the word being defined to the file.
echo $word >>defsout.colored
#Print the definition of that word to the file.
sh getdef.sh $word >>defsout.colored

done

#Get rid of the text coloring.
#sed statement from http://www.commandlinefu.com/commands/view/3584/remove-color-codes-special-characters-with-sed
cat defsout.colored | sed -r "s/\x1B\[([0-9]{1,2}(;[0-9]{1,2})?)?[m|K]//g" >>defsout.txt && rm defsout.colored

#Print a bunch of messages to stdout.
echo ' '
echo 'All done!'
echo 'Definitions saved to defsout.txt'
echo 'Have a great day!'

exit
