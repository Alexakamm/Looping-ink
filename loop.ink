VAR metaLoopCount = 0
VAR readLetter = false 
VAR truthVisits = 0
VAR escapedKeys = false
VAR patient = false
-> Start
== Start == 
//reset variables when take larger loop
~metaLoopCount = 0
~readLetter = false 
~truthVisits = 0
~escapedKeys = false
~patient = false
The ills of conventional living have been weighing on you more than usual. For as long as you can remember, your escape for this common ailment, has been nature. To distance yourself from modern society, you decide to take your frequented trail in the forest just behind your house. Normally, you stay within view of your home, for fear of discovering what lurks just beyond everything you know, but something feels different today...

+ You decide to [leave the view of your house] venture into the unexplored wilderness
-> Exploration
* Stay in the comfortable parts
-> Comfort

== Comfort == 
Oh, what could have been... Maybe you'll feel courageous enough to journey one day!
+ Exit
Nice try! That day is today, get back out there kid. 
-> Start

== Exploration == 
Venturing further into the woods, you admire the eerie quality of these unseen parts.  You find a key, but no lock is in sight.
+ Pocket it — it would make for a cool pendant!
-> metaLoop
+ Embark on a journey to find its lock
-> boulder

== boulder == 
{escapedKeys: Welcome back from your journey finding strange keys on the forest floor. You are, once again, walking through the woods, with no keys in sight (thankfully)} 
~escapedKeys = false //reset
In your exploration, you come across a boulder. At its base sits a letter glimmering with a purple sheen. 
+ [Read the letter] The Letter:
-> letter
+ {!readLetter} [This is all getting too weird, turn back] You have ignored the letter, choosing comfort over adventure :( 
-> Comfort 

== letter == 
{readLetter: You have already read the letter! The wisdom is within you. -> Exploration}

~readLetter = true
To my dearest Player,

The key to my heart is unconventional. I remember the day you unlocked it and how it felt as if rules had been broken, some process misunderstood. But this unexpected opening of my heart has taught me more than you can imagine. You and I, we have played the ultimate game and won. I watch from afar, as so many people mindlessly go through the procedures of daily life, completing the tasks imposed on them without questioning why they are doing so. I have observed their passive anticipation for some fulfillment that will never come. And the truth is, it never will come. I think that is how we are different from these masses of unhappy wanderers — we live everyday like we are playing a game. Rather than letting the world determine us, we determine it and inject it with our own meaning. I am not sure if there is some higher order that designed the world for us, but the one thing I can be sure of is that the world would be nothing without you and I.

Love, 
Sicart

+ [I actually read the whole thing] After reading the letter,

- Your heart is made full by a love that doesn't seem belong to you, but feels universal all the same. The words permeate your soul inexplicably, as if you knew the lovers Sicart and Player, though of course you don't know anyone with such peculiar names. 

This is just what you had been in search of when you left the house today. Suddenly, the world does not seem so dismal a place. Equipped with this newfound knowledge, you put the letter in your pocket, not yet ready to part with it, but also not quite sure what it means. 

+ You [take this new knowledge with you] continue your exploration
-> Exploration

//Alter the loop each iteration -- Conditional dialogue and Conditional (sticky) choices
== metaLoop ==
~metaLoopCount +=1
{ not patient: Pocketing key {metaLoopCount}, you look down and as if by magic, an almost identical key to the one you just put in your pocket is at your feet.}
{metaLoopCount == 1: Almost not believing your eyes and feeling you are admidst a strange invisible power, you check to make sure that the original key is still in your pocket. It is!}
+ {!patient} Pick up this key
-> metaLoop
+ {metaLoopCount > 3 && !patient} Escape
~escapedKeys = true
-> boulder
+ {metaLoopCount > 4 && !patient} Patience is a virtue[, go through the motions once more if you dare]
~patient = true
-> metaLoop
+ {metaLoopCount > 5 && patient} [Enter special universe] Because you were patient:
~patient = false
-> special


== special == 
 You have entered this special universe as you have a unique inclination for truth. But truth is something we must toil for. We now present you with the ultimate lock. Your task is to unlock it. Do you accept the challenge? 
+ Yes 
-> problemOfIdenticals
* Back to safety 
-> Comfort

== problemOfIdenticals == 
With {metaLoopCount -1} keys in your pocket, and the ultimate lock in front of you. You can try your hand at the ones in your pocket. However, you can only try one of the keys in your pocket and must pick at random. 
+ Try Key {RANDOM(1, metaLoopCount -1)} // random number, inclusive bounds 
Not Right! You must repeat the cycle!
~patient = false
-> metaLoop

+ {readLetter} Pulling the letter out of your pocket, you remember Sicart told Player that the key is unconventional
++ Eh, it probably didn't mean anything
-> aLesson

++ Press letter to the surface of the ultimate lock
In a magical display, the floating lock in this special universe fizzles into nothingness. 
"Looks like Sicart was right, breaking the rules can be a great lesson," you laugh to yourself. 
Suddenly, glowing, white letters arrange themselves in the sky, forming the words:
-> Truth

== Truth ==
Can you handle the truth?
+ [Are you kidding, I already endured Sicart's love letter.] Bring on the truth.
~truthVisits +=1 
-> Truth
+ {truthVisits == 1} Why'd you ask me again?
You said it yourself, you already read Sicart's letter. Go out into the world, beyond these woods and this game, break from procedurality, and play the game of life. 
-> DONE
+ No I think that might break me
-> aLesson


== aLesson == 
Despite being so close to Truth, you clearly have a lot to learn before you can unlock the key to escaping the cycle. Do not forget why you embarked on this journey in the first place. In the hope that you will learn from your mistakes, I sentence you to return to the cycle. I urge you to use this as a second chance to make the right decisions.
-> Start


