##Regular expressions
##Regular expressions can be thought of as a combination of literals and metacharacters
##To draw an analogy with natural language, think of literal text forming the words of this language, and the metacharacters defining its grammar
##Regular expressions have a rich set of metacharacters

## Literals
##Simplest pattern consists only of literals.
## Simplest pattern consists only of literals; a match occurs if the sequence of literals occurs anywhere in the text being tested

## Metacharacters
## ^i represents the start of the line
## $ represents the end of the line

## Character Classes
## We can list a set of characters we will 
## accept at a given point in the match

## [Bb][Uu][Ss][Hh]
#will match the lines

## The democrats are playing, "Name the worst thing about Bush!"
## I smelled the desert creosote bush, brownies, BBQ chicken
## BBQ and bushwalking at Molonglo Gorge
## Bush TOLD you that North Korea is part of the Axis of Evil
## I’m listening to Bush - Hurricane (Album Version)

## Character Classes with []
#Similarly, you can specify a range of letters [a-z] or [a-zA-Z]; notice that the order doesn’t matter

##^[0-9][a-zA-Z]
##will match the lines

# 7th inning stretch
# 2nd half soon to begin. OSU did just win something
# 3am - cant sleep - too hot still.. :(
#  5ft 7 sent from heaven
#  1st sign of starvagtion

## Character Classes with []
# When used at the beginning of a character class, the “^” is also a metacharacter and indicates matching characters NOT in the indicated class

#[^?.]$
#  will match the lines

#i like basketballs
#6 and 9
#dont worry... we all die anyway!
#  Not in Baghdad
# helicopter under water? hmmm
