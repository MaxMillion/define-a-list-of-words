#Define a list of words v1.0 by ctrezevant
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
echo ' ' >>defsout.txt
echo ' ' >>defsout.txt
#Print the word being defined to the file.
echo $word >>defsout.txt
#Print the definition of that word to the file.
sh getdef.sh $word >>defsout.txt

done

#Print a bunch of messages to stdout.
echo 'All done!'
echo 'Definitions saved to defsout.txt'
echo 'Have a great day!'
