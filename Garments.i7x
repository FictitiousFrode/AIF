Version 3 of Garments by Fictitious Frode begins here.

"Garments represents clothing. Transparent garments gives full vision (through the visible definition) to anything underneath."
Include Version 3 of Body Parts by Fictitious Frode.

[This part is inspired by example 242 of the Inform manual, but modifed and expanded greatly.
Garments represents clothing. Transparent garments gives full vision (through the visible definition, earlier) to anything underneath.
A garment that is allow touching will not block rubbing.
All garments must define when play begins that they cover given garments or body parts.]

A garment is a kind of coverable.
A garment is always wearable.
A garment can be transparent or opaque. A garment is usually opaque.
A garment can be allow touching. A garment usually is not allow touching.

[Layering depth defines how many other garments are on top. Used to determine the order that clothing needs to be removed.]
To decide what number is the layering depth of (chosen garment - a thing):
	Let N be 0;
	If the chosen garment overlies a body part (called base):
		Let N be the number of steps via the overlaying relation from the chosen garment to the base;
	Decide on N.

Book 1 - Specific Garments

[Panties (for both sexes, despite the name) cover the crotch, and does not fit over anything.]
A pair of panties is a kind of garment.
A pair of panties is usually indecent.
They are plural-named. The plural of panties is pairs of panties.
The description of a pair of panties is usually "A pair of panties."
When play begins:
	Now every pair of panties is incompatible with every pair of panties;
	Now every pair of panties overlies every ass;
	Now every pair of panties overlies every vagina;
	Now every pair of panties overlies every penis;

[Bras covers breasts, and does not fit over anything.]
A bra is a kind of garment.
A bra is usually indecent.
The description of bra is usually "A bra."
When play begins:
	Now every bra is incompatible with every bra;
	Now every bra overlies every pair of breasts;
	Now every bra overlies every chest;

[Stockings covers feet, legs and thighs, and does not fit over anything.]
A pair of stockings is a kind of garment.
A pair of stockings is usually formal.
The plural of stockings is pairs of stockings. They are plural-named.
The description of a pair of stockings is usually "A pair of sheer stockings, ending midway up the thighs."
A pair of stockings is allow touching.
When play begins:
	Now every pair of stockings is incompatible with every pair of stockings;
	Now every pair of stockings overlies every pair of feet;
	Now every pair of stockings overlies every pair of legs;
	Now every pair of stockings overlies every pair of thighs;

[Pantyhose is like stockings, but also covers the crotch, and this fits over panties. Not compatible with pantyhose.]
A pair of pantyhose is a kind of garment.
A pair of pantyhose is usually formal.
The plural of pantyhose is pairs of pantyhose. They are plural-named.
The description of a pair of pantyhose is usually "A pair of sheer pantyhose."
A pair of pantyhose is allow touching.
When play begins:
	Now every pair of pantyhose is incompatible with every pair of pantyhose;
	Now every pair of pantyhose overlies every pair of feet;
	Now every pair of pantyhose overlies every pair of legs;
	Now every pair of pantyhose overlies every pair of thighs;
	Now every pair of pantyhose overlies every ass;
	Now every pair of pantyhose overlies every vagina;
	Now every pair of pantyhose overlies every penis;
	Now every pair of pantyhose overlies every pair of panties;
	Now every pair of pantyhose is incompatible with every pair of stockings;

[Socks cover the feet, and fits over stockings and pantyhose.]
A pair of socks is a kind of garment.
A pair of socks is usually formal.
The plural of socks is pairs of socks. They are plural-named.
The description of a pair of socks is usually "A pair of socks."
When play begins:
	Now every pair of socks is incompatible with every pair of socks;
	Now every pair of socks overlies every pair of feet;
	Now every pair of socks overlies every pair of stockings;
	Now every pair of socks overlies every pair of pantyhose;

[Shoes cover the feet, and fits over socks, stockings and pantyhose.]
A pair of shoes is a kind of garment.
A pair of shoes is usually formal.
The plural of shoes is pairs of shoes. They are plural-named.
Understand "shoe/boots/footwear" as a pair of shoes.
The description of a pair of shoes is usually "A pair of shoes."
When play begins:
	Now every pair of shoes is incompatible with every pair of shoes;
	Now every pair of shoes overlies every pair of feet;
	Now every pair of shoes overlies every pair of socks;
	Now every pair of shoes overlies every pair of stockings;
	Now every pair of shoes overlies every pair of pantyhose;

