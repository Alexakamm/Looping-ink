

VAR metaLoopCount = 0
VAR readLetter = false 
VAR truthVisits = 0
-> Start
== Start == 
The ills of conventional living have begun to infect your soul, more so than usual. For as long as you can remember, your escape for this common ailment of yours, has been nature. To distance yourself from modern society, you decide to take your frequented trail in the forest just behind your house. Normally, you stay within view of your home's roof, for fear of truths lurking just beyond, but something feels different today...

* Venture[: leave the view of your house] to the unexplored wilderness
-> Exploration
* Stay in the comfortable parts
-> Comfort

== Comfort == 
Oh, what could have been... Maybe you'll feel courageous enough to journey one day!
-> DONE

== Exploration == 
Quick! You found a key and you don't know where its lock is 
+ Pocket it — it would make for a cool pendant!
-> metaLoop
* Embark on a journey to find its lock
-> boulder

== boulder == 
You come across a boulder. At its base is a letter that glimmers with a purple sheen. 
* [Read the letter] The Letter:
-> letter
+ [This is all getting too weird, turn back] You have ignored the letter, choosing comfort over adventure :( 
-> Comfort 

== letter == 
~readLetter = true
To my dearest Player,

The key to my heart is not material. You and I, we have played the ultimate game and won. I often wonder how we differ from the many people systematically going through the procedures of daily life, completing the tasks imposed on them without questioning why and passively waiting for some fulfillment that will never come. The truth is, it never will come. That is why we must live everyday like we are playing a game; rather than letting the world determine us, we must inject it with our own meaning. We must determine it. I am not sure if there is some higher being that designed the world for us, but one thing I can be sure of: the world would be nothing without you and I.

Love, 
Sicart

Your heart is swollen and made full by a love that doesn't seem belong to you, but feels universal all the same. The words permeate your soul inexplicably, as if you knew the lovers Player and Sicart. This is just what you had been in search of when you left the house today. Suddenly, the world does not seem so dismal a place. Equipped with a new knowledge, you put the letter in your pocket, not yet ready to part with it. 

* [Take this new knowledge with you to explore] Exploration
-> Exploration

//Alter the loop each iteration -- Conditional dialogue and Conditional (sticky) choices
== metaLoop ==
~metaLoopCount +=1
Pocketing key {metaLoopCount}, you look down and as if by magic, an almost identical key to the one you just put in your pocket is at your feet.
{metaLoopCount == 1: Almost not believing your eyes and worrisome of invisible powers you may be amidst, you check to make sure that the original key is still in your pocket. It is!}
+ Pick up this key
-> metaLoop
+ {metaLoopCount > 3} Escape 
-> Exploration
* {metaLoopCount > 4} Patience is a virtue, go through the motions once more if you dare
-> metaLoop
+ {metaLoopCount > 5} [Enter special universe] Because you were patient:
-> special


== special == 
 You have entered this special universe as you understand the true meaning of a key. We now present you with the ultimate lock. Your task is to unlock it. Do you accept the challenge? 
+ Yes 
-> problemOfIdenticals
* Back to safety 
-> Comfort

== problemOfIdenticals == 
With {metaLoopCount} keys in your pocket, and the ultimate lock in front of you. You can try your hand at the ones in your pocket. However, you can only try one of the keys in your pocket and must pick at random. 
+ Try Key {RANDOM(1, metaLoopCount)} // random number, inclusive bounds 
Not Right! Redirecting back to key loop
-> metaLoop

* {readLetter} Pulling the letter out of your pocket, you remember Sicart told Player that the key is immaterial
** Eh, it probably didn't mean anything
-> aLesson

** Press letter to the surface of the ultimate lock
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
Despite being so close to Truth, you clearly have a lot of learning to do before you can learn to escape the cycle. Do not forget why you embarked on this journey in the first place. In hopes that you will learn from your mistakes, I sentence you to return to the cycle. Use this as a second chance to make the right decisions.
-> Start

-> DONE


