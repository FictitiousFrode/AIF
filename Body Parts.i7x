Version 3 of Body Parts by Fictitious Frode begins here.
"Body parts are presented that can be added to any or all persons in a story for greater detail, and sets up a framework for how these might be covered."

[This part is inspired by example 242 of the Inform manual, but modifed and expanded greatly.
Body parts are presented that can be added to any or all persons in a story for greater detail, and sets up a framework for how these might be covered.]

Book 1 - Coverables

[A coverables is something that can be covered, and forms the basis for both body parts (and in later expansions, clothing).]

A coverable is a kind of thing.

Part 1.1 - Relations and Definitions

[The framework relies on Informs relations to keep track of what covers where. This is defined here, along with some other helpful definitions.]

[Overlaying defines which garments cover which other garments and body parts.]
Overlaying relates various coverables to various coverables with fast route-finding.
The verb to overlie means the overlaying relation.

[Underlaying defines which parts are actually covered, and is used by dressing and undressing to keep track of what parts is actually over which other parts, and should not be manually updated.]
Underlaying relates various coverables to various coverables with fast route-finding.
The verb to underlie means the underlaying relation.
The verb to be under implies the underlaying relation.

[The version of covering from the example is a recursive use of the overlaying: if A covers B and B cover C, then A also cover C implicitly.
This gives us a small bug; Consider the case where A covers B and C; D covers A but does not cover B?
Therefore, we instead insist that every piece explicitly states which other parts it cover.
We leave the old code in for modification if wanted.]
[Covering relates a coverable (called A) to a coverable (called B) when the number of steps via the overlaying relation from A to B is greater than 0.
The verb to cover means the covering relation.]
The verb to cover means the overlaying relation.

[Incompatible defines garments that can not be worn at the same time. This relation is symmetric.
(This could also be done by defining that A covers B and B covers A.)]
Incompatible relates various coverables to each other.
The verb to be incompatible with means the incompatible relation.

[Visible defines which parts can be seen.]
Definition: a coverable is visible if it is not under something opaque.

[Accessible defines which parts can be taken off.]
Definition: a coverable is accessible if it is not under something.

Book  2 - Decency

[Decency is a measure of how a character is dressed, derived from how body parts are covered.]
A decency is a kind of value.
The decencies are indecent, immodest, casual, formal and undefined.
A coverable has a decency. The decency of a coverable is usually casual.
A person has a decency. The decency of a person is usually undefined.

[This updates the decency for a person, based on which body parts and other coverable clothing is visible.]
To update decency for (P - a person):
	Let items be the list of coverables worn by P;
	Add the list of body parts that is part of P to items;
	Repeat with I running through items:
		If I is visible and the decency of I is less than the decency of P, now the decency of P is the decency of I;

[Update decency whenever someone changes clothing]
Carry out an actor taking off a coverable:
	Update decency for actor;
Carry out an actor wearing a coverable:
	Update decency for actor;

[Clothing that is defined as worn, is never actually put on, so the relations have not been updated.
This updates those relations, and updates decency if needed.]
When play begins:
	Repeat with P running through the list of persons:
		Repeat with G running through the list of coverables worn by P:
			Repeat with W running through coverables worn by P:
				If G overlies W, now W underlies the G;
			Repeat with B running through the list of body parts enclosed by P:
				If G overlies B, now B underlies the G;
		If the decency of P is undefined, update decency for P;

Book 3 - Body Parts

A body part is a kind of coverable.
A body part can be lickable. A body part is usually not lickable. [Defines which parts can be licked and bitten.]
A body part can be rubbable. A body part is usually not rubbable. [Defines which parts can be rubbed and pinched.]

A sexual ability is a kind of value.
The sexual abilities are penetrating, orificial and non-sexual.
A thing has a sexual ability. The sexual ability of a thing is usually non-sexual.

Does the player mean examining a body part that is part of the player: It is unlikely.

Part 3.1 - Specific Body Parts

[Define body parts that are ready to use. These must explicitly be made part of any (or every) person that needs them.]
A pair of feet is a kind of body part.
The plural of feet is pairs of feet. They are plural-named.
The description of a pair of feet is usually "A pair of normal feet."
A pair of feet is usually immodest.

A pair of legs is a kind of body part.
The plural of some legs is pairs of legs. They are plural-named.
The description of a pair of legs is usually "Long and shapely legs."

A pair of thighs is a kind of body part.
The plural of some thighs is pairs of thighs. They are plural-named.
A pair of thighs is usually immodest.
The description of a pair of thighs is usually "Formfull and voluptoous."

A tummy is a kind of body part.
The description of a tummy is usually "It's a soft, normal, tummy."
A pair of thighs is usually immodest.
Understand "stomach" as tummy.

A pair of armpits is a kind of body part.
The plural of some armpits is pairs of armpits. They are plural-named.
A pair of armpits is usually immodest.
The description of armpits is usually "Hopefully, they are clean."