[Trousers (or pants) cover legs, thighs and crotch, and fits over stockings and pantyhose.]
[TODO: Openable to give limited access to crotch]
A pair of trousers is a kind of garment.
A pair of trousers is usually formal.
The plural of trousers is pairs of trousers. They are plural-named.
Understand "pants" as a pair of trousers.
The description of a pair of trousers is usually "A pair of trousers."
When play begins:
	Now every pair of trousers is incompatible with every pair of trousers;
	Now every pair of trousers overlies every pair of legs;
	Now every pair of trousers overlies every pair of thighs;
	Now every pair of trousers overlies every ass;
	Now every pair of trousers overlies every vagina;
	Now every pair of trousers overlies every penis;
	Now every pair of trousers overlies every pair of panties;
	Now every pair of trousers overlies every pair of stockings;
	Now every pair of trousers overlies every pair of pantyhose;

[Skirt covers thighs and crotch, goes over panties. Not compatible with trousers.]
[TODO: Open/liftable skirt to give access]
A skirt is a kind of garment.
The description of skirt is usually "A plain skirt."
When play begins:
	Now every skirt is incompatible with every skirt;
	Now every skirt overlies every ass;
	Now every skirt overlies every vagina;
	Now every skirt overlies every penis;
	Now every skirt overlies every pair of thighs;
	Now every skirt overlies every pair of panties;
	Now every skirt is incompatible with every pair of trousers;

[Shirt covers torso/breasts and armpits, and fits over bra.]
A shirt is a kind of garment.
The description of a shirt is usually "A plain shirt."
When play begins:
	Now every shirt is incompatible with every shirt;
	Now every shirt overlies every chest;
	Now every shirt overlies every tummy;
	Now every shirt overlies every pair of breasts;
	Now every shirt overlies every pair of armpits;
	Now every shirt overlies every bra;

[Sweater covers torso/breasts, arms and armpits]
A sweater is a kind of garment.
The description of a sweater is usually "A plain sweater, covering the torso."
When play begins:
	Now every sweater is incompatible with every sweater;
	Now every sweater overlies every pair of arms;
	Now every sweater overlies every chest;
	Now every sweater overlies every tummy;
	Now every sweater overlies every pair of breasts;
	Now every sweater overlies every pair of armpits;
	Now every sweater overlies every bra;
	Now every sweater overlies every shirt;

[A dress covers torso/breasts, arms, armpits, thighs, legs and crotch]
A dress is a kind of garment.
A dress is usually formal.
The description of a dress is usually "A lovely dress."
When play begins:
	Now every dress is incompatible with every dress;
	Now every dress overlies every pair of arms;
	Now every dress overlies every chest;
	Now every dress overlies every tummy;
	Now every dress overlies every pair of breasts;
	Now every dress overlies every pair of armpits;
	Now every dress overlies every ass;
	Now every dress overlies every vagina;
	Now every dress overlies every penis;
	Now every dress overlies every pair of thighs;
	Now every dress overlies every pair of panties;
	Now every dress overlies every bra;
	Now every dress is incompatible with every skirt;
	Now every dress is incompatible with every pair of trousers;
	Now every dress is incompatible with every shirt;
	Now every dress is incompatible with every sweater;

[A jacket covers torso/breasts, arms and armpits]
A jacket is a kind of garment.
A jacket is usually formal.
The description of a shirt is usually "A jacket, covering the torso."
When play begins:
	Now every jacket is incompatible with every jacket;
	Now every jacket overlies every pair of arms;
	Now every jacket overlies every chest;
	Now every jacket overlies every tummy;
	Now every jacket overlies every pair of breasts;
	Now every jacket overlies every pair of armpits;
	Now every jacket overlies every bra;
	Now every jacket overlies every shirt;
	Now every jacket overlies every sweater;
	Now every jacket overlies every dress;

