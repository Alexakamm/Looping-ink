VAR metaLoopCount = 0
VAR readLetter = false 
VAR truthVisits = 0
-> Start
== Start == 
//reset variables when take larger loop
~metaLoopCount = 0
~readLetter = false 
~truthVisits = 0
The ills of conventional living have begun to infect your soul, more so than usual. For as long as you can remember, your escape for this common ailment of yours, has been nature. To distance yourself from modern society, you decide to take your frequented trail in the forest just behind your house. Normally, you stay within view of your home's roof, for fear of truths lurking just beyond, but something feels different today...

+ You decide to [leave the view of your house] venture into the unexplored wilderness
-> Exploration
* Stay in the comfortable parts
-> Comfort

== Comfort == 
Oh, what could have been...Maybe you'll feel courageous enough to journey one day!
+ Exit
Nice try! That day is today, get back out there kid. 
-> Start

== Exploration == 
Quick! You find a key and you don't know where its lock is 
+ Pocket it — it would make for a cool pendant!
-> metaLoop
+ Embark on a journey to find its lock
-> boulder

== boulder == 
You come across a boulder. At its base sits a letter glimmering with a purple sheen. 
+ [Read the letter] The Letter:
-> letter
+ [This is all getting too weird, turn back] You have ignored the letter, choosing comfort over adventure :( 
-> Comfort 

== letter == 
~readLetter = true
To my dearest Player,

The key to my heart is unconventional. I remember the day you unlocked it, I felt as if rules had been broken, some process had been misunderstood. But this unexpected opening of my heart has taught me so much. You and I, we have played the ultimate game and won. I often wonder how we differ from the many people mindlessly going through the procedures of daily life, completing the tasks imposed on them without questioning why they are doing so. I have observed their passive anticipation for some fulfillment that will never come. And the truth is, it never will come. That is why we must live everyday like we are playing a game; rather than letting the world determine us, we must determine it and inject it with our own meaning. I am not sure if there is some higher order that designed the world for us, but the one thing I can be sure of is that the world would be nothing without you and I.

Love, 
Sicart

Your heart is made full by a love that doesn't seem belong to you, but feels universal all the same. The words permeate your soul inexplicably, as if you knew the lovers Sicart and Player, though of course you don't know anyone with such peculiar names. 

This is just what you had been in search of when you left the house today. Suddenly, the world does not seem so dismal a place. Equipped with this newfound knowledge, you put the letter in your pocket, not yet ready to part with it, but also not quite sure what it means. 

+ You [take this new knowledge with you] continue your exploration
-> Exploration

//Alter the loop each iteration -- Conditional dialogue and Conditional (sticky) choices
== metaLoop ==
~metaLoopCount +=1
Pocketing key {metaLoopCount}, you look down and as if by magic, an almost identical key to the one you just put in your pocket is at your feet.
{metaLoopCount == 1: Almost not believing your eyes and feeling you are admidst a strange invisible power, you check to make sure that the original key is still in your pocket. It is!}
+ Pick up this key
-> metaLoop
+ {metaLoopCount > 3} Escape 
-> Exploration
* {metaLoopCount > 4} Patience is a virtue, go through the motions once more if you dare
-> metaLoop
+ {metaLoopCount > 5} [Enter special universe] Because you were patient:
-> special


== special == 
 You have entered this special universe as you have a unique inclination for truth. But truth is something we must toil for. We now present you with the ultimate lock. Your task is to unlock it. Do you accept the challenge? 
+ Yes 
-> problemOfIdenticals
* Back to safety 
-> Comfort

== problemOfIdenticals == 
With {metaLoopCount} keys in your pocket, and the ultimate lock in front of you. You can try your hand at the ones in your pocket. However, you can only try one of the keys in your pocket and must pick at random. 
+ Try Key {RANDOM(1, metaLoopCount)} // random number, inclusive bounds 
Not Right! Redirecting back to key loop
-> metaLoop

* {readLetter} Pulling the letter out of your pocket, you remember Sicart told Player that the key is unconventional
** Eh, it probably didn't mean anything
-> aLesson

** Press letter to the surface of the ultimate lock
In a magical display, the floating lock in this special universe fizzles into nothingness. 
"Looks like Sicart was right, breaking the rules can be a great lesson," you laugh to yourself. 
Suddenly, glowing, white letters arrange themselves in the sky, forming the words:
-> Truth

== Truth ==
Can you handle the truth?
* [Are you kidding, I already endured Sicart's love letter.] Bring on the truth.
~truthVisits +=1 
-> Truth
* {truthVisits == 1} Why'd you ask me again?
You said it yourself, you already read Sicart's letter. Go out into the world, beyond these woods and this game, break from procedurality, and play the game of life. 
-> DONE
* No I think that might break me
-> aLesson


== aLesson == 
Despite being so close to Truth, you clearly have a lot of learning to do before you can unlock the truth to escaping the cycle. Do not forget why you embarked on this journey in the first place. In the hope that you will learn from your mistakes, I sentence you to return to the cycle. I urge you to use this as a second chance to make the right decisions.
-> Start