A chest is a kind of body part.
A chest is usually immodest.
A chest is usually rubbable.
A chest is usually lickable.
The description of a chest is usually "It looks firm and muscular."

A pair of breasts is a kind of body part.
The plural of breasts is pairs of breasts. They are plural-named.
A pair of breasts is usually indecent.
A pair of breasts is usually lickable.
A pair of breasts is usually rubbable.
The sexual ability of a pair of breasts is usually orificial.
The description of a pair of breasts is usually "A pair of plump breasts."
Understand "tit/tits/breast/breasts/boob/boobs/tittie/titties/juggs" as a pair of breasts.

A pair of arms is a kind of body part.
The plural of some arms is pairs of arms. They are plural-named.
The description of a pair of arms is usually "It's a pair of normal arms."

A pair of hands is a kind of body part.
The plural of some hands is pairs of hands. They are plural-named.
The description of a pair of hands is usually "A normal pair of hands, with five fingers on each."

A head is a kind of body part.
The description of a head is usually "It's a pretty normal head, as far as a human goes. Mouth, nose, two eyes, two ears and hair on the top."

A mouth is a kind of body part.
The description of a mouth is usually "It's the organ used for talking and eating, amongst other things."
Understand "lips" as mouth.
A mouth is usually lickable.

A pair of eyes is a kind of body part.
The plural of some eyes is pairs of eyes. They are plural-named.
The description of a pair of eyes is usually "It's a pair of deep blue eyes."

Some hair is a kind of body part.
The description of some hair is usually "It's a tangle of brown hair."

An ass is a kind of body part.
The plural of ass is asses. They are plural-named.
An ass is usually indecent.
An ass is usually rubbable.
The sexual ability of an ass is usually orificial.
The description of an ass is usually "A pair of firm buttcheeks."
Understand "ass / asshole / anus / rear / backside / butt / bottom / rump / rear end" as ass.

A penis is a kind of body part.
A penis is usually penetrating.
A penis is usually indecent.
A penis is usually lickable.
A penis is usually rubbable.
The description of a penis is usually "Thick and hard."
Understand "cock/dick/wang/dong/wiener/willy/schlong/boner/pecker" as penis.

A vagina is a kind of body part.
A vagina is usually indecent.
The sexual ability of a vagina is usually orificial.
A vagina is usually lickable.
A vagina is usually rubbable.
The description of a vagina is usually "Warm and wet, like hot apple pie."
Understand "pussy/cunt/slit/crotch/snatch/clitoris/clit/twat" as vagina.

Book 4 - Actions

Part 4.1 - Being Silly

[Stop the player from doing silly stuff with body parts.]
Taking a body part is being silly. 
Dropping a body part is being silly. 
Removing a body part from someone is being silly. 
Giving a body part to someone is being silly. 
Taking off a body part is being silly. 
Throwing a body part at something is being silly. 
Pushing a body part is being silly. 
Turning a body part is being silly. 
Putting a body part on something is being silly. 
Consulting a body part about something is being silly. 
Waking a body part is being silly. 

Instead of being silly, say "Don't be silly!"
Instead of asking someone to try being silly, say "Don't be silly!"

Part 4.2 - Stripping

[The fundamentals of stripping is defined here, so that it other framework components can extend it, and not conflict with each other by trying to redefine the action.]

[Stripping is the action of removing all clothes.]
Stripping is an action applying to nothing.
Understand "strip", "undress", "disrobe" as stripping.

[Report so the player knows the command worked.]
Report an actor stripping (this is the default stripping report rule):
	If the actor is not wearing any coverables, say "[If the player is the actor][We][else][Actor][end if] [are] [now] nude." (A);
	Else say "[If the player is the actor][We][else][Actor][end if] [are] still wearing [list of coverables worn by player]." (B);

Body Parts ends here.

---- DOCUMENTATION ----

This extension makes available two new kinds; coverable and body part. Coverable is not intended for direct use, but as a common ancestor for anything that can be covered by clothing. Body part is a descendant provided here, and provides the mean to give more detail and flexibility to characters in a story. Note, this extension is best used together with either Garments or Outfits.

Chapter: Using this Extension

None of the body parts provided by this extensions is automatically put in use; the author must decide which ones are to be used, and apply them to the characters they are needed for. Every person that has body parts attached to them should also have a description for those parts. See Example A for how to add body parts.

Note; Inform can behave slightly odd regarding the naming (and creation) of body parts which are part of the character, this is described in chapter 4.15 of Writing with Inform. If the player is declared after the creation of the body part, then the body part will be named after what the character was named. Also, any gender-specific creations might not occur if the gender of the player was undetermined at that point. Likewise, changing the identity of the player during play might give interesting results.

In short, declare the player (with gender) before invoking body part creation.

Section: Decency