[A coat covers torso/breasts, arms, armpits, crotch and thighs]
[TODO: Make it open-/lift-able]
A coat is a kind of garment.
The description of a shirt is usually "A coat, covering the torso and thighs."
When play begins:
	Now every jacket is incompatible with every jacket;
	Now every coat overlies every pair of arms;
	Now every coat overlies every chest;
	Now every coat overlies every tummy;
	Now every coat overlies every pair of breasts;
	Now every coat overlies every pair of armpits;
	Now every coat overlies every pair of thighs;
	Now every coat overlies every ass;
	Now every coat overlies every vagina;
	Now every coat overlies every penis;
	Now every coat overlies every bra;
	Now every coat overlies every shirt;
	Now every coat overlies every sweater;
	Now every coat overlies every dress;
	Now every coat is incompatible with every jacket;

A pair of glasses is a kind of garment.
They are plural-named. The plural of glasses is pairs of glasses.
The description of a pair of panties is usually "A pair of glasses."
When play begins:
	Now every pair of glasses is incompatible with every pair of glasses;
	Now every pair of glasses overlies every pair of eyes;

A hat is a kind of garment.
The description of a hat is usually "A stylish hat."
When play begins:
	Now every hat is incompatible with every hat;
	Now every hat overlies every hair;

Book 2 - Actions

To peek is a verb.

Part 2.1 - Dressing

[Make sure that the actor isn't wearing something that would go over what is being put on.]
Check an actor wearing something when a garment which overlies the noun is worn by the actor (This is the dressing in order rule):
	If the actor is the player:
		While the player wears a garment (called the impediment) which overlies the noun:
			Say "(first removing [the impediment])[command clarification break]";
			Silently try taking off the impediment;
			If the player is wearing the impediment, rule fails;
	Else:
		Let blockers be the list of garments worn by the actor which overlies the noun;
		Say "[If the player is the actor][We][else][Actor][end if] [cannot] [wear] [noun], [regarding the actor][they] [are] wearing [blockers]." (A) instead ;

[Make sure the actor isn't wearing something incompatible with what's being put on.]
Check an actor wearing something when a garment which is incompatible with the noun is worn by the actor (This is the no conflicting garment rule):
	If the actor is the player:
		While the player wears a garment (called the impediment) which is incompatible with the noun:
			Say "(first removing [the impediment])[command clarification break]";
			Silently try taking off the impediment;
			If the player is wearing the impediment, rule fails;
	Else:
		Let blockers be the list of garments worn by the actor which are incompatible with the noun;
		Say "[If the player is the actor][We][else][Actor][end if] [cannot] [wear] [noun], [regarding the actor][they] [are] wearing [blockers]" (A) instead;

[Update the underlaying relation.
This rule is not named, as removing it will completely bork things.]
Carry out an actor wearing a garment:
	Repeat with hidden item running through things worn by the actor:
		If the noun overlies the hidden item, now the hidden item underlies the noun;
	Repeat with hidden item running through body parts that are part of the actor:
		If the noun overlies the hidden item, now the hidden item underlies the noun;

[Make sure that all players are properly wearing their garments when play begins.]
When play begins (This is the initial garments rule):
	Repeat with current-coverable running through the list of coverables:
		Now current-coverable is not underlaid by anything;
	Repeat with P running through the list of persons:
		Repeat with current-garment running through the list of garments worn by P:
			Repeat with hidden item running through garments worn by P:
				If the current-garment overlies the hidden item, now the hidden item underlies the current-garment;
			Repeat with hidden item running through body parts that are part of P:
				If the current-garment overlies the hidden item, now the hidden item underlies the current-garment;

Part 2.2 - Undressing

[Make sure that garments that are covered can't be taken off.]
Check an actor taking off something which underlies something which is worn by the actor (This is the player undressing in order rule):
	While the noun underlies something (called the impediment) which is worn by the actor:
		Say "(first removing [the impediment])[command clarification break]";
		Silently try the actor taking off the impediment;
		If the noun underlies the impediment, rule fails.

Check an actor taking off (This is the undressing in order rule):
	if the noun underlies something (called the impediment) which is worn by the player, say "[The impediment] [are] in the way." instead.

[Update the underlaying relation.
This rule is not named, as removing it will completely bork things.]
Carry out an actor taking off a garment:
	Now the noun is not underlaid by anything;

[Report what the actor is wearing after taking off something. We could do this by altering the standard report rule, but this is hard to make compatible with other types of clothing, so we print it as a second line instead. The alternative is left in here for those that want to experiment:
The standard report taking off rule response (A) is  "[We] [take] off [the noun], and [are] [now][if actor is wearing a garment] wearing [a list of visible garments worn by the actor][else] completely nude."
The standard report taking off rule response (B) is "[The actor] [take] off [the noun], and [are] [now][if actor is wearing a garment] wearing [a list of visible garments worn by the actor][else] completely nude."]
Report an actor taking off a garment (This is the report garment undressing rule):
	Say "[If the player is the actor][We][else][Actor][end if] [are] [are] [now][if actor is wearing a garment] wearing [a list of visible garments worn by the actor][else] completely nude."

The report garment undressing rule is listed last in the report taking off rules.

Part 2.3 - Stripping

[Remove everything worn by the actor, in correct order.]
Carry out an actor stripping while the actor is wearing garments (this is the stripping removes every garment rule):
	While the actor is wearing something accessible (called cloth):
		Silently try the actor taking off the cloth;
		If the actor is wearing the cloth, say "Failed in taking off [cloth]." instead;

Part 2.4 - Inventory

[When the player takes inventory, we want to also report what the player is wearing]

Report taking inventory (this is the list player garments rule):
	If the player is wearing garments, say "[We] [are] wearing [a list of visible garments worn by the player]."
[Instead of taking inventory:
	say "[if the player carries something][We]['re] carrying [the list of things carried by the player][else][We]['re] empty-handed[end if][if the player wears something]. [We] [are] wearing [a list of visible garments worn by the player][end if]."]

Part 2.5 - Looking under

Instead of looking under something which is worn by the player:
	If something (called the underwear) underlies the noun, say "[We] [peek] at [the underwear]. Yup, still there.";
	Otherwise say "Just [us] in there."

Part 2.6 - Examining

[We want to stop the player from examining garments that are hidden]
Check examining a garment that is not visible (this is the block covered garments rule):
	Say "[We] [cannot] [see] that."(A) instead;
[This causes a stack overflow for some reason.
Rule for deciding the concealed possessions of a person:
	If the particular possession is a concealed garment, decide no;]

[This provides the player with a list of the garments he can see another person wearing when examining them.]
Report examining a person (called target) wearing garments (This is the list visible garment rule):
	Say  "[Target] [are] wearing [the list of visible garments worn by target].";

The list visible garment rule is listed last in the report examining rules.

Garments ends here.

---- DOCUMENTATION ----

This extensions relies on the coverable from the Body Parts extension, and adds garments as a new kind of coverable.

Chapter: Using this Extension

This extension requires Body Parts, and is incompatible with Outfits. It is inspired by example 242 of the Inform manual, but modifed and expanded greatly.

This extension provides garment to represent clothing, various rules to govern taking then on and off, and a set of predefined garments. None of these are automatically added, but provide templates for the author to expand upon. See Example A for how to define a jacket worn by a person 

Section: Visibility

Unlike body parts, we don't want the player examining garments that are not visible. If this is desirable (or you want to write your own rule governing vision), unlist the "block covered garments rule".
Whenever the player examines another person, a list of the visible garments worn by that person is printed. This can be stopped by unlisting the "list visible garment rule".

Section: Dressing, Undressing and Stripping

When trying to wear a garment, the rules will check if the character is wearing anything that goes outside what is being put on. If it's the player dressing, the offending piece will be removed, but for other characters a message will be given instead. Likewise when undressing, the rules will check that the character is not currently wearing something that goes outside what is taken off. This means that you can't reach under skirt/dresses, which is something that might be added in a later version.

	* "Strip" is made workable, and will remove any garments the character is wearing, in correct order.
	* As part of taking inventory (i), a list of what the character is wearing will be listed. To stop this, unlist the "list player garments rule".
	* Whenever a character takes off clothing, it will display what the character is now wearing (that's visible). To stop this, unlist the "undressing report clothing rule".
	* Support for "looking under" garments.

Remember that Inform has a set of persuasion rules that governs what you can order other characters to do. If you want all characters to respont to commands to dress and undress, you should look at Example B:

Section: List of Garments

	* A pair of panties: Covers ass, vagina and penis.
	* A bra: Covers breasts and chests.
	* A pair of stockings: Cover feet, legs and thighs.
	* A pair of pantyhose: Goes over panties, and is incompatible with stockings. Cover feet, legs, thighs, ass, vagina and penis.
	* A pair of socks: Goes over pantyhose/stockings. Cover feet.
	* A pair of shoes: Goes over socks and pantyhose/stockings. Cover feet.
	* A pair of trousers: Goes over panties and stockings/pantyhose. Cover legs, thighs, ass, vagina and penis.
	* A skirt: Goes over panties, and is incompatible with. Covers thighs, ass, vagina and penis.
	* A shirt: Goes over bra. Covers tummy, chest/breasts and armpits.
	* A sweater: Goes over bra and shirt. Covers tummy, chest/breasts, arms and armpits.
	* A dress: Goes over panties and bra, and is incompatible with skirt, trousers, shirt and sweater. Covers thighs, ass, vagina and penis, tummy, chest/breasts, arms and armpits.
	* A jacket: Goes over bra, shirt, sweater and dress. Covers tummy, chest/breasts, arms and armpits.
	* A coat: Goes over bra, shirt, sweater and dress, and is incompatible with jacket. Covers thighs, ass, vagina, penis, tummy, chest/breasts, arms and armpits.
	* A pair of glasses: Covers eyes
	* A hat: Covers hair

Chapter: Technical Notes

Note that because Inform does not allow references only between things and not kinds, we have to specify when play begins that all things of a certain kind cover all things of the kinds they are supposed to cover. This means that the number of relations in play will scale geometrically; number of characters times number of garment sets. This can lead to performance issues in stories with many actors.

If garments area changed behind the scenese by use of "now soandso is wearing garment", then the initial garments rule should be invoked to properly update the covering relations.

Section: Creating New Garments

Creating a new garment is a two part process. Defining the garment is easy, but then we need to define what it goes over (by using the overlies relation), and what it is incompatible with (by using the incompatible with relation). In order to stop wearing two of the same kind of garment, they also have to be made incompatible with itself. This goes into a "when play begins" segment, for the reason stated above. Note that we also need to define which garments go over the one just created. Example C covers this.

Section: Version History

Release 2 (v0.4): 

	No code changes, but documentation improved.

Release 3 (v1.0): 

	Added hats and glasses.
	Fixed so that multiples of the same kind can't be worn together. Whoopsie.
	Improved action reporting.
	Fixed initial wearing of garments.

Section: Planned expansion

I might revisit this expansion and add functionality for shifting/opening garments, to allow access to what is covered.

Section: Contact Info

The author of the framework can be reached in the following ways:

	* Mail: fictitious.frode@gmail.com
	* Blog: https://informedaif.wordpress.com/ is a blog dedicated to writing AIF with Inform 7, and is the official host of the framework. It contains both dicussions around AIF and tutorials on both Inform in general and this framework in particular.
	* Reddit: https://www.reddit.com/r/AIFCentral/ is the subreddit for the AIF community, and the author checks this regularly.

Feedback of all varieties is welcome, but constructive criticism and discussion is the most appreciated, along with reports of bugs and other issues. For support I would appreciate using public communication, so that other may learn from the request as well.

Example: * Garments - Enabling garments

	Soandso is a person.

	A leather jacket is a jacket worn by Soandso.
	The description of leather jacket is "Would you buy this fine leather jacket?"

Example: ** Persuasion - Making every character respond to commands to take on/off garments

	Persuasion rule for asking a person to try wearing a garment: persuasion succeeds.
	Persuasion rule for asking a person to try taking off a garment: persuasion succeeds.

Example: *** Creating New Garments - A fictitious piece of clothing that goes under socks.

	A pair of undersocks is a kind of garment.
	The plural of undersocks is pairs of undersocks. They are plural-named.
	The description of a pair of undersocks is usually "This is just made up."
	A pair of undersocks is usually immodest.
	When play begins:
		Now every pair of undersocks is incompatible with every pair of undersocks;
		Now every pair of undersocks overlies every pair of feet.
		Now every pair of undersocks is incompatible with every pair of stockings.
		Now every pair of undersocks is incompatible with every pair of pantyhose.
		Now every pair of socks overlies every pair of undersocks.
		Now every pair of shoes overlies every pair of undersocks.