Decency is a measure of how much "skin" a person is showing off, and is automatically calculated whenever a person takes off or puts on a piece of clothing (that follows the framework standards). This part of the framework does not do any checking for decency, but leaves that in the hand of the story author. This can be used to stop the player moving around like this:

*:
	Instead of going somewhere while indecent, say "You can't go anywhere looking like that!"

The framework defines five levels of decency, of which four are in use. In ascending order, they are indecent, immodest, casual, formal and undefined. Undefined is a special case; it is the default decency for a person and any person with undefined as decency will have their decency calculated at start-up. This means that story authors can skip this calculation by manually defining (hopefully the correct) decency of a person in order to save time at start-up.

The default decency for body parts (and other coverables) is casual. This means, nothing will ever be formal by accident.

Section: List of Body Parts

The following body parts are available:
	A pair of feet (immodest)
	A pair of legs
	A pair of thighs (immodest)
	A tummy / stomach (immodest)
	A pair of armpits (immodest)
	A chest (male torso) (immodest) - Lickable, Rubbable
	A pair of breasts (female torso) (indecent) - Lickable, Rubbable
	A pair of arms
	A pair of hands
	A head
	A mouth - Lickable
	A pair of eyes
	Some hair
	An ass (indecent) - Rubbable
	A penis (indecent) - Lickable, Rubbable
	A vagina (indecent) - Lickable, Rubbable

Section: Visibility

The framework does not concern itself with blocking vision of covered body parts, as most body parts are obviously present even when covered by clothing. Instead, the author should take into account visibility when describing the body parts. Visible means any piece that is worn outmost, or is covered by a transparent piece. (Transparencey only goes one layer deep), while accessible means that the piece is worn outmost.
Example B shows how to make variable descriptions based on what is visible, and Example C shows how to block vision of covered body parts.

Note: The frameworks for outfits will do a lot of this.

Section: Stripping

This extensions defines the bare bones of the stripping function, leaving it up to extensions that expand it with clothing to implement the necessary check and carry out functions that are necessary for those to work.
This part is extended by the frameworks for clothing (garments and outfits), but in order to have them not conflict with each other the core implementation is defined here.

Chapter: Technical Notes

This framework is based on the relationship model built into Inform 7. Here's the meaning of the relations used:

	Overlaying relation (Cover): Defines which parts should go on top of other parts when worn. The covering relation is only safe to assume actually covers something if it's also made sure that the item is worn.
	Underlaying relation: Defines which parts are actually covered, and what part does the covering.
	Incompatible relation: Symmetric relationship between two kinds that can never be worn together.


Body parts also get some attributes that are intended for use with later extensions. The most important is the "sexual ability" attribute, which is one of orificial, penetrating and non-sexual. By default, everything is non-sexual. In short; orificial things can be fucked, while penetrating things can be used to fuck.

Section: Creating New Body Parts

Adding a new kind of body part is very easy; Example D shows how feet are defined in the framework. The main work in adding new body parts is defining which parts of clothing fit over them; this is covered in the extensions for clothing / garments.

Section: Version History

Release 2 (v0.6): 

	No code changes, but documentation improved.

Release 3 (v1.0): 

	Added eyes, hair and mouth as body parts.
	Added rubbable as a property.
	Improved understanding of what the player means.

Section: Contact Info

The author of the framework can be reached in the following ways:

	* Mail: fictitious.frode@gmail.com
	* Blog: https://informedaif.wordpress.com/ is a blog dedicated to writing AIF with Inform 7, and is the official host of the framework. It contains both dicussions around AIF and tutorials on both Inform in general and this framework in particular.
	* Reddit: https://www.reddit.com/r/AIFCentral/ is the subreddit for the AIF community, and the author checks this regularly.

Feedback of all varieties is welcome, but constructive criticism and discussion is the most appreciated, along with reports of bugs and other issues. For support I would appreciate using public communication, so that other may learn from the request as well.

Example: * Body Parts - Enabling body parts

*:
	The Library is a room,
	Anna is a woman in the Library.
	A head is part of every person.
	A pair of feet is a part of every woman.

	The description of Anna's head is "A pretty plain head."
	
	Test me with "x Anna's head / x feet / x your head."

Example: * Visibility 1 - Description of a body part, taking into account if it is covered:

	The Library is a room,
	Anna is a woman in the Library.
	A pair of feet is a part of every person.

	The description of Anna's feet is "[if Anna's feet are visible]A pair of hairy feet.[else]The feet are covered by [list of visible coverables covering Anna's feet]."

Example: ** Visibility 2 - Stopping the player from examining a covered body part:

*:
	Check examining a body part that is not visible (this is the block covered body parts rule):
		Say "[We] [cannot] [see] that."(A) instead;

Example: *** Custom Body Parts - The definition of "feet" from the framework

	A pair of feet is a kind of body part.
	The plural of feet is pairs of feet. They are plural-named.
	The description of a pair of feet is usually "A pair of normal feet."
	A pair of feet is usually immodest.