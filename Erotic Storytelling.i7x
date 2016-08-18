Version 1 of Erotic Storytelling by Fictitious Frode begins here.
"A framework for creating Adult Interactive Fiction (AIF), providing the layered clothing, body parts, and the necessary erotic actions. Comes with a discrete arousal system (that is replaceable with numerical arousal), as well as an optional conversation system.
Still being developed."

Volume 0 - New Verbs

[These are the new verbs the framework uses; 
We put this in it's own volume in case anyone needs to rewrite it for compatibility:]

Section - Dressing Related Verbs

To move is a verb.
To unbutton is a verb.
To button is a verb.
To unzip is a verb.
To zip is a verb.
To unfasten is a verb.
To fasten is a verb.
To hike is a verb.
To rip is a verb.

Section - Actions Related Verbs

To lick is a verb.
To bite is a verb.
To tickle is a verb.
To pinch is a verb.
To spank is a verb.

To kiss is a verb.
To hug is a verb.
To dance is a verb.

Volume 1 - Layered Clothing

[This volume deals with setting up a system for layered clothing, which includes body parts and garments.
Note that later volumes will use and expand upon this, i.e. arousal/consent restraints for undressing.]

Book 1.1 - New Kinds and Values

[We start by defining the necessary kinds and values we need to make layered clothing work.]

Part 1.1.1 - Coverage

Chapter 1.1.1a - Decency

[Status: Complete]

A decency is a kind of value. The decencies are indecent, immodest, casual, formal and undefined decency.
The specification of decency is "Decency is a measure of how much skin a person is showing, and is defined for cover areas and garments. Body parts will inherit the lowest decency of the areas it covers, but this can be 'upgraded' by covering with clothing.
The decency of a person is a value that will be referenced more often than it's updated, so we cache it and force the actions that will change it to update the cached value using the provided method 'update decency for Person'. Note; It's possible to manually set the decency of a person to a different value than it would be calculated to be; this value would hold untill the next action that recalculates it.
Rooms also have a decency called the decency threshold; this is compared to the player's decency before going somewhere, or taking off/shifting/ripping garments.
Currently, the actions wearing, taking off, shifting, unshifting and ripping garments will recalculate the decency of the (former) wearer.
The undefined decency is not intended to be used, but is needed to signal that the value hasn't been calculated yet."

A person has a decency called the current decency. The current decency of a person is usually the undefined decency.

A room has a decency called the decency threshold. The decency threshold of a room is usually casual.

Chapter 1.1.1b - Cover Areas

[Status: Complete]

A cover area is a kind of value. The cover area are defined by the Table of Coverage.
The specification of cover area is "Cover areas are the distinct, non-overlapping areas of the body that can be covered by garments. They are needed to provide the link between garments and body parts in order to provide decency, as not all areas on a person might be associated with a body part.
A body part or garment is considered to be visible if atleast one of it's cover areas is not covered. Visibility of garments are handled by the concealed possessions rulebok, while body parts are obviously present even when covered and as such are handled by descriptions instead. See body parts for more details."

Table of Coverage
Cover Area	Uncovered Decency (decency)
The head area	formal
The face area	formal
The shoulder area	casual
The arm area	casual
The hand area	formal
The upper torso area	indecent
The upper back area	formal
The lower torso area	immodest
The lower back area	casual
The crotch area	indecent
The thigh area	immodest
The leg area	casual
The feet area	immodest

[Extension:
These are not included by default, but could be:
The neck area	formal
The wrist area	formal
The ankle area	formal]

A person has a list of cover areas called body areas.
The body areas of a person is usually {head area, face area, shoulder area, arm area, hand area, upper torso area, upper back area, lower torso area, lower back area, crotch area, thigh area, leg area, feet area}.

Chapter 1.1.1c - Body Part

[Status: Complete]

A body part is a kind of thing.
The specification of body part is "A body part represents a part of a person that the player can interact with. While they can be instantiated directly, it's usually better to use one of the templated subclasses.
There can be several body parts in any given cover area, and although rare a body part can be in several areas and is only concealed if all of those areas have worn garments. The decency of a body part is determined by the least decent area it's in."

A body part has a list of cover areas called cover locations.

Section - Descriptions

A body part has some text called the concealed description.
A body part has some text called the visible description.

Section - Understanding

A body part has some text called owner's pronoun. [Note: This will be updated at story start with the initiate erotic storytelling rule to match the person the part belongs to.]
Understand the owner's pronoun property as describing a body part. 

Does the player mean examining a body part that is part of the player: It is unlikely.

Part 1.1.2 - Clothing

[Status: Complete]

A garment is a kind of thing.
The specification of garment is "A garment is something a person can wear over their body parts and related cover areas. 
Garments are quite complex, with several distinct sub-features: Some garments can be shiftable in various ways, or even be ripped apart. Transparency determines whether it blocks vision, and they can allow or block touching through. Clothing size is provided to allow garments to only be wearable by matching persons."

A garment is always wearable.
A garment has a decency called cloth decency. The cloth decency of a garment is usually casual.
A garment can be transparent or opaque. A garment is usually opaque. [Determines visibility to underlying parts]
A garment can be allow touching through or block touching through. A garment is usually block touching through.
[NOTE: allow or block reaching (to access what is under) is replaced by shiftyness]

A person has a list of garments called the preferred clothing.

Chapter 1.1.2a - Shifting and Ripping

[Status: Complete]

A shiftyness is a kind of value. The shiftyness are defined by the Table of Shift.
The specification of shiftyness is "Shiftyness (which isn't really a word) are the positions that a garment can be shifted to in order to allow (usually) more access to underlying parts.
Mechanic-wise, it functions similarly to open, with the shiftable property determining whether the player can shift it, and shifted determining if it has been. Shiftyness determines what verbs the player can use to move the garment, and the textual responses.
Shifting a garment also has the possibility of altering the areas covered (through the list property shifted cover areas), and default cover blocking determines wheter to use the default cover areas or the ripped/shifted cover areas to determine if blocks unwearing."

Table of Shift
Shiftyness	describe shifting (text)	describe shifted (text)	describe unshifting (text)	describe unshifted (text)
moveable	"[move]"	"moved aside"	"[move] back"	"in place"
buttonable	"[unbutton]"	"unbuttoned"	"[button] up"	"buttoned"		
zipable	"[unzip]"	"unzipped"	"[zip] up"	"zipped up"
fastenable	"[unfasten]"	"unfastened"	"[fasten]"	"fastened"
raisable	"[hike] up"	"hiked up"	"[pull] down"	"in place"
lowerable	"[pull] down"	"pulled down"	"[pull] up"	"in place"

[Deciding on:]
To decide what text is the describe shifting of (S - a shiftyness):
	Repeat with N running from 1 to the number of rows in the Table of Shift:
		Choose row N in the Table of Shift;
		If S is the Shiftyness entry, decide on the describe shifting entry;

To decide what text is the describe unshifting of (S - a shiftyness):
	Repeat with N running from 1 to the number of rows in the Table of Shift:
		Choose row N in the Table of Shift;
		If S is the Shiftyness entry, decide on the describe unshifting entry;

To decide what text is the describe shifted of (S - a shiftyness):
	Repeat with N running from 1 to the number of rows in the Table of Shift:
		Choose row N in the Table of Shift;
		If S is the Shiftyness entry, decide on the describe shifted entry;

To decide what text is the describe unshifted of (S - a shiftyness):
	Repeat with N running from 1 to the number of rows in the Table of Shift:
		Choose row N in the Table of Shift;
		If S is the Shiftyness entry, decide on the describe unshifted entry;

[Saying:]
To say describe shifting of (S - a shiftyness):
	Repeat with N running from 1 to the number of rows in the Table of Shift:
		Choose row N in the Table of Shift;
		If S is the Shiftyness entry, say the describe shifting entry;

To say describe unshifting of (S - a shiftyness):
	Repeat with N running from 1 to the number of rows in the Table of Shift:
		Choose row N in the Table of Shift;
		If S is the Shiftyness entry, say the describe unshifting entry;

To say describe shifted of (S - a shiftyness):
	Repeat with N running from 1 to the number of rows in the Table of Shift:
		Choose row N in the Table of Shift;
		If S is the Shiftyness entry, say the describe shifted entry;

To say describe unshifted of (S - a shiftyness):
	Repeat with N running from 1 to the number of rows in the Table of Shift:
		Choose row N in the Table of Shift;
		If S is the Shiftyness entry, say the describe unshifted entry;

A garment has a shiftyness.
A garment can be shiftable. A garment is usually not shiftable.
A garment can be shifted or unshifted. A garment is usually not shifted.

A garment can be rippable. A garment is usually not rippable.
A garment can be ripped. A garment is usually not ripped.

Chapter 1.1.2b - Clothing Size

[Status: Complete]

A garment has a number called clothing size. The clothing size of a garment is usually 0.
A person has a number called clothing size. The clothing size of a person is usually 0.

Chapter 1.1.2c - Cover Areas

[Status: Complete
A garment fits over a set of cover areas, which can be modified by ripping or shifting the garment. This will subtract certain cover areas.]

A garment has a list of cover areas called cover areas.
A garment has a list of cover areas called shifting revealed cover areas. [The cover areas revealed when the garment is shifted.]
A garment has a list of cover areas called ripping revealed cover areas. [The cover areas revealed when the garment is ripped.]

[This weirdly named property determines wheter to use the default cover areas or the ripped/shifted cover areas to determine if blocks unwearing.]
A garment can be default cover blocking. A garment is usually not default cover blocking.

Chapter 1.1.2d - Descriptions

[Status: Complete]

[A garment has four different descriptions, depending on it's state (in reverse order of priority):
* Unworn is the description for when nobody is wearing the garment.
* Worn is the description for when the garment is worn.
* Shifted is the description for when the garment is shifted.
* Ripped is the description for when the garment is ripped/destroyed.]

A garment has some text called the ripped description.
A garment has some text called the shifted description.
A garment has some text called the worn description.
A garment has some text called the unworn description.

Chapter 1.1.2e - Layering

[Status: Complete]

A clothing layer is a kind of value. The clothing layers are skinwear, underwear, normalwear, overwear, outerwear.
The specification of clothing layer is "Clothing layer is used together with the covered areas to determine which garments are compatible with each other. A person can only be wearing one garment for each layer over each cover area."

A garment has a clothing layer. A garment is usually normalwear.

Chapter 1.1.2f - Understanding

A garment has some text called wearer's pronoun. [Note: This will be updated at story start with the initiate erotic storytelling rule to match the wearer.]
Understand the wearer's pronoun property as describing a garment.[ when the thing is enclosed by a person.]

Does the player mean examining a garment that is worn by player: It is unlikely.

Part 1.1.3 - Outfits

[Status: TODO; Concept-stage]

An outfit is a kind of garment.
The specification of outfit is "An outfit is a special kind of garment, designed to be an alternative to individual garment pieces the player can interact with. It therefore cover almost all the body areas of a person, except hands and head/face."

The cover areas of an outfit is usually {shoulder area, arm area, upper torso area, upper back area, lower torso area, lower back area, crotch area, thigh area, leg area, feet area}.
The clothing layer of an outfit is usually skinwear.

Chapter - Body Part Descriptions

Chapter - Reactive Crowds

Part 1.1.4 - Discovery and Concealment

[Status: Bare-bones.]

A thing can be discovered. A thing is usually not discovered.
Before printing the name of something (called D): now D is discovered.

Book 1.2 - Functionality

Chapter 1.2.0a - Startup Procedures

When play begins (this is the initiate erotic storytelling rule):
	[Set correct pronouns for body parts; the default is her]
	Repeat with part running through the body parts:
		If part is part of the player:
			Now owner's pronoun of part is "my";		
		Else if part is part of a man:
			Now owner's pronoun of part is "his";
	[Set correct pronouns for garments; the default is her]
	Repeat with cloth running through the garments:
		Update pronoun for cloth;
	[Calculate the decency for any undefined persons: Small hack here, as Inform won't let us iterate over all persons anymore.]
	Repeat with P running through the persons:
		If the current decency of P is undefined decency, update decency for P;

To update pronoun for (G - a garment):
	If G is worn by a person (called P):
		If P is the player:
			Now wearer's pronoun of G is "my";		
		Else if P is worn a man:
			Now wearer's pronoun of G is "his";
		Else if P is a woman:
			Now wearer's pronoun of G is "her";
		Else:
			Now wearer's pronoun of G is "their";
	Else:
		Now wearer's pronoun of G is "their";
	
Part 1.2.1 - Determining Decency and Privacy

Chapter 1.2.1a - Determining Decency

[Status: Complete
For cover areas and body parts, we calculate the decency; for persons we cache it in a variable.]

Section - Cover Area

To decide which decency is the decency of (C - a cover area):
	Repeat with N running from 1 to the number of rows in the Table of Coverage:
		Choose row N in the Table of Coverage;
		If C is the Cover Area entry, decide on the uncovered decency entry;

Section - Body Part

To decide which decency is the base decency of (P - a body part):
	Let current be the undefined decency;
	Repeat with A running through the cover locations of P:
		If the decency of A is less than current, now current is the decency of A;
	Decide on current;

Section - Person

To update decency for (P - a person):
	Now the current decency of P is undefined decency;
	Repeat with area running through the body areas of P:
		Let considered be undefined decency;
		Repeat with G running through the garments worn by P:
			If G is visible and G is opaque and area is listed in the body areas of P:
				Let considered be the cloth decency of G;
		If considered is undefined decency, let considered be the decency of area;
		If considered is less than the current decency of P, now the current decency of P is considered;

Chapter 1.2.1b - Privacy

[Status: Complete]

Check an actor going (this is the check decency before going rule):
	If the decency threshold of the room gone to is greater than current decency of the actor:
		If the actor is the player:
			Say "[We] [can't go] that way dressed like that!" (A);
		Else if the player can see the actor:
			Say "[The actor] [can't go] that way dressed like that!" (B);
		Stop the action;

Part 1.2.2 - Layering

[Status: Complete
This deals with the layering of garments over body parts and each other. This can have three related but different results:
Covering - Prevent touch
Conceal - Prevent vision; ie. transparent layers are ignored.
Blocking - Prevent taking off. This is a special subset of covering.
There's probably a need for more functions here later on, but as of now all necessary functions are implemented.]

Chapter 1.2.2a - Determining Cover Areas

To decide what list of cover areas is the modified covered areas of (G - a garment):
	Let cover be the cover areas of G;
	If G is ripped:
		Repeat with A running through the ripping revealed cover areas of G:
			If A is listed in cover, remove A from cover;
	Else if G is shifted:
		Repeat with A running through the shifting revealed cover areas of G:
			If A is listed in cover, remove A from cover;
	Decide on cover;

To decide what list of cover areas is the blocked cover areas of (G - a garment):
	If G is default cover blocking:
		Decide on the cover areas of G;
	Decide on the modified covered areas of G;

Chapter 1.2.2b - Body Parts

To decide whether (P - a body part) can be seen:
	Let clothing be the list of garments worn by P;
	Sort clothing in reverse clothing layer order;
	Repeat with cloth running through clothing:
		Repeat with A running through the cover locations of P:
			If cloth is opaque and A is listed in the modified covered areas of cloth:
				Decide no;
	
To decide whether (P - a body part) can be touched:
	Let clothing be the list of garments worn by the holder of P;
	Sort clothing in reverse clothing layer order;
	Repeat with cloth running through clothing:
		If cloth is block touching through:
			Let intersect be the modified covered areas of cloth;
			Repeat with A running through intersect:
				If A is not listed in the cover locations of P, remove A from intersect;
			If the number of entries in intersect greater than 0, decide no;
	Decide yes;

To decide which list of garments is preventing touching of (P - a body part):
	Let preventers be a list of garments;
	Let clothing be the list of garments worn by the holder of P;
	Sort clothing in reverse clothing layer order;
	Repeat with cloth running through clothing:
		If cloth is block touching through:
			Let intersect be the modified covered areas of cloth;
			Repeat with A running through intersect:
				If A is not listed in the cover locations of P, remove A from intersect;
			If the number of entries in intersect is greater than 0:
				Add cloth to preventers, if absent;
	Decide on preventers;

To decide whether (P - a body part) is accessible:
	Let clothing be the list of garments worn by the holder of P;
	Sort clothing in reverse clothing layer order;
	Repeat with cloth running through clothing:
		Let intersect be the blocked cover areas of cloth;
		Repeat with A running through intersect:
			If A is not listed in the cover locations of P, remove A from intersect;
		If the number of entries in intersect is greater than 0, decide no;
	Decide yes;

Chapter 1.2.2c - Cover Areas

To decide whether (A - cover area) can be seen for (P - a person):
	Let clothing be the list of garments worn by P;
	Sort clothing in reverse clothing layer order;
	Repeat with cloth running through clothing:
		If cloth is opaque and A is listed in the modified covered areas of cloth:
			Decide no;
	Decide yes;

To decide which decency is exposed by (A - cover area) on (P - a person):
	Let clothing be the list of garments worn by P;
	Sort clothing in reverse clothing layer order;
	Repeat with cloth running through clothing:
		If cloth is opaque and A is listed in the modified covered areas of cloth:
			Decide on the cloth decency of cloth;
	Decide on the decency of A;

[Determine what would be revealed if G was removed from a cover area]
To decide which list of things is concealed by (G - a garment) for (A - cover area):
	Let revealed be a list of things;
	[First; determine whether G would reveal anything at all]
	Let clothing be the list of garments worn by the holder of G;
	Remove G from clothing;
	Sort clothing in reverse clothing layer order;
	[Determine if G is the topmost concealer for the area:]
	Repeat with cloth running through clothing:
		If clothing layer of cloth is less than clothing layer of G:
			Break; [What remains in clothing are the potentially revealed garments]
		If clothing layer of cloth is clothing layer of G:
			Remove cloth from clothing;
			Next;
		If cloth is transparent:
			Remove cloth from clothing;
			Next;
		If A is listed in the modified covered areas of cloth:
			[Cloth overlies G for the area, so nothing would be revealed here]
			Decide on revealed;
	[Determine which garments would be revealed, and whether body parts are visible too.]
	Repeat with cloth running through clothing:
		If A is not listed in the modified covered areas of cloth:
			Next;
		Add cloth to revealed, if absent;
		If cloth is opaque:
			[The area is covered, so body parts and underlying garments won't be revealed.]
			Decide on revealed;
	[Determine which body parts would be revealed]
	Repeat with P running through the body parts contained by the holder of G:
		If A is listed in the cover locations of P:
			If P can be seen:
				Next; [It's already visible, and thus can't be revealed]
			Add P to revealed, if absent;
	Decide on revealed;

Chapter 1.2.2d - Garments

Section - Visibility of Garments

[A garment can be seen if atleast one (unmodified) cover area is visible;
a shifted/ripped garment can be seen even if the only visible cover area is visible.
An unworn garment is assumed to be visible.]

To decide whether (G - a garment) can be seen:
	If G is not worn:
		Decide yes;
	Repeat with A running through the cover areas of G:
		Let clothing be the list of garments worn by the holder of G;
		Remove G from clothing; [We don't want to let G block vision of G]
		Sort clothing in reverse clothing layer order;
		Repeat with cloth running through clothing:
			[Only consider opaque garments with a higher clothing layer]
			If cloth is opaque and clothing layer of cloth is greater than clothing layer of G:
				If A is not listed in the modified covered areas of cloth: [Take shifted/ripped into account]
					Remove cloth from clothing;
			Else:
				Remove cloth from clothing;
		If clothing is empty, decide yes; [Nothing covers this area, so G is visible]
	Decide no; [We only come here if no cover areas were visible]

To decide which list of garments is concealing vision of (G - a garment):
	Let concealers be a list of garments;
	If G is not worn:
		Decide on concealers;
	Repeat with A running through the cover areas of G:
		Let clothing be the list of garments worn by the holder of G;
		Remove G from clothing; [We don't want to let G block itself]
		Sort clothing in reverse clothing layer order;
		Repeat with cloth running through clothing:
			[Only consider opaque garments with a higher clothing layer]
			If cloth is opaque and clothing layer of cloth is greater than clothing layer of G:
				If A is listed in the modified covered areas of cloth: [Take shifted/ripped into account]
					Add cloth to concealers, if absent;
	Decide on concealers;

Section - Touching Garments

[A garment can be touched if all of the cover areas of it are not blocked by anything that doesn't allow touching]
To decide whether (G - a garment) can be touched:
	If G is not worn:
		Decide yes;
	Let clothing be the list of garments worn by the holder of G;
	Remove G from clothing; [We don't want to let G block itself]
	Sort clothing in reverse clothing layer order;
	Repeat with cloth running through clothing:
		If cloth is block touching through and clothing layer of cloth is greater than clothing layer of G:
			Let intersect be the modified covered areas of cloth;
			Repeat with A running through intersect:
				If A is not listed in the modified covered areas of G, remove A from intersect;
			If the number of entries in intersect is greater than 0, decide no;
	Decide yes;

To decide which list of garments is preventing touching of (G - a garment):
	Let preventers be a list of garments;
	If G is not worn:
		Decide on preventers;
	Let clothing be the list of garments worn by the holder of G;
	Remove G from clothing; [We don't want to let G block itself]
	Sort clothing in reverse clothing layer order;
	Repeat with cloth running through clothing:
		If cloth is block touching through and clothing layer of cloth is greater than clothing layer of G:
			Let intersect be the modified covered areas of cloth;
			Repeat with A running through intersect:
				If A is not listed in the modified covered areas of G, remove A from intersect;
			If the number of entries in intersect is greater than 0:
				Add cloth to preventers, if absent;
	Decide on preventers;

Section - Wearing Garments

[A garment can be taken off if none of the blocking cover areas underlies anything]
To decide whether (G - a garment) can be worn by (P - a person):
	If G is worn by P:
		Decide yes; [Technically no, but that's stopped elsewhere]
	Let clothing be the list of garments worn by P;
	Sort clothing in reverse clothing layer order;
	Repeat with cloth running through clothing:
		If clothing layer of cloth is greater than clothing layer of G:
			Let intersect be the modified covered areas of cloth;
			Repeat with A running through intersect:
				If A is not listed in the blocked cover areas of G, remove A from intersect;
			If the number of entries in intersect is greater than 0, decide no;
	Decide yes;
	
To decide which list of garments is preventing wearing of (G - a garment) by (P - a person):
	Let preventers be a list of garments;
	If G is worn by P:
		Decide on preventers;
	Let clothing be the list of garments worn by P;
	Sort clothing in reverse clothing layer order;
	Repeat with cloth running through clothing:
		If clothing layer of cloth is greater than clothing layer of G:
			Let intersect be the modified covered areas of cloth;
			Repeat with A running through intersect:
				If A is not listed in the blocked cover areas of G, remove A from intersect;
			If the number of entries in intersect is greater than 0:
				Add cloth to preventers, if absent;
	Decide on preventers;

Section - Taking Off Garments

To decide whether (G - a garment) can be taken off:
	If G is not worn:
		Decide yes;[Technically, no; but we don't want to stop that here.]
	Let clothing be the list of garments worn by the holder of G;
	Remove G from clothing; [We don't want to let G block itself]
	Sort clothing in reverse clothing layer order;
	Repeat with cloth running through clothing:
		If clothing layer of cloth is greater than clothing layer of G:
			Let intersect be the blocked cover areas of cloth;
			Repeat with A running through intersect:
				If A is not listed in the blocked cover areas of G, remove A from intersect;
			If the number of entries in intersect is greater than 0, decide no;
	Decide yes;

To decide which list of garments is preventing taking off (G - a garment):
	Let preventers be a list of garments;
	If G is not worn:
		Decide on preventers;
	Let clothing be the list of garments worn by the holder of G;
	Remove G from clothing; [We don't want to let G block itself]
	Sort clothing in reverse clothing layer order;
	Repeat with cloth running through clothing:
		If clothing layer of cloth is greater than clothing layer of G:
			Let intersect be the blocked cover areas of cloth;
			Repeat with A running through intersect:
				If A is not listed in the blocked cover areas of G, remove A from intersect;
			If the number of entries in intersect is greater than 0:
				Add cloth to preventers, if absent;
	Decide on preventers;

[For each cover area removed, check if G is the current concealer, and if it is, add what it conceals]
To decide which list of things is revealed by taking off (G - a garment):
	Let revealed be a list of things;
	If G is not worn or G is transparent: [It doesn't conceal anything, so nothing will be revealed]
		Decide on revealed;
	[Use modified cover, as the areas revealed by shifting/ripping are already revealed:]
	Repeat with A running through the modified covered areas of G:
		Let items be the concealed by G for A;
		Repeat with I running through items:
			Add I to revealed, if absent;
	Decide on revealed;
			
To decide which decency is exposed by taking off (G - a garment):
	Let exposed be the undefined decency;
	Let revealed be the revealed by taking off G;
	Repeat with I running through revealed:
		If I provides the property cloth decency and the cloth decency of I is less than exposed:
			Now exposed is the cloth decency of I;
	Decide on exposed;

Section - Shifting Garments

[A garment can be shifted if the cover areas that are exposed by the shifting are not under the blocking areas of overlying garments.]
To decide whether (G - a garment) can be shifted:
	If G is not worn:
		Decide yes;[Technically, no; but we don't want to stop that here.]
	Let clothing be the list of garments worn by the holder of G;
	Remove G from clothing; [We don't want to let G block itself]
	Sort clothing in reverse clothing layer order;
	Repeat with cloth running through clothing:
		If clothing layer of cloth is greater than clothing layer of G:
			Let intersect be the blocked cover areas of cloth;
			Repeat with A running through intersect:
				If A is not listed in the shifting revealed cover areas of G, remove A from intersect;
			If the number of entries in intersect is greater than 0, decide no;
	Decide yes;

To decide which list of garments is preventing shifting of (G - a garment):
	Let preventers be a list of garments;
	If G is not worn:
		Decide on preventers;
	Let clothing be the list of garments worn by the holder of G;
	Remove G from clothing; [We don't want to let G block itself]
	Sort clothing in reverse clothing layer order;
	Repeat with cloth running through clothing:
		If clothing layer of cloth is greater than clothing layer of G:
			Let intersect be the blocked cover areas of cloth;
			Repeat with A running through intersect:
				If A is not listed in the shifting revealed cover areas of G, remove A from intersect;
			If the number of entries in intersect is greater than 0:
				Add cloth to preventers, if absent;
	Decide on preventers;

[For each cover area removed, check if G is the current concealer, and if it is, add what it conceals]
To decide which list of things is revealed by shifting (G - a garment):
	Let revealed be a list of things;
	If G is not worn or G is transparent: [It doesn't conceal anything, so nothing will be revealed]
		Decide on revealed;
	[Use modified cover, as the areas revealed by shifting/ripping are already revealed:]
	Repeat with A running through the shifting revealed cover areas of G:
		Let items be the concealed by G for A;
		Repeat with I running through items:
			Add I to revealed, if absent;
	Decide on revealed;

To decide which decency is exposed by shifting (G - a garment):
	Let exposed be the undefined decency;
	Let revealed be the revealed by shifting G;
	Repeat with I running through revealed:
		If I provides the property cloth decency and the cloth decency of I is less than exposed:
			Now exposed is the cloth decency of I;
	Decide on exposed;

Section - Ripping Garments

[A garment can be ripped if the cover areas that are exposed by the ripping are not under the blocking areas of overlying garments.]
To decide whether (G - a garment) can be ripped:
	If G is not worn:
		Decide yes;[Technically, no; but we don't want to stop that here.]
	Let clothing be the list of garments worn by the holder of G;
	Remove G from clothing; [We don't want to let G block itself]
	Sort clothing in reverse clothing layer order;
	Repeat with cloth running through clothing:
		If clothing layer of cloth is greater than clothing layer of G:
			Let intersect be the blocked cover areas of cloth;
			Repeat with A running through intersect:
				If A is not listed in the ripping revealed cover areas of G, remove A from intersect;
			If the number of entries in intersect is greater than 0, decide no;
	Decide yes;

To decide which list of garments is preventing ripping of (G - a garment):
	Let preventers be a list of garments;
	If G is not worn:
		Decide on preventers;
	Let clothing be the list of garments worn by the holder of G;
	Remove G from clothing; [We don't want to let G block itself]
	Sort clothing in reverse clothing layer order;
	Repeat with cloth running through clothing:
		If clothing layer of cloth is greater than clothing layer of G:
			Let intersect be the blocked cover areas of cloth;
			Repeat with A running through intersect:
				If A is not listed in the ripping revealed cover areas of G, remove A from intersect;
			If the number of entries in intersect is greater than 0:
				Add cloth to preventers, if absent;
	Decide on preventers;

[For each cover area removed, check if G is the current concealer, and if it is, add what it conceals]
To decide which list of things is revealed by ripping (G - a garment):
	Let revealed be a list of things;
	If G is not worn or G is transparent: [It doesn't conceal anything, so nothing will be revealed]
		Decide on revealed;
	[Use modified cover, as the areas revealed by shifting/ripping are already revealed:]
	Repeat with A running through the ripping revealed cover areas of G:
		Let items be the concealed by G for A;
		Repeat with I running through items:
			Add I to revealed, if absent;
	Decide on revealed;

To decide which decency is exposed by ripping (G - a garment):
	Let exposed be the undefined decency;
	Let revealed be the revealed by ripping G;
	Repeat with I running through revealed:
		If I provides the property cloth decency and the cloth decency of I is less than exposed:
			Now exposed is the cloth decency of I;
	Decide on exposed;

Chapter 1.2.2e - Definitions

Definition: A person is topless if the upper torso area can be seen for it.
Definition: A person is bottomless if the crotch area can be seen for him.
Definition: A person is nearly nude if the it is topless and it is bottomless.
Definition: A person is nude if the it is not wearing any garments.

Part 1.2.3 - Visibility

[Status: Mostly complete
Deals with determining which items are visible for the player, as well as custom descriptions.]

Chapter 1.2.3a - Concealed Possessions

Rule for deciding the concealed possessions of someone:
	If the particular possession is discovered, no;
	If the particular possession is a garment (called G):
		If G can be seen, no;
		Else yes;
	No;

Chapter 1.2.3b - Examining Body Parts

The examining body parts rule is listed after the standard examining rule in the carry out examining rulebook.
Carry out an actor examining (this is the examining body parts rule):
	If noun is a body part:
		If noun can be seen:
			If noun provides the property visible description and the visible description of the noun is not the default value of text:
				Say "[visible description of the noun][line break]";
				Now examine text printed is true;
		Else:
			If noun provides the property concealed description and the concealed description of the noun is not the default value of text:
				Say "[concealed description of the noun][line break]";
				Now examine text printed is true;

Chapter 1.2.3c - Examining Garments

The examining garments rule is listed after the standard examining rule in the carry out examining rulebook.
Carry out an actor examining (this is the examining garments rule):
	If noun is a garment:
		If noun provides the property ripped and noun is ripped:
			If noun provides the property ripped description and the ripped description of the noun is not the default value of text:
				Say "[ripped description of the noun][line break]";
			Else:
				Say "[The noun] [are] ripped to shreds.";
			Now examine text printed is true;
		Else if noun is worn and noun provides the property shifted and noun is shifted:
			If noun provides the property shifted description and the shifted description of the noun is not the default value of text:
				Say "[shifted description of the noun][line break]";
			Else:
				Say "[The noun] [are] [describe shifted of the shiftyness] to be more revealing.";
			Now examine text printed is true;
		Else if noun is worn:
			If noun provides the property worn description and the worn description of the noun is not the default value of text:
				Say "[worn description of the noun][line break]";
			Else:
				Say "[The noun] [are] worn by the [the holder of the noun].";
			Now examine text printed is true;
		Else:
			If noun provides the property unworn description and the unworn description of the noun is not the default value of text:
				Say "[unworn description of the noun][line break]";
				Now examine text printed is true;

Part 1.2.4 - Determining Access (Reaching Through)

[Status: TODO
Shifted and ripped garments allow the player to access body parts and garments as though part of the layers were not there, but we still want to know if they were present or not.]
				
Part 1.2.5 - Forcing Clothing

[Status: Complete
Sometimes it's necessary to forcefully change the clothing of someone, while still doing some rules maintenance. These are not intended to be used by the player, but rather at scene changes.]

[Forcefully strips a person of all worn things. It ignores all rules such as carrying capacity, but will update decency.
Use with caution!]
To force strip (P - a person):
	Let clothing be the list of things worn by P;
	Repeat with cloth running through clothing:
		If cloth provides the property shifted and cloth is shifted, now the cloth is unshifted;
		Now the P carries the cloth;
	Update decency for P;

[Forces a person to be wearing a given list of items (and only those!), taking off anything else being worn. It ignores all rules, but will update decency.
Use with caution!]
To force dress (P - a person) in (L - a list of things):
	Let clothing be the list of things worn by P;
	Repeat with cloth running through clothing:
		If cloth is not listed in L:
			If cloth provides the property shifted and cloth is shifted, now the cloth is unshifted;
			Now the P carries the cloth;
	Repeat with cloth running through L:
		If P is not wearing cloth:
			Now P is wearing cloth;
		Update pronoun for cloth;
	Update decency for P;

Book 1.3 - (Un-) Dressing

Part 1.3.1 - Wearing Garments

[Status: Complete
We use the standard wearing action, but add some checks and replace the carry out rule.
See also the consent and arousal sections.]

Chapter 1.3.1a - Check

[For each area the noun covers, get the blockers. If the layer of all those less than the layer of what's being put on, it's ok.]
Check an actor wearing something (This is the check wearing garments rule):
	If the noun is a garment (called G):
		If G can be worn by the actor:
			Continue the action;
		Let B be the preventing wearing of G by the actor;
		If the player is the actor:
			Say "[We] [can't] wear [noun] on top of [B]." (A);
		If the player can see the actor and the action is not silent:
			Say "[The actor] [can't] wear [noun] on top of [B]." (B);
		Stop the action;

Chapter 1.3.1b - Carry Out

Carry out an actor wearing (this is the wearing garments rule):
	If the noun is a garment (called G):
		Update decency for the actor;
[The modified wearing rule substitutes for the standard wearing rule.
Carry out an actor wearing (this is the modified wearing rule):
	Now the actor wears the noun;
	If the noun is a garment (called G):
		Update decency for the actor;]

Part 1.3.2 - Taking Off Garments

[Status: Complete.
For an actor taking off their own garments, we can use the standard taking off action, but add some checks and replace the carry out rule.
See also the consent and arousal sections.]

Chapter 1.3.2a - Check

[Make sure that garments that are covered can't be taken off.]
Check an actor taking off something (this is the can't take off covered items rule):
	If noun is a garment (called G):
		If G can be taken off:
			Continue the action;
		Let blockers be the preventing taking off G;
		If the player is the actor:
			Say "[We] [can't] wear [noun] on top of [blockers]." (A);
		If the player can see the actor and the action is not silent:
			Say "[The actor] [can't] wear [noun] on top of [blockers]." (B);
		Stop the action;

Check an actor taking off something (this is the can't take off in public rule):
	Let L be the location of the actor;
	If noun is a garment (called G):
		If the decency threshold of L is greater than exposed by taking off G:
			If the player is the actor:
				Say "It [are] too public for [us] to take that off here." (A);
			Else if the player can see the actor:
				Say "It [are] too public for [the actor] to take that off here." (B);
			Stop the action;

Chapter 1.3.2b - Carry Out

The modified taking off rule substitutes for the standard taking off rule.
Carry out an actor taking off (this is the modified taking off rule):
	Let wearer be the holder of the noun;
	Now the actor carries the noun;
	If the noun is a garment (called G):
		If G is shifted, now G is unshifted;
		Update decency for the wearer;

Part 1.3.3 - Taking Off Others

[Status: Complete
By default, taking clothing that others are wearing is blocked. This is something that should be allowed in certain situations, so we need to make some changes to the standard rules.
See also the consent and arousal sections.]

Section - Removing Existing Blocks

The revised can't remove from people rule substitutes for the can't remove from people rule.
Check an actor removing something from (this is the revised can't remove from people rule):
	Let the owner be the holder of the noun;
	If the owner is a person:
		If the owner is the actor, convert to the taking off action on the noun;
		If the noun is a worn garment, try the actor taking the noun instead;
		If the actor is the player:
			Say "[regarding the noun][Those] [seem] to belong to [the owner]." (A);
		Stop the action.

The revised can't take people's possessions rule substitutes for the can't take people's possessions rule.
Check an actor taking (this is the revised can't take people's possessions rule):
	If the noun is a garment and the noun is worn:
		Continue the action;
	Let the local ceiling be the common ancestor of the actor with the noun;
	Let the owner be the not-counting-parts holder of the noun;
	While the owner is not nothing and the owner is not the local ceiling:
		If the owner is a person:
			If the actor is the player:
				Say "[regarding the noun][Those] [seem] to belong to [the owner]." (A);
			Stop the action;
		Let the owner be the not-counting-parts holder of the owner;

Section - Implementing Taking

Check an actor taking a garment (this is the can't take covered items rule):
	Follow the can't take off covered items rule;
	Follow the can't take off in public rule;

The taking garments rule is listed first in the carry out taking rulebook.
Carry out an actor taking a garment (called G) (this is the taking garments rule):
	If G is worn:
		Now the actor carries G;
		If G is shifted, now G is unshifted;
		Update decency for the holder of G;

Part 1.3.4 - Dressing

[Status: Complete
Dressing makes an actor put on the clothes listed in their preferred clothing property, first taking any missing clothing and then stripping naked.]

Dressing is an action applying to nothing.
The specification of the dressing action is "Dressing is the act of putting back on the preferred clothing of a person."

Chapter 1.3.4a - Understanding

Understand "dress", "get dressed" as dressing.

Chapter 1.3.4b - Check

[Make sure that the actor has preferred clothing]
Check an actor dressing (this is the dressing required preferred clothing rule):
	If the preferred clothing of the actor is empty:
		If the actor is the player:
			Say "[We] [have] to be more specific about what to wear." (A);
		If the player can see the actor and the action is not silent:
			Say "[We] [have] to be more specific about what [actor] should wear." (B);
		Stop the action;

[Make sure that all items are carried]
Check an actor dressing (this is the clothing must be available for dressing rule):
	Repeat with cloth running through the preferred clothing of the actor:
		If the actor is not holding cloth:
			If the actor is the player:
				Say "(first taking [the cloth])[command clarification break]" (A);
			Silently try the actor taking the cloth;
			If the actor is not holding the cloth:
				If the actor is the player:
					Say "[We] [can't] equip [the cloth]!" (B);
				Stop the action;

[Make sure that nothing is worn before]
Check an actor dressing (this is the actor must be nude for dressing rule):
	Let clothing be the list of garments worn by actor;
	Sort clothing in reverse clothing layer order;
	Repeat with cloth running through clothing:
		If the actor is the player:
			Say "(first taking off [the cloth])[command clarification break]" (A);
		Silently try the actor taking off the cloth;
	If the actor is wearing a garment:
		If the actor is the player:
			Say "[We] [are] unable to take off [the list of garments worn by the actor] first." (B);
		Stop the action;

Chapter 1.3.4c - Carry Out

Carry out an actor dressing (this is the default dressing rule):
	Let clothing be the preferred clothing of actor;
	Sort clothing in clothing layer order;
	Repeat with cloth running through clothing:
		If the actor is the player:
			Say "(first putting on [the cloth])[command clarification break]" (A);
		Silently try the actor wearing the cloth;

Chapter 1.3.4d - Report

Report an actor dressing (this is the report dressing rule):
	If the player is the actor:
		Say "[We] [put] on [our] clothes." (A);
	If the player can see the actor:
		Say "[The actor] [put] on [our] clothes." (B);

Part 1.3.5 - Stripping

[Status: Complete
Stripping is just as the name implies the act of stripping out of the currently worn clothes.
This is done through recursive calls to take off, in the correct order.]

Stripping is an action applying to nothing or one touchable thing and abbreviable.
The specification of the stripping action is "Stripping is the act of removing all clothing worn. To accomplish this, all garments are first undressed in descending order of layer, before any other wearables are removed."

Chapter 1.3.5a - Understanding

Understand "strip [something]", "undress [something]" as stripping.
Understand "strip", "undress", "get undressed", "disrobe" as stripping.

Rule for supplying a missing noun while stripping (this is the implicit stripping rule):
	Now the noun is the person asked;

Chapter 1.3.5b - Check

Check an actor stripping something (this is the can only strip people rule):
	If the noun is not a person:
		If the player is the actor:
			Say "[We] [can't] find a way to strip [noun]." (A);
		If the player can see the actor and the action is not silent:
			Say "[The actor] [can't] find a way to strip [noun]." (B);
		Stop the action;

Check an actor stripping something (this is the can't strip naked people rule):
	Let clothing be the list of things worn by noun;
	If clothing is empty:
		If the player is the actor:
			Say "[We] [are] already naked!" (A);
		If the player can see the actor and the action is not silent:
			Say "[The noun] [are] already naked." (B);
		Stop the action;

Chapter 1.3.5c - Carry Out

Carry out an actor stripping (this is the default stripping rule):
	Let clothing be the list of garments worn by noun;
	Sort clothing in reverse clothing layer order;
	Repeat with C running through clothing:
		If the actor is the noun:
			Silently try the actor taking off the noun;
		Else:
			Silently try the actor taking the noun;
	If the actor is wearing a garment:
		If the player is the actor:
			Say "[We] [are] unable to do that." (A);
		If the player can see the actor and the action is not silent:
			Say "[The noun] [are] unable to do that." (B);
		Stop the action;

Chapter 1.3.5d - Report

Report an actor stripping (this is the report stripping rule):
	If the actor is not wearing any garments:
		If the player is the actor:
			Say "[We] [take] off all [our] clothes and is now completely naked." (A);
		If the player can see the actor and the actor is the noun:
			Say "[The noun] [take] off all [our] clothes and is now completely naked." (B);
		If the player can see the noun:
			If the player can see the actor:
				Say "[The noun] has all of [our] clothes removed by [the actor], and is now completely naked." (C);
			Else:
				Say "[The noun] has all of [our] clothes removed, and is now completely naked." (D);
	Else:
		Say "This should not have happened; please report this as a bug." (E);

Book 1.4 - Shifting and Ripping

Part 1.4.1 - Shifting

[Status: Complete
This part implements the shifting ability of garments, as detailed in 1.1.2a]

Shifting is an action applying to one touchable thing.
The specification of the shifting action is "Shifting is the act of putting aside a garment in order to gain more favorable access. It is closely related to the shiftyness value of a garment, which indicates what happens when it is shifted, and the unshifting action which reverses the process.

A garment can only be shifted if it's worn, not ripped and not already shifted."

Chapter 1.4.1a - Understanding

Understand "move [unshifted garment]" as shifting.
Understand "shift [unshifted garment]" as shifting.

Understand "unbutton [buttonable garment]" as shifting.
Understand "open [buttonable garment]" as shifting.

Understand "unzip [zipable garment]" as shifting.
Understand "open [zipable garment]" as shifting.

Understand "unfasten [fastenable garment]" as shifting.
Understand "unbuckle [fastenable garment]" as shifting.
Understand "unzip [fastenable garment]" as shifting.
Understand "unbutton [fastenable garment]" as shifting.
Understand "open [fastenable garment]" as shifting.

Understand "pull --/up [raisable garment]" as shifting.
Understand "raise --/up [raisable garment]" as shifting.
Understand "lift --/up [raisable garment]" as shifting.
Understand "hike up [raisable garment]" as shifting.

Understand "pull --/down [lowerable garment]" as shifting.
Understand "lower --/down [lowerable garment]" as shifting.

Does the player mean shifting a shifted garment: It is unlikely.
Does the player mean shifting a unshifted garment: It is likely.

Chapter 1.4.1b - Check

Check an actor shifting (this is the can only shift shifty items rule):
	If the noun provides the property shiftable and the noun is shiftable and the noun provides the property shiftyness:
		continue the action;
	If the actor is the player:
		Say "[We] [can't] find a way to do that to [the noun]." (A);
	Else if the player can see the actor and the action is not silent:
		Say "[The Actor] [can't] find a way to do that to [the noun]." (B);
	Stop the action;

Check an actor shifting (this is the can't shift ripped items rule):
	If the noun provides the property ripped and the noun is ripped:
		If the actor is the player:
			Say "[regarding the noun][They're] too ripped up to [describe shifting of the shiftyness of the noun]." (A);
		If the player can see the actor and the action is not silent:
			Say "[regarding the noun][They're] too ripped up to [describe shifting of the shiftyness of the noun]." (B);
		Stop the action;

Check an actor shifting (this is the can't shift what's already shifted rule):
	If the noun is shifted:
		If the actor is the player:
			Say "[regarding the noun][They're] already [describe shifted of the shiftyness of the noun]." (A);
		If the player can see the actor and the action is not silent:
			Say "[regarding the noun][They're] already [describe shifted of the shiftyness of the noun]." (B);
		Stop the action;

Check an actor shifting (this is the can only shift what's worn rule):
	If the noun does not provide the property wearable or the noun is not worn:
		If the actor is the player:
			Say "[We] [can] only [describe shifting of the shiftyness of the noun] [the noun] when it's worn." (A);
		Else if the player can see the actor and the action is not silent:
			Say "[The Actor] [can] only [describe shifting of the shiftyness of the noun] [the noun] when it's worn." (B);
		Stop the action;

Check an actor shifting (this is the can't shift covered items rule):
	If noun is a garment (called G):
		If G can be shifted:
			Continue the action;
		Let blockers be the preventing shifting of G;
		If the player is the actor:
			Say "[We] [can't] [describe shifting of the shiftyness of the noun] [noun] when it's covered by [blockers]." (A);
		If the player can see the actor and the action is not silent:
			Say "[The actor] [can't] [describe shifting of the shiftyness of the noun] [noun] when it's covered by [blockers]." (B);
		Stop the action;

Check an actor shifting (this is the can't shift in public rule):
	Let L be the location of the actor;
	If noun is a garment (called G):
		If the decency threshold of L is greater than exposed by shifting G:
			If the player is the actor:
				Say "It [are] too public for [us] to do that here." (A);
			Else if the player can see the actor:
				Say "It [are] too public for [the actor] to do that here." (B);
			Stop the action;

Chapter 1.4.1c - Carry Out
		
Carry out an actor shifting (this is the standard shifting rule):
	Now the noun is shifted;
	Update decency for holder of noun;

Chapter 1.4.1d - Report

Report an actor shifting (this is the standard report shifting rule):
	If the noun is a garment:
		Let exposed be the revealed by shifting the noun;
		If the actor is the player:
			Say "[We] [the describe shifting of the shiftyness of the noun] [the noun], revealing [exposed]." (A);
		Else if the player can see the actor:
			Say "[The actor] [the describe shifting of the shiftyness of the noun] [the noun], revealing [exposed]." (B);
		Else if the player can see the noun:
			Say "[The noun] [are] [the describe shifting of the shiftyness of the noun], revealing [exposed]." (C);
	Else:
		If the actor is the player:
			Say "[We] [the describe shifting of the shiftyness of the noun] [the noun]." (D);
		Else if the player can see the actor:
			Say "[The actor] [the describe shifting of the shiftyness of the noun] [the noun]." (E);
		Else if the player can see the noun:
			Say "[The noun] [are] [the describe shifting of the shiftyness of the noun]." (F);
	
Part 1.4.2 - Unshifting

[Status: Complete
This part implements the shifting ability of garments, as detailed in 1.1.2a]

Unshifting is an action applying to one touchable thing.
The specification of the Unshifting action is "Shifting is the act of putting back a garment that has been put aside in order to gain more favorable access. It is closely related to the shiftyness value of a garment, which indicates what happens when it is shifted, and the shifting action which starts the process.

A garment can only be unshifted if it's already shifted, and should be automatically unshifted when unworn or ripped."

Chapter 1.4.2a - Understanding

Understand "move [shifted garment]" as unshifting.
Understand "shift [shifted garment]" as unshifting.
Understand "unshift [shifted garment]" as unshifting.

Understand "button --/up [buttonable garment]" as unshifting.
Understand "close --/up [buttonable garment]" as unshifting.

Understand "zip --/up [zipable garment]" as unshifting.
Understand "close --/up [zipable garment]" as unshifting.

Understand "fasten [fastenable garment]" as unshifting.
Understand "buckle --/up [fastenable garment]" as unshifting.
Understand "zip --/up [fastenable garment]" as unshifting.
Understand "button --/up [fastenable garment]" as unshifting.
Understand "close --/up [fastenable garment]" as unshifting.

Understand "pull --/down [raisable garment]" as unshifting.
Understand "lower --/down [raisable garment]" as unshifting.

Understand "pull --/up [lowerable garment]" as unshifting.
Understand "raise --/up [lowerable garment]" as unshifting.
Understand "lift --/up [lowerable garment]" as unshifting.
Understand "hike up [lowerable garment]" as unshifting.

Does the player mean shifting a shifted garment: It is likely.
Does the player mean shifting a unshifted garment: It is unlikely.

Chapter 1.4.2b - Check

Check an actor unshifting (this is the can only unshift shifty items rule):
	If the noun provides the property shiftable and the noun is shiftable and the noun provides the property shiftyness:
		continue the action;
	If the actor is the player:
		Say "[We] [can't] find a way to do that to [the noun]." (A);
	Else if the player can see the actor and the action is not silent:
		Say "[The Actor] [can't] find a way to do that to [the noun]." (B);
	Stop the action;

Check an actor shifting (this is the can only unshift what's already shifted rule):
	If the noun is not shifted:
		If the actor is the player:
			Say "[regarding the noun][They're] already [describe unshifted of the shiftyness of the noun]." (A);
		If the player can see the actor and the action is not silent:
			Say "[regarding the noun][They're] already [describe unshifted of the shiftyness of the noun]." (B);
		Stop the action;

Check an actor shifting (this is the can't unshift covered items rule):
	If noun is a garment (called G):
		If G can be shifted:
			Continue the action;
		Let blockers be the preventing shifting of G;
		If the player is the actor:
			Say "[We] [can't] [describe shifting of the shiftyness of the noun] [noun] when it's covered by [blockers]." (A);
		If the player can see the actor and the action is not silent:
			Say "[The actor] [can't] [describe shifting of the shiftyness of the noun] [noun] when it's covered by [blockers]." (B);
		Stop the action;

Chapter 1.4.2c - Carry Out
		
Carry out an actor unshifting (this is the standard unshifting rule):
	Now the noun is unshifted;
	Update decency for the holder of noun;

Chapter 1.4.2d - Report

Report an actor unshifting (this is the standard report unshifting rule):
	If the actor is the player:
		Say "[We] [the describe unshifting of the shiftyness of the noun] [the noun]." (A);
	Else if the player can see the actor:
		say "[The actor] [the describe unshifting of the shiftyness of the noun] [the noun]." (B);

Part 1.4.3 - Ripping

[Status: Complete
This part implements the ripping ability of garments, as detailed in 1.1.2a]

Ripping is an action applying to one touchable thing.
The specification of the ripping action is "Ripping is the act of tearing a piece of garment apart. A ripped garment can no longer be shifted, but it can be worn."

Chapter 1.4.2a - Understanding

Understand "rip --/open/off/up [garment]" as ripping.
Understand "tear --/open/off/up [garment]" as ripping.

Chapter 1.4.2b - Check

Check an actor ripping (this is the can't rip covered items rule):
	If noun is a garment (called G):
		If G can be ripped:
			Continue the action;
		Let blockers be the preventing ripping of G;
		If the player is the actor:
			Say "[We] [can't] [rip] apart [noun] when it's covered by [blockers]." (A);
		If the player can see the actor and the action is not silent:
			Say "[The actor] [can't] [rip] apart [noun] when it's covered by [blockers]." (B);
		Stop the action;

Check an actor ripping (this is the can only rip rippable items rule):
	If the noun provides the property rippable and the noun is rippable:
		continue the action;
	If the actor is the player:
		Say "[regarding the noun][They're] [are] too strong to rip apart." (A);
	Else if the player can see the actor and the action is not silent:
		Say "[regarding the noun][They're] [are] too strong to rip apart." (B);
	Stop the action;

Check an actor shifting (this is the can only rip once rule):
	If the noun is ripped:
		If the actor is the player:
			Say "[regarding the noun][They're] already ripped apart." (A);
		If the player can see the actor and the action is not silent:
			Say "[regarding the noun][They're] already ripped apart." (B);
		Stop the action;

Check an actor ripping (this is the can't rip in public rule):
	Let L be the location of the actor;
	If noun is a garment (called G):
		If the decency threshold of L is greater than exposed by ripping G:
			If the player is the actor:
				Say "It [are] too public for [us] to do that here." (A);
			Else if the player can see the actor:
				Say "It [are] too public for [the actor] to do that here." (B);
			Stop the action;

Chapter 1.4.2c - Carry Out

Carry out an actor ripping (this is the standard ripping rule):
	If the noun provides the property ripped, now the noun is ripped;
	Update decency for the holder of noun;

Carry out an actor ripping (this is the ripping replaces shifting rule):
	If the noun provides the property shifted and the noun is shifted, now the noun is unshifted;

Chapter 1.4.2d - Report

Report an actor ripping (this is the standard report ripping rule):
	If the noun is a garment:
		Let exposed be the revealed by shifting the noun;
		If the actor is the player:
			Say "[We] [rip] apart [the noun], revealing [exposed]." (A);
		Else if the player can see the actor:
			Say "[The actor] [rip] apart [the noun], revealing [exposed]." (B);
		Else if the player can see the noun:
			Say "[The noun] [are] ripped apart, revealing [exposed]." (C);
	Else:
		If the actor is the player:
			Say "[We] [rip] apart [the noun]." (D);
		Else if the player can see the actor:
			Say "[The actor] [the describe shifting of the shiftyness of the noun] [the noun]." (E);
		Else if the player can see the noun:
			Say "[The noun] [are] ripped apart." (F);

Volume 2 - Actors

Book 2.1 - Describing

[This part deals with describing both the player and other actors.]
Report examining someone: say "[The noun] is [if the noun is wearing something]wearing [a list of unconcealed things worn by the noun] and [end if]carrying [a list of unconcealed things carried by the noun]."

Part 2.1.1 - Examining People

[NOTE: List of text we want printed:
	Introduction - activity
	Regular description (who it is, etc)
	Describe body parts and garments
	List visible things carried, not worn
	
]

[The examining people rule is listed after the standard examining rule in the carry out examining rulebook.
Carry out an actor examining (this is the examining people rule):
	If noun is a person:
		Let clothing be the list of garments worn by the noun;]
[		If noun provides the property visible description and the visible description of the noun is not the default value of text:
				Say "[visible description of the noun][line break]";
				Now examine text printed is true;]








Book 2.3 - Responsiveness

Part 2.2.2 - Remembering Past Actions

[
Lovers
Current Lover
Current Action
]


Book 2.3 - Conversation




Volume 3 - Erotic Actions

Book 3.1 - Concepts

Part 3.1.1 - Stimulation

Chapter 3.1.1a - Stimulation Rulebook

[Stimulation is a rulebook that deals with altering the arousal of participants in erotic actions.
We create a new rulebook, with outcomes stimulated and unstimulated, and defaulting to being stimulated. Because of the default value, rules will not fall though to the next case unless explicitly told to make no decision. This allows us to populate the rulebook with default rules.]

The stimulation rules is a rulebook.
The stimulation rules have outcomes stimulated (success) and unstimulated (failure).
The stimulation rules have default success.

Part 3.1.2 - Consent

Chapter 3.1.2a - Consent Rulebook

[We use a rulebook to gain consent for actions, as well as a text result when consent is denied.
In order for the consent rulebook to produce error messages, we have to turn the logic inside out, as only successes can give results.]
The consent rules is a rulebook producing text.
The consent rules have outcomes give consent (failure) and deny consent (success).
The consent rules have default failure.

[This default consent rule is as generic as possible, and will be executed last.]
A consent rule (this is the default consent rule):
	[Check consent for the actor first; we assume that the player always consent.]
	If the actor is not the player:
		Rule succeeds with result "[The actor] [aren't] consenting to that ([current action])." (A);
	[Check consent for the noun directly]
	If the noun is a person:
		If the noun is not the player:
			Rule succeeds with result "[The noun] [aren't] consenting to that ([current action])." (B);
	Else if the noun is a body part:
		Let P be the holder of the noun;
		If P is not the player:
			Rule succeeds with result "[The P] [aren't] consenting to that ([current action])." (C);

Part 3.1.3 - Properties

Chapter 3.1.3a - Action Control Properties

[The following properties are specified to control which things the correspondingly named action is applicable to.
These can be applied to other things than body part if wanted, and access to garments are supported.]

A body part can be touchable or untouchable. A body part is usually untouchable.
A body part can be rubbable or unrubbable. A body part is usually unrubbable.
A body part can be tickleable or untickleable. A body part is usually untickleable.
A body part can be spankable or unspankable. A body part is usually unspankable.
A body part can be pinchable or unpinchable. A body part is usually unpinchable.
A body part can be lickable or unlickable. A body part is usually unlickable.
A body part can be biteable or unbiteable. A body part is usually unbiteable.

Chapter 3.1.3b - Sexual Properties

A body part can be penetrating. A body part is usually not penetrating.
A body part can be orificial. A body part is usually not orificial.

Part 3.1.4 - Body Part Patterns

Chapter 3.1.4a - Erectable

[A body part has a an arousal called the erection threshold.
Definition: A thing is erectable if it provides the property erection threshold and the erection threshold is not the default value of number.
Definition: A body part is erect if it provides the property erection threshold and the erection threshold is not greater than the arousal of the holder of the body part.]

Book 3.2 - Body Part Actions

[These are the actions that target body parts; attempts to target a player are either redirected or blocked.]

Part 3.2.1 - Touching

[Status: Complete; Consent and stimulation defered to later chapter
Touching is already covered in the Standard Rules, but it doesn't do much. We add some checks for touching people and body parts, and because we don't allow touching people directly we can keep the standard reports.]

The specification of the touching action is "Touching is just that, touching something without applying pressure: a touch-sensitive screen or a living creature might react, but a standard push-button or lever will probably not.
In the Standard Rules there are no check touching rules, since touchability is already a requirement of the noun for the action anyway, and no carry out rules because nothing in the standard Inform world model reacts to a mere touch - though report rules do mean that attempts to touch other people provoke a special reply.
In Erotic Storytelling however, touching is 'passive' touching where the player softly feels the target, while the related rubbing action is 'active' touching where the player actively massages the target."

Chapter 3.2.1a - Understanding

Understand "caress [something]" and "feel [something]" as touching.

Does the player mean touching a body part: It is likely.
Does the player mean touching a person: It is unlikely.
Does the player mean touching the player: It is very unlikely.
Does the player mean touching something that is part of the player: It is very unlikely.

The touching decency is initially immodest.

Chapter 3.2.1b - Check

Check an actor touching (this is the touching specificity rule):
	If the noun is a person:
		If the actor is the player:
			Say "[We] [have] to be more specific about what to touch." (A);
		Else if the player can see the actor and the action is not silent:
			Say "[We] [have] to be more specific about what [the actor] should touch." (B);
		Stop the action;

Check an actor touching (This is the control what can be touched rule):
	If the noun is a body part or noun is a garment: [We don't want to block "normal" things here]
		If the noun provides the property touchable and the noun is touchable:
			Continue the action;
		Else:
			If the actor is the player:
				Say "[We] [can't] touch that." (A);
			Else if the player can see the actor and the action is not silent:
				Say "[The actor] [can't] touch that." (B);
			Stop the action;

Check an actor touching (this is the touching reachability rule):
	If the noun is a body part or noun is a garment:
		If noun can be touched:
			Continue the action;
		Else:
			If the player is the actor:
				Say "[We] [can't] reach that." (A);
			Else if the player can see the actor:
				Say "[The actor] [can't] reach that." (B);
			Stop the action;

Check an actor touching (this is the touching decency rule):
	Let L be the location of the actor;
	If the noun is enclosed by a person:
		If the decency threshold of L is greater than the touching decency:
			If the player is the actor:
				Say "It [are] too public for [us] to touch that here." (A);
			Else if the player can see the actor:
				Say "It [are] too public for [the actor] to touch that here." (B);
			Stop the action;

Check an actor touching (this is the seek consent for touching rule):
	If the noun is a person or noun is enclosed by a person:
		Let result be the text produced by the consent rules;
		If the rule failed:
			Say result;
			Stop the action;

Chapter 3.2.1c - Carry Out

Carry out an actor touching (this is the seek stimulation for touching rule):
	If the noun is a person or noun is enclosed by a person:
		Follow the stimulation rules;

Part 3.2.2 - Rubbing

[Status: Complete; Consent and stimulation defered to later chapter
Rubbing is already covered in the Standard Rules, but it's disabled by default. We add some checks for rubbing people and body parts, and we can keep the standard reports.]

The specification of the rubbing action is "The Standard Rules define this action in only a minimal way, blocking it with a check rule which stops it in all cases. It exists so that before or instead rules can be written to make it do interesting things in special cases. (Or to reconstruct the action as something more substantial, unlist the block rule and supply carry out and report rules, together perhaps with some further check rules.)
For Erotic Story Actions, rubbing is intended for when the actor uses their hands to rub something (as opposed to the softer touch action), and reponds to commands like RUB ANNA, MASSAGE ANNA'S BREASTS, etc. It only works only body parts that are set to rubbable."

Chapter 3.2.2a - Understanding

Understand "massage [something]", "rub [something]", "fondle [something]" as rubbing. 

Does the player mean rubbing a body part: It is likely.
Does the player mean rubbing a person: It is unlikely.
Does the player mean rubbing the player: It is very unlikely.
Does the player mean rubbing something that is part of the player: It is very unlikely.

The rubbing decency is initially immodest.

Chapter 3.2.2b - Check

The rubbing specificity rule is listed instead of the can't rub another person rule in the check rubbing rulebook.
Check an actor rubbing (this is the rubbing specificity rule):
	If the noun is a person:
		If the actor is the player:
			Say "[We] [have] to be more specific about what to rub." (A);
		Else if the player can see the actor and the action is not silent:
			Say "[We] [have] to be more specific about what [the actor] should rub." (B);
		Stop the action;

Check an actor rubbing (This is the control what can be rubbed rule):
	If the noun is a body part or noun is a garment:
		If the noun provides the property rubbable and the noun is rubbable:
			Continue the action;
		Else:
			If the actor is the player:
				Say "[We] [can't] rub that." (A);
			Else if the player can see the actor and the action is not silent:
				Say "[The actor] [can't] rub that." (B);
			Stop the action;

Check an actor rubbing (this is the rubbing reachability rule):
	If the noun is a body part or noun is a garment:
		If noun can be touched:
			Continue the action;
		Else:
			If the player is the actor:
				Say "[We] [can't] reach that." (A);
			Else if the player can see the actor:
				Say "[The actor] [can't] reach that." (B);
			Stop the action;

Check an actor rubbing (this is the rubbing decency rule):
	Let L be the location of the actor;
	If the noun is enclosed by a person:
		If the decency threshold of L is greater than the rubbing decency:
			If the player is the actor:
				Say "It [are] too public for [us] to rub that here." (A);
			Else if the player can see the actor:
				Say "It [are] too public for [the actor] to rub that here." (B);
			Stop the action;

Check an actor rubbing (this is the seek consent for rubbing rule):
	If the noun is a person or noun is enclosed by a person:
		Let result be the text produced by the consent rules;
		If the rule failed:
			Say result;
			Stop the action;

Chapter 3.2.2c - Carry Out

Carry out an actor rubbing (this is the seek stimulation for rubbing rule):
	If the noun is a person or noun is enclosed by a person:
		Follow the stimulation rules;

Part 3.2.3 - Tickling

[Status: Complete; Consent and stimulation defered to later chapter
Tickling is a new action. It takes into account that only other people's body parts can be tickled, decency and consent/arousal, and handle reporting.]

Tickling is an action applying to one touchable thing.
The specification of the tickling action is "Tease another person by tickling their body parts."

Chapter 3.2.3a - Understanding

Understand "tickle [something]" as tickling. 

Does the player mean tickling something tickleable: It is very likely.
Does the player mean tickling the player: It is very unlikely.
Does the player mean tickling something that is part of the player: It is very unlikely.

The tickling decency is initially immodest.

Chapter 3.2.3b - Check

Check an actor tickling (this is the self tickling rule):
	If the noun is the actor or the noun is enclosed by the actor:
		If the actor is the player:
			say "[We] [don't] get much from that." (A);
		Else if the player can see the actor and the action is not silent:
			Say "[The actor] [don't] get much from that." (B);
		Stop the action;

Check an actor tickling (This is the tickling specificity rule):
	If the noun is a person:
		If the actor is the player:
			Say "[We] [have] to be more specific about what to tickle." (A);
		Else if the player can see the actor and the action is not silent:
			Say "[We] [have] to be more specific about what [the actor] should tickle." (B);
		Stop the action;

Check an actor tickling (This is the control what can be tickled rule):
	If the noun provides the property tickleable and the noun is tickleable:
		Continue the action;
	Else:
		If the actor is the player:
			Say "[We] [can't] tickle that." (A);
		Else if the player can see the actor and the action is not silent:
			Say "[The actor] [can't] tickle that." (B);
		Stop the action;

Check an actor tickling (this is the tickling reachability rule):
	If the noun is a body part or noun is a garment:
		If noun is touchable:
			Continue the action;
		Else:
			If the player is the actor:
				Say "[We] [can't] reach that." (A);
			Else if the player can see the actor:
				Say "[The actor] [can't] reach that." (B);
			Stop the action;

Check an actor tickling (this is the tickling decency rule):
	Let L be the location of the actor;
	If the decency threshold of L is greater than the tickling decency:
		If the player is the actor:
			Say "It [are] too public for [us] to tickle [noun] here." (A);
		Else if the player can see the actor:
			Say "It [are] too public for [the actor] to tickle [noun] here." (B);
		Stop the action;

Check an actor tickling (this is the seek consent for tickling rule):
	If the noun is a person or noun is enclosed by a person:
		Let result be the text produced by the consent rules;
		If the rule failed:
			Say result;
			Stop the action;

Chapter 3.2.3c - Carry Out

Carry out an actor tickling (this is the seek stimulation for tickling rule):
	If the noun is a person or noun is enclosed by a person:
		Follow the stimulation rules;

Chapter 3.2.3d - Reporting

[Default response]
Report an actor tickling (this is the report tickling rule):
	If the player is the actor:
		Say "[We] [tickle] [the noun]." (A);
	Else if the player can see the actor:
		Say "[The actor] [tickle] [the noun]" (B);
	Else if the player can see the noun:
		Say "[The actor] [are] tickled." (C);

Part 3.2.4 - Slapping/Spanking

[Status: Complete; Consent and stimulation defered to later chapter
Spanking is a new action. It takes into account that other people's body parts can be spanked, decency and consent/arousal, and handle reporting. Unlike other new actions, we will allow self-spanking.]

Spanking is an action applying to one touchable thing.
The specification of the spanking action is "Spanking is the act of hitting or slapping a person's body parts. Attempts to spank a person will redirect to the rear end."

Chapter 3.2.4a - Understanding

Understand "spank [something]", "slap [something]", "smash [something]", "hit [something]", "punch [something]" and "thump [something]" as spanking.

Does the player mean spanking something spankable: It is very likely.
Does the player mean spanking the player: It is very unlikely.
Does the player mean spanking something that is part of the player: It is very unlikely.

The spanking decency is initially indecent.

Chapter 3.2.4b - Check

Check an actor spanking (This is the spanking specificity rule):
	If the noun is a person:
		If the actor is the player:
			Say "[We] [have] to be more specific about what to tickle." (A);
		Else if the player can see the actor and the action is not silent:
			Say "[We] [have] to be more specific about what [the actor] should tickle." (B);
		Stop the action;

Check an actor spanking (This is the control what can be spanked rule):
	If the noun provides the property spankable and the noun is spankable:
		Continue the action;
	Else:
		If the actor is the player:
			Say "[We] [can't] spank that." (A);
		Else if the player can see the actor and the action is not silent:
			Say "[The actor] [can't] spank that." (B);
		Stop the action;

Check an actor spanking (this is the spanking reachability rule):
	If the noun is a body part or the noun is a garment:
		If noun is touchable:
			Continue the action;
		Else:
			If the player is the actor:
				Say "[We] [can't] reach that." (A);
			Else if the player can see the actor:
				Say "[The actor] [can't] reach that." (B);
			Stop the action;

Check an actor spanking (this is the spanking decency rule):
	Let L be the location of the actor;
	If the decency threshold of L is greater than the spanking decency:
		If the player is the actor:
			Say "It [are] too public for [us] to spank [noun] here." (A);
		Else if the player can see the actor:
			Say "It [are] too public for [the actor] to spank [noun] here." (B);
		Stop the action;

Check an actor spanking (this is the seek consent for spanking rule):
	If the noun is a person or noun is enclosed by a person:
		Let result be the text produced by the consent rules;
		If the rule failed:
			Say result;
			Stop the action;

Chapter 3.2.4c - Carry Out

Carry out an actor spanking (this is the seek stimulation for spanking rule):
	If the noun is a person or noun is enclosed by a person:
		Follow the stimulation rules;

Chapter 3.2.4d - Reporting

[Default response]
Report an actor spanking (this is the report spanking rule):
	If the player is the actor:
		Say "[We] [spank] [the noun]." (A);
	Else if the player can see the actor:
		Say "[The actor] [spank] [the noun]" (B);
	Else if the player can see the noun:
		Say "[The actor] [are] spanked." (C);

Part 3.2.5 - Pinching

[Status: Complete; Consent and stimulation defered to later chapter
Pinching is a new action. It takes into account that only other people's body parts can be pinched, decency and consent/arousal, and handle reporting.]

Pinching is an action applying to one touchable thing.
The specification of the pinching action is "Tease another person by pinching their body parts."

Chapter 3.2.5a - Understanding

Understand "pinch [something]", "squeeze [something]" as pinching. 

Does the player mean pinching something pinchable: It is very likely.
Does the player mean pinching the player: It is very unlikely.
Does the player mean pinching something that is part of the player: It is very unlikely.

The pinching decency is initially immodest.

Chapter 3.2.5b - Check

Check an actor pinching (this is the self pinching rule):
	If the noun is the actor or the noun is enclosed by the actor:
		If the actor is the player:
			say "[We] [don't] get much from that." (A);
		Else if the player can see the actor and the action is not silent:
			Say "[The actor] [don't] get much from that." (B);
		Stop the action;

Check an actor pinching (This is the pinching specificity rule):
	If the noun is a person:
		If the actor is the player:
			Say "[We] [have] to be more specific about what to pinch." (A);
		Else if the player can see the actor and the action is not silent:
			Say "[We] [have] to be more specific about what [the actor] should pinch." (B);
		Stop the action;

Check an actor pinching (This is the control what can be pinched rule):
	If the noun provides the property pinchable and the noun is pinchable:
		Continue the action;
	Else:
		If the actor is the player:
			Say "[We] [can't] pinch that." (A);
		Else if the player can see the actor and the action is not silent:
			Say "[The actor] [can't] pinch that." (B);
		Stop the action;

Check an actor pinching (this is the pinching reachability rule):
	If the noun is a body part or noun is a garment:
		If noun is touchable:
			Continue the action;
		Else:
			If the player is the actor:
				Say "[We] [can't] reach that." (A);
			Else if the player can see the actor:
				Say "[The actor] [can't] reach that." (B);
			Stop the action;

Check an actor pinching (this is the pinching decency rule):
	Let L be the location of the actor;
	If the decency threshold of L is greater than the pinching decency:
		If the player is the actor:
			Say "It [are] too public for [us] to pinch [noun] here." (A);
		Else if the player can see the actor:
			Say "It [are] too public for [the actor] to pinch [noun] here." (B);
		Stop the action;
		
Check an actor pinching (this is the seek consent for pinching rule):
	If the noun is a person or noun is enclosed by a person:
		Let result be the text produced by the consent rules;
		If the rule failed:
			Say result;
			Stop the action;

Chapter 3.2.5c - Carry Out

Carry out an actor pinching (this is the seek stimulation for pinching rule):
	If the noun is a person or noun is enclosed by a person:
		Follow the stimulation rules;

Chapter 3.2.5d - Reporting

[Default response]
Report an actor pinching (this is the report pinching rule):
	If the player is the actor:
		Say "[We] [pinch] [the noun]." (A);
	Else if the player can see the actor:
		Say "[The actor] [pinch] [the noun]" (B);
	Else if the player can see the noun:
		Say "[The actor] [are] pinched." (C);

Part 3.2.6 - Licking

[Status: Complete; Consent and stimulation defered to later chapter
Licking is a new action, used only on body parts but attempts to redirect from persons. It handles decency, access.]

Licking is an action applying to one touchable thing.
The specification of the licking action is "This action is intended for when the actor uses their mouth on a body part. Trying to lick a person will try to find a better part of that person to lick."

Chapter 3.2.6a - Understanding

Understand "lick [something]" and "suck [something]" as licking. 

Does the player mean licking something lickable: It is very likely.
Does the player mean licking a person: It is likely.
Does the player mean licking the player: It is very unlikely.
Does the player mean licking something that is part of the player: It is very unlikely.

The licking decency is initially immodest.

Chapter 3.2.6b - Check

Check an actor licking (this is the self licking rule):
	If the noun is the actor or the noun is enclosed by the actor:
		If the actor is the player:
			say "[We] [don't] get much from that." (A);
		Else if the player can see the actor and the action is not silent:
			Say "[The actor] [don't] get much from that." (B);
		Stop the action;

Check an actor licking (This is the licking specificity rule):
	If the noun is a person:
		If the noun is enclosing a vagina (called target):
			Try the actor licking the target instead;
		Else if the noun is enclosing a penis (called target):
			Try the actor licking the target instead;
		Else:
			If the actor is the player:
				Say "[We] [have] to be more specific about what to lick." (A);
			Else if the player can see the actor and the action is not silent:
				Say "[We] [have] to be more specific about what [the actor] should lick." (B);
			Stop the action;

Check an actor licking (This is the control what can be licked rule):
	If the noun provides the property lickable and the noun is lickable:
		Continue the action;
	Else:
		If the actor is the player:
			Say "[We] [can't] lick that." (A);
		Else if the player can see the actor and the action is not silent:
			Say "[The actor] [can't] lick that." (B);
		Stop the action;

Check an actor licking (this is the licking reachability rule):
	If the noun is a body part or the noun is a garment:
		If noun is accessible:
			Continue the action;
		Else:
			If the player is the actor:
				Say "[We] [can't] reach that." (A);
			Else if the player can see the actor:
				Say "[The actor] [can't] reach that." (B);
			Stop the action;

Check an actor licking (this is the licking decency rule):
	Let L be the location of the actor;
	If the decency threshold of L is greater than the licking decency:
		If the player is the actor:
			Say "It [are] too public for [us] to lick [noun] here." (A);
		Else if the player can see the actor:
			Say "It [are] too public for [the actor] to lick [noun] here." (B);
		Stop the action;

Check an actor licking (this is the seek consent for licking rule):
	If the noun is a person or noun is enclosed by a person:
		Let result be the text produced by the consent rules;
		If the rule failed:
			Say result;
			Stop the action;

Chapter 3.2.6c - Carry Out

Carry out an actor licking (this is the seek stimulation for licking rule):
	If the noun is a person or noun is enclosed by a person:
		Follow the stimulation rules;

Chapter 3.2.6d - Reporting

[Default response]
Report an actor licking (this is the report licking rule):
	If the player is the actor:
		Say "[We] [lick] [the noun]." (A);
	Else if the player can see the actor:
		Say "[The actor] [lick] [the noun]" (B);
	Else if the player can see the noun:
		Say "[The actor] [are] licked." (C);

Part 3.2.7 - Biting

[Status: Complete; Consent and stimulation defered to later chapter
Biting is a new action, used only on body parts, but attempts to bit something edible is eating. It handles decency, access.]

Biting is an action applying to one touchable thing.
The specification of the biting action is "This action is intended for when the actor bites on something. Attempts to bite something edible redirects to eating."

Chapter 3.2.7a - Understanding

Understand "bite [something]", "gnaw [something]" and "chomp [something]" as biting. 

Does the player mean biting something biteable: It is very likely.
Does the player mean biting the player: It is very unlikely.
Does the player mean biting something that is part of the player: It is very unlikely.

The biting decency is initially indecent.

Chapter 3.2.7b - Check

Check an actor biting (this is the self biting rule):
	If the noun is the actor or the noun is enclosed by the actor:
		If the actor is the player:
			say "[We] [don't] get much from that." (A);
		Else if the player can see the actor and the action is not silent:
			Say "[The actor] [don't] get much from that." (B);
		Stop the action;

Check an actor biting (This is the biting specificity rule):
	If the noun is edible:
		Try the actor eating the noun instead;
	Else if the noun is a person:
		If the actor is the player:
			Say "[We] [have] to be more specific about what to bite." (A);
		Else if the player can see the actor and the action is not silent:
			Say "[We] [have] to be more specific about what [the actor] should bite." (B);
		Stop the action;

Check an actor biting (This is the control what can be bitten rule):
	If the noun provides the property biteable and the noun is biteable:
		Continue the action;
	Else:
		If the actor is the player:
			Say "[We] [can't] bite that." (A);
		Else if the player can see the actor and the action is not silent:
			Say "[The actor] [can't] bite that." (B);
		Stop the action;

Check an actor biting (this is the biting reachability rule):
	If the noun is a body part or noun is a garment:
		If noun is accessible:
			Continue the action;
		Else:
			If the player is the actor:
				Say "[We] [can't] reach that." (A);
			Else if the player can see the actor:
				Say "[The actor] [can't] reach that." (B);
			Stop the action;

Check an actor biting (this is the biting decency rule):
	Let L be the location of the actor;
	If the decency threshold of L is greater than the biting decency:
		If the player is the actor:
			Say "It [are] too public for [us] to bite [noun] here." (A);
		Else if the player can see the actor:
			Say "It [are] too public for [the actor] to bite [noun] here." (B);
		Stop the action;

Check an actor biting (this is the seek consent for biting rule):
	If the noun is a person or noun is enclosed by a person:
		Let result be the text produced by the consent rules;
		If the rule failed:
			Say result;
			Stop the action;

Chapter 3.2.7c - Carry Out

Carry out an actor biting (this is the seek stimulation for biting rule):
	If the noun is a person or noun is enclosed by a person:
		Follow the stimulation rules;

Chapter 3.2.7d - Reporting

[Default response]
Report an actor biting (this is the report biting rule):
	If the player is the actor:
		Say "[We] [bite] [the noun]." (A);
	Else if the player can see the actor:
		Say "[The actor] [bite] [the noun]" (B);
	Else if the player can see the noun:
		Say "[The actor] [are] bitten." (C);

Part 3.2.8 - Fucking It With

[TODO]

Book 3.3 - Person Actions

[These actions only take another person as the noun, but some redirect if used on body parts.]

Part 3.3.1 - Kissing

[Status: Complete; Consent and stimulation defered to later chapter
Kissing is already covered in the Standard Rules, but it's disabled by default.
We replace the blocks with our own checks, taking into account that only other people can be kissed, decency and consent/arousal, and handle action reporting.]

The specification of the kissing action is "Possibly because Inform was originally written by an Englishman, attempts at kissing another person are normally blocked as being unrealistic or not seriously meant. So the Standard Rules simply block attempts to kiss people, but the action exists for rules to make exceptions.
Erotic Storytelling replaces the existing checks that block kissing, replacing them with checks to see that only other people can be kissed, and attempts to kiss body parts are redirected to licking that part."

Chapter 3.3.1a - Understanding

Understand "kiss [body part]" as kissing.

Does the player mean kissing a person: It is likely.
Does the player mean kissing the player: It is very unlikely.
Does the player mean kissing something that is part of the player: It is very unlikely.

The kissing decency is initially casual.

Chapter 3.3.1b - Check

The self kissing rule is listed instead of the kissing yourself rule in the check kissing rulebook.
Check an actor kissing (this is the self kissing rule):
	If the noun is the actor:
		If the actor is the player:
			say "[We] [don't] get much from that." (A);
		Else if the player can see the actor and the action is not silent:
			Say "[The actor] [don't] get much from that." (B);
		Stop the action;

The control kissed target rule is listed instead of the block kissing rule in the check kissing rulebook.
Check an actor kissing (This is the control kissed target rule):
	If the noun is a body part:
		Try the actor licking the noun instead;
	Else if the noun is not a person:
		If the actor is the player:
			Say "[We] [don't] want to kiss that." (A);
		Else if the player can see the actor and the action is not silent:
			Say "[The actor] [don't] want to kiss that." (B);
		Stop the action;

Check an actor kissing (this is the kissing decency rule):
	Let L be the location of the actor;
	If the decency threshold of L is greater than the kissing decency:
		If the player is the actor:
			Say "It [are] too public for [us] to kiss here." (A);
		Else if the player can see the actor:
			Say "It [are] too public for [the actor] to kiss here." (B);
		Stop the action;

Check an actor kissing (this is the seek consent for kissing rule):
	If the noun is a person or noun is enclosed by a person:
		Let result be the text produced by the consent rules;
		If the rule failed:
			Say result;
			Stop the action;

Chapter 3.3.1c - Carry Out

Carry out an actor kissing (this is the seek stimulation for kissing rule):
	If the noun is a person or noun is enclosed by a person:
		Follow the stimulation rules;

Chapter 3.3.1d - Reporting

[Default response]
Report an actor kissing (this is the report kissing rule):
	If the player is the actor:
		Say "[We] [kiss] [the noun]." (A);
	Else if the player can see the actor:
		Say "[The actor] [kiss] [the noun]" (B);
	Else if the player can see the noun:
		Say "[The actor] [are] kissed." (C);

Part 3.3.2 - Hugging

[Status: Complete; Consent and stimulation defered to later chapter
Hugging is a new action. It takes into account that only other people can be hugged, decency and consent/arousal, and handle reporting.]

Hugging is an action applying to one touchable thing.
The specification of the hugging action is "Shows affection to another person by giving them a hug. Only other people can be hugged, hugging a body part redirects to touching."

Chapter 3.3.2a - Understanding

Understand "hug [something]" as hugging.

Does the player mean hugging a person: It is likely.
Does the player mean hugging the player: It is very unlikely.
Does the player mean hugging something that is part of the player: It is very unlikely.

The hugging decency is initially formal.

Chapter 3.3.2b - Check

Check an actor hugging (this is the self hugging rule):
	If the noun is the actor:
		If the actor is the player:
			say "[We] [don't] get much from that." (A);
		Else if the player can see the actor and the action is not silent:
			Say "[The actor] [don't] get much from that." (B);
		Stop the action;

Check an actor hugging (This is the control what can be hugged rule):
	If the noun is a body part:
		Try the actor touching the noun instead;
	Else if the noun is not a person:
		If the actor is the player:
			Say "[We] [don't] want to hug that." (A);
		Else if the player can see the actor and the action is not silent:
			Say "[The actor] [don't] want to hug that." (B);
		Stop the action;

Check an actor hugging (this is the hugging decency rule):
	Let L be the location of the actor;
	If the decency threshold of L is greater than the hugging decency:
		If the player is the actor:
			Say "It [are] too public for [us] to kiss here." (A);
		Else if the player can see the actor:
			Say "It [are] too public for [the actor] to kiss here." (B);
		Stop the action;

Check an actor hugging (this is the seek consent for hugging rule):
	If the noun is a person or noun is enclosed by a person:
		Let result be the text produced by the consent rules;
		If the rule failed:
			Say result;
			Stop the action;

Chapter 3.3.2c - Carry Out

Carry out an actor hugging (this is the seek stimulation for hugging rule):
	If the noun is a person or noun is enclosed by a person:
		Follow the stimulation rules;

Chapter 3.3.2d - Reporting

[Default response]
Report an actor hugging (this is the report hugging rule):
	If the player is the actor:
		Say "[We] [hug] [the noun]." (A);
	Else if the player can see the actor:
		Say "[The actor] [hug] [the noun]" (B);
	Else if the player can see the noun:
		Say "[The actor] [are] hugged." (C);

Part 3.3.3 - Dancing 

[Status: Complete; Consent and stimulation defered to later chapter
Dancing with is a new action. It takes into account that only other people can be danced with, decency and consent/arousal, and handle action reporting.]

Dancing is an action applying to one touchable thing.
The specification of the dancing action is "Dancing with is the act of dancing with a someone, including dancing with yourself."

Chapter 3.3.3a - Understanding

Understand "dance" as dancing.
Understand "dance with [something]" as dancing.

Does the player mean dancing a person: It is likely.
Does the player mean dancing the player: It is very unlikely.
Does the player mean dancing something that is part of something: It is very unlikely.

The dancing decency is initially formal.

Rule for supplying a missing noun while dancing (this is the dancing alone rule):
	Now the noun is the person asked;

Chapter 3.3.3b - Check

Check an actor dancing (This is the control what can be danced with rule):
	If the noun is not a person:
		If the actor is the player:
			Say "[We] [don't] want to dance with that." (A);
		Else if the player can see the actor and the action is not silent:
			Say "[The actor] [don't] want to dance with that." (B);
		Stop the action;

Check an actor dancing (this is the dancing decency rule):
	Let L be the location of the actor;
	If the decency threshold of L is greater than formal:
		If the player is the actor:
			Say "It [are] too public for [us] to dance here." (A);
		Else if the player can see the actor:
			Say "It [are] too public for [the actor] to dance here." (B);
		Stop the action;

Check an actor dancing (this is the seek consent for dancing rule):
	If the noun is a person or noun is enclosed by a person:
		Let result be the text produced by the consent rules;
		If the rule failed:
			Say result;
			Stop the action;

Chapter 3.3.3c - Carry Out

Carry out an actor dancing (this is the seek stimulation for dancing rule):
	If the noun is a person or noun is enclosed by a person:
		Follow the stimulation rules;

Chapter 3.3.3d - Reporting

[Default response]
Report an actor dancing (this is the report dancing rule):
	If the player is the actor:
		Say "[We] [dance] with [the noun]." (A);
	Else if the player can see the actor:
		Say "[The actor] [dance] with [the noun]" (B);
	Else if the player can see the noun:
		Say "[The actor] [are] danced with." (C);

Part 3.3.4 - Fucking

[Status: TODO
This is a collection of redirect-only actions.
	Tits
	Ass
	Finger
]

Part 3.3.5 - Masturbating

[Status: TODO
This is a redirect-only action.]


Book 3.4 - Discrete Arousal

[Design notes: TODO
Two types of arousal; discrete stages or numerical values.
Design extension around, discrete stages, but allow for them to easily be replaced by numerical values.

Arousals are increased by stimulating with an action, an can be used to grant consent.]

Part 3.4.1 - Definitions

Chapter 3.4.1a - Discrete Arousals

An arousal is a kind of value. The arousals are frigid arousal, unaroused, slightly aroused, aroused, very aroused, orgasmic, unattainable arousal.
The specification of arousal is "Arousal is a discrete measure of how aroused a person is. Unaroused is the neutral zero-point, with frigid arousal as a negative value and the unattainable arousal (as the last value defined) as the unset/null-value. These methods for arousing and cooling of a person will take these into account."

A person has an arousal called current arousal. The current arousal of a person is usually unaroused.

Chapter 3.4.1b - Orgasms

A person has a number called orgasms. The orgasms of a person is usually 0.
A person has a number called orgasmic attempts. The orgasmic attempts of a person is usually 0.

Part 3.4.2 - Working with Arousals

Chapter 3.4.2a - Comparisons

To decide whether (P - a person) is (A - an arousal) or more:
	[Note: Unattainable is treated as a null value, and is never considered more or less than anything.]
	If the current arousal of P is the unattainable arousal, decide no;
	If the current arousal of P is at least A, decide yes;
	Decide no;

To decide whether (P - a person) is (A - an arousal) or less:
	[Note: Unattainable is treated as a null value, and is never considered more or less than anything.]
	If the current arousal of P is the unattainable arousal, decide no;
	If the current arousal of P is at most A, decide yes;
	Decide no;

Chapter 3.4.2b - Increasing Arousals
	
[Increase the arousal of a person by one grade, with a maxmimum level.
Note: Unattainable is treated as a null value, and calls to increase to it are ignored.]
To arouse (P - a person) up to (A - an arousal):
	If the current arousal of P is less than A and A is not the unattainable arousal:
		Now the current arousal of P is the arousal after the current arousal of P;

[Increase the arousal of a person by one grade, without a maxmimum.
Note: Will not increase to the unattainable arousal.]
To arouse (P - a person):
	Arouse P up to (the arousal before the unattainable arousal);

Chapter 3.4.2c - Decreasing Arousals

[Move the arousal of a person by one grade towards the neutral unaroused, with a minimum level.
Note: Unattainable is treated as a null value, and will not be moved from.]
To cool (P - a person) down to (A - an arousal):
	If the current arousal of P is greater than unaroused and the current arousal of P is not the unattainable arousal:
		If the current arousal of P is greater than A:
			Now the current arousal of P is the arousal before the current arousal of P;
	Else if the current arousal of P is less than unaroused:
		If the current arousal of P is less than A:
			Now the current arousal of P is the arousal after the current arousal of P;
	
[Decrease the arousal of a person by one grade, without a minimum.]
To cool down (P - a person):
	Cool P down to unaroused;

Chapter 3.4.2d - Attaining Orgasms

A person has an arousal called the orgasm reset arousal. The orgasm reset arousal of a person is usually aroused.

[We want to make it so that every time a person orgasms, it's harder to achieve the next one.
The chance to succed is attempts : orgasms; the first orgasm is 'free'; the second is 50% at first attempt and 100% at second, third is 1/3 then 2/3, and so on.]
To decide whether (P - a person) orgasms:
	[Only orgasmic people can try to have an orgasm.]
	If the current arousal of P is not orgasmic:
		Decide no;
	Increase the orgasmic attempts of P by 1;
	Let X be the orgasmic attempts of P;
	Let Y be the orgasms of P + 1;
	If a random chance of X in Y succeeds:
		Increase the orgasms of P by 1;
		Now the orgasmic attempts of P is 0;
		Now the current arousal of P is the orgasm reset arousal of P;
		Decide yes;
	Decide no;

Part 3.4.3 - Consent and Stimulation Integration

[Status: Being implemented
This part deals with integrating the discrete arousals into the stimulation and consent framework of the actions.
This is separated into it's own part in order to make it easier to excise it if needed, like if the author wants to use a numerical arousal system.
In order to keep the number of default variables down so as to simplify the author's job, most actions are grouped together:

3.2.1	Touching	(Soft) Touching
3.2.2	Rubbing		(Soft) Touching
3.2.3	Tickling	(Soft) Touching
3.2.4	Spanking	Rough
3.2.5	Pinching	Rough
3.2.6	Licking		Oral
3.2.7	Biting		Rough
3.2.8	Fucking		Intercourse
3.3.1	Kissing		Oral
3.3.2	Hugging		(Soft) Touching
3.3.3	Dancing		(Soft) Touching

Each of these groups function in a similar manner:
Consent is given if the actors have each other as (TODO) love-interests, and the current arousal of the actors are atleast the arousal threshold for the action group. For body parts, the lowest threshold of the part and the person it's attached to is taken into consideration.

We assume that the player always consents; TODO: Remake into a variable]

Chapter 3.4.3a - General Requirements

[TODO
A person has a list of other actors they are willing to engage with. 
If the interactor is listed, make no decision in order to allow other rules to be consulted as well.]

A person has some text called the unaroused response.

Chapter 3.4.2 - Clothing

[TODO:]

Chapter 3.4.3c - Soft Touching

[This chapter deals with the "soft" touching actions, which share the same thresholds by default.
These are:
 * Touching (Usually body part)
 * Rubbing (Usually body part)
 * Tickling (Usually body part)
 * Hugging (Usually a person)
 * Dancing (Usually a person)]

Section - Properties

[Soft touch threshold is the minimum arousal at which a person or it's body part will engage in the soft-touch actions.]
A person has an arousal called the soft touch threshold. The soft touch threshold of a person is usually slightly aroused.
A body part has an arousal called the soft touch threshold. The soft touch threshold of a body part is usually slightly aroused.

[Active/passive soft touch arousal is the arousal attainable by soft-touch actions, as the active and passive participant.]
A person has an arousal called the active soft touch cap. The active soft touch cap of a person is usually aroused.
A person has an arousal called the passive soft touch cap. The passive soft touch cap of a person is usually aroused.
A body part has an arousal called the active soft touch cap. The active soft touch cap of a body part is usually aroused.
A body part has an arousal called the passive soft touch cap. The passive soft touch cap of a body part is usually aroused.


Section - Consent

A consent rule for an actor doing something (this is the soft touching consent rule):
	[Check consent for the actor first; we assume that the player always consent.]
	Unless the actor is the player:
		Unless the actor is the soft touch threshold of the noun or more, rule succeeds with result the unaroused response of the actor;
	[Check consent for the noun directly]
	If the noun is a person:
		Unless the noun is the player:
			Unless the noun is the soft touch threshold of the noun or more, rule succeeds with result the unaroused response of the noun;
	Else if the noun is a body part:
		Let P be the holder of the noun;
		Unless P is the player:
			Unless P is the soft touch threshold of the noun or more, rule succeeds with result the unaroused response of P;
			Unless P is the soft touch threshold of P or more, rule succeeds with result the unaroused response of P;
	Make no decision;
		
[We don't want this rule listed, instead abiding by it as necessary.]
Consent rule for an actor touching (this is the touching consent rule): Anonymously abide  by the soft touching consent rule;
Consent rule for an actor rubbing (this is the rubbing consent rule): Anonymously abide  by the soft touching consent rule;
Consent rule for an actor tickling (this is the tickling consent rule): Anonymously abide  by the soft touching consent rule;
Consent rule for an actor hugging (this is the hugging consent rule): Anonymously abide  by the soft touching consent rule;
Consent rule for an actor dancing (this is the dancing consent rule): Anonymously abide  by the soft touching consent rule;

Section - Stimulation

A stimulation rule for an actor doing something (this is the soft touching stimulation rule):
	[Stimulate the actor first:]
	Arouse the actor up to the active soft touch cap of the actor;
	If the noun is a person:
		Arouse the noun up to the passive soft touch cap of the noun;
	Else if the noun is a body part:
		Let P be the holder of the noun;
		Let target arousal be the passive soft touch cap of the noun;
		If the passive soft touch cap of P is greater than the target arousal:
			Let target arousal be the passive soft touch cap of P;
		Arouse P up to target arousal;
	Stimulated;

Stimulation rule for an actor touching (this is the touching stimulation rule): Anonymously abide  by the soft touching stimulation rule;
Stimulation rule for an actor rubbing  (this is the rubbing stimulation rule):  Anonymously abide  by the soft touching stimulation rule;
Stimulation rule for an actor tickling (this is the tickling stimulation rule): Anonymously abide  by the soft touching stimulation rule;
Stimulation rule for an actor hugging  (this is the hugging stimulation rule):  Anonymously abide  by the soft touching stimulation rule;
Stimulation rule for an actor dancing  (this is the dancing stimulation rule):  Anonymously abide  by the soft touching stimulation rule;

Volume 5 - Templates

Book 5.1 - Ready-to-Use Kinds

Part 5.1.1 - Anatomy

Chapter 5.1.1a - Head

A head is a kind of body part.
The cover locations of a head is usually {the head area}.

Some hair is a kind of body part.
The cover locations of hair is usually {the head area}.
It is ambiguously plural.

A face is a kind of body part.
The cover locations of face is usually {the face area}.

A mouth is a kind of body part.
The cover locations of mouth is usually {the face area}.
Understand "lip", "lips" as mouth.

A pair of eyes is a kind of body part.
The cover locations of pair of eyes is usually {the face area}.
They are usually plural-named. The indefinite article is usually "a". The plural of pair of eyes is pairs of eyes.

Chapter 5.1.1b - Limbs

Section - Legs

A pair of thighs is a kind of body part.
The cover locations of a pair of thighs is usually {the thigh area}. 
They are usually plural-named. The indefinite article is usually "a". The plural of pair of thighs is pairs of thighs.

A pair of legs is a kind of body part.
The cover locations of a pair of legs is usually {the leg area}.
They are usually plural-named. The indefinite article is usually "a". The plural of pair of legs is pairs of legs.

A pair of ankles is a kind of body part.
The cover locations of a pair of ankles is usually {the feet area}.
They are usually plural-named. The indefinite article is usually "a". The plural of pair of ankles is pairs of ankles.

A pair of feet is a kind of body part.
The cover locations of a pair of feet is usually {the feet area}.
They are usually plural-named. The indefinite article is usually "a". The plural of pair of feet is pairs of feet.

Section - Arms

A pair of arms is a kind of body part.
The cover locations of a pair of arms is usually {the arm area}.
They are usually plural-named. The indefinite article is usually "a". The plural of pair of arms is pairs of arms.

A pair of wrists is a kind of body part.
The cover locations of a pair of wrists is usually {the hand area}.
They are usually plural-named. The indefinite article is usually "a". The plural of pair of wrists is pairs of wrists.

A pair of hands is a kind of body part.
The cover locations of a pair of arms is usually {the hand area}.
They are usually plural-named. The indefinite article is usually "a". The plural of pair of hands is pairs of hands.

Chapter 5.1.1c - Torso

A neck is a kind of body part.
The cover locations of a neck is usually {the shoulder area}.

A pair of shoulders is a kind of body part.
The cover locations of a pair of shoulders is usually {the shoulder area}.
They are usually plural-named. The indefinite article is usually "a". The plural of pair of shoulders is pairs of shoulders.

A chest is a kind of body part.
The cover locations of a chest is usually {the upper torso area}.

A pair of breasts is a kind of body part.
The cover locations of a pair of breasts is usually {the upper torso area}. 
They are usually plural-named. The indefinite article is usually "a". The plural of pair of breasts is pairs of breasts. 
Understand "tit", "tits", "breast", "boob", "boobs", "tittie", "titties" and "juggs" as a pair of breasts.

A midriff is a kind of body part.
The cover locations of a midriff is usually {the lower torso area}.
Understand "stomach", "tummy" as midriff.

A waist is a kind of body part.
The cover locations of a waist is usually {the lower torso area, the lower back area}.

A backside is a kind of body part.
The cover locations of a backside is usually {the upper back area, the lower back area}.

Chapter 5.1.1d - Crotch

An ass is a kind of body part.
The cover locations of an ass is usually {the crotch area}.
Understand "asshole", "anus", "rear", "rear end", "butt", "bottom", "rump" as ass.

A penis is a kind of body part.
The cover locations of a penis is usually {the crotch area}.
Understand "cock", "dick", "wang", "dong", "wiener", "willy", "schlong", "boner", "pecker" as penis.

A vagina is a kind of body part.
The cover locations of a vagina is usually {the crotch area}.
Understand "pussy", "cunt", "slit", "crotch", "snatch", "clitoris", "clit", "twat" as vagina.

Part 5.1.2 - Wardrobe

Chapter 5.1.2a - Underwear

[Underwear is as the name implies, clothing that goes under. Socks are not considered underwear, for reasons explained in next chapter.]

A pair of panties is a kind of garment.
They are usually plural-named. The indefinite article is usually "a". The plural of panties is pairs of panties.
Understand "underwear", "undie", "undies" as pair of panties.
The specification of pair of panties is "Panties (for both sexes, despite the name) cover the crotch. They can be moved aside and ripped apart, and are usually indecent normalwear."
A pair of panties is usually underwear.
The cloth decency of pair of panties is usually indecent.
A pair of panties is usually allow touching through.
The cover areas of a pair of panties is usually {crotch area}.
A pair of panties is usually shiftable. The shiftyness of a pair of panties is usually moveable. The shifting revealed cover areas of pair of panties is usually {crotch area}.
A pair of panties is usually rippable. The ripping revealed cover areas of pair of panties is usually {crotch area}.

A bra is a kind of garment.
The specification of bra is "Bras are usually indecent underwear, and go on the upper torso/back."
A bra is usually underwear.
The cloth decency of a bra is usually indecent.
A bra is usually allow touching through.
The cover areas of a pair of panties is usually {upper torso area, upper back area}.

An undershirt is a kind of garment.
The specification of undershirt is "An undershirt is a shirt that's meant to go under a normal shirt, covering just the torso (front/back). It's usually immodest underwear. It can be ripped to expose the upper torso area."
An undershirt is usually underwear.
The cloth decency of an undershirt is usually immodest.
An undershirt is usually allow touching through.
The cover areas of an undershirt is usually {upper torso area, lower torso area, upper back area, lower back area}.
An undershirt is usually rippable. The ripping revealed cover areas of an undershirt is usually a {upper torso area}.

A swimsuit is a kind of garment.
The specification of swimsuit is "A swimsuit is immodest underwear that covers the upper torso, lower back/torso and crotch. It doesn't necessarily have to be for swimming; teddies and similar underwear can also use the same template. It can usually be moved aside to expose upper torso."
A swimsuit is usually underwear.
The cloth decency of a swimsuit is usually immodest.
A swimsuit is usually allow touching through.
The cover areas of a swimsuit is usually {upper torso area, lower torso area, lower back area, crotch area}.
A swimsuit is usually shiftable. The shiftyness of a swimsuit is usually moveable. The shifting revealed cover areas of a swimsuit is usually a {upper torso area}.

A bodysuit is a kind of garment.
The specification of bodysuit is "A bodysuit is a special form of indecent underwear that covers most of a person, only leaving the hands and head/face uncovered."
A bodysuit is usually underwear.
The cloth decency of a bodysuit is usually indecent.
The cover areas of a bodysuit is usually {shoulder area, arm area, upper torso area, upper back area, lower torso area, lower back area, crotch area, thigh area, leg area, feet area}.

[TODO: Move to documentation, needs to be custom implemented, usually based on undershirt or swimsuit.
The specification of corset is "A corset is a (usually rigid) underwear that's usually immodest, and covers the upper/lower front/back by default. As there are many kinds of corsets, this is a garment that usually takes some customization to match the requirements, such as altering cover areas and clothing layer."]

A mask is a kind of garment.
The specification of mask is "A mask covers a persons face and head, and is usually immodest. This is a piece of garment that should be used with care, as it will block access to a person's mouth."
A mask is usually underwear.
The cloth decency of a mask is usually immodest.
The cover areas of a mask is usually {face area, head area}.

Chapter 5.1.2b - Normalwear

[Normalwear is clothing that go on the "normal" layer, above underwear but under overwear. Because pantyhose needs to go over underwear and be on the same layer as socks, socks also sort here.]

A pair of socks is a kind of garment.
The specification of pair of socks is "Socks cover the feet, and is usually formal and normalwear (in order to match stockings and pantyhose)."
They are usually plural-named. The indefinite article is usually "a". The plural of socks is pairs of socks.
A pair of socks is usually normalwear.
The cloth decency of a pair of socks is usually formal.
A pair of socks is usually allow touching through.
The cover areas of a pair of socks is usually {feet area}.

A pair of stockings is a kind of garment.
They are usually plural-named. The indefinite article is usually "a". The plural of stockings is pairs of stockings.
The specification of pair of stockings is "Stockings covers feet, legs and thighs, and does not fit over anything. It is not compatible with pantyhose (which also covers the crotch). They are usually formal."
A pair of stockings is usually normalwear.
The cloth decency of a pair of stockings is usually formal.
A pair of stockings is usually allow touching through.
The cover areas of a pair of stockings is usually {feet area, leg area, thigh area}.
A pair of panties is usually rippable. The ripping revealed cover areas of a pair of panties is usually {thigh area}.

A pair of pantyhose is a kind of garment.
They are usually plural-named. The indefinite article is usually "a". The plural of pantyhose is pairs of pantyhose.
The specification of pair of pantyhose is "Pantyhose is similar to stockings, but also covers the crotch, which means they both have to be normalwear to fit over panties. It is usually formal, and can be ripped to expose the crotch."
A pair of pantyhose is usually normalwear.
The cloth decency of a pair of pantyhose is usually formal.
A pair of pantyhose is usually allow touching through.
The cover areas of a pair of pantyhose is usually {feet area, leg area, thigh area, crotch area}.
A pair of pantyhose is usually rippable. The ripping revealed cover areas of a pair of pantyhose is usually {crotch area}.

A shirt is a kind of garment.
The specification of shirt is "Shirt covers the entire back and torso, as well as shoulders and arms. It is usually casual and normalwear."
A shirt is usually normalwear.
The cloth decency of shirt is usually casual.
The cover areas of a shirt is usually {shoulder area, arm area, upper torso area, lower torso area, upper back area, lower back area}.
A shirt is usually default cover blocking.
A shirt is usually shiftable. The shiftyness of a shirt is usually buttonable. The shifting revealed cover areas of a shirt is usually {shoulder area, upper torso area, lower torso area}.
A shirt is usually rippable. The ripping revealed cover areas of a shirt is usually {shoulder area, upper torso area, lower torso area}.

A dress is a kind of garment.
The specification of a dress is "A dress covers the entire torso (front and back), as well as the arms/shoulders and thighs/legs. It is usually formal and normalwear. This means a sweater can be worn over it, but not a shirt under it. To swap this around, state that it is overwear instead. By default a dress can be unbuttoned to access the upper torso; to change this to make it raisable to access the crotch see the definition of minidress (you might also want to change default cover blocking).
Note; Dresses go under boots, which might cause some issues."
A dress is usually normalwear.
The cloth decency of dress is usually casual.
The cover areas of a dress is usually {shoulder area, arm area, upper torso area, lower torso area, upper back area, lower back area, crotch area, thigh area, leg area}.
A dress is usually default cover blocking.
A dress is usually shiftable. The shiftyness of a dress is usually buttonable. The shifting revealed cover areas of a dress is usually {shoulder area, upper torso area, lower torso area}.

A minidress is a kind of garment.
The specification of a minidress is "A minidress is a short dress that doesn't cover the legs; see dress for more details. It's usually casual and normalwear. It's can usually be raised to gain access to the crotch."
A minidress is usually normalwear.
The cloth decency of minidress is usually immodest.
The cover areas of a minidress is usually {shoulder area, arm area, upper torso area, lower torso area, upper back area, lower back area, crotch area, thigh area}.
A minidress is usually shiftable. The shiftyness of a dress is usually raisable. The shifting revealed cover areas of a dress is usually {crotch area, thigh area}.

A pair of glasses is a kind of garment.
They are usually plural-named. The indefinite article is usually "a". The plural of glasses is pairs of glasses.
Understand "goggles", "eyewear" as pair of glasses.
The specification of pair of glasses is "Glasses go on the face, and are usually formal normalwear. Because of this, they will block direct access and view to face parts (such as the mouth); this is usually not a problem as kissing redirects to the person."
A pair of glasses is usually normalwear.
The cloth decency of pair of glasses is usually formal.
The cover areas of a pair of glasses is usually {face area}.

Chapter 5.1.2c - Overwear

[Overwear is the outer layer of clothing, and is only covered by outerwear (clothing that is meant for outside use).]

A pair of trousers is a kind of garment.
They are usually plural-named. The indefinite article is usually "a". The plural of trousers is pairs of trousers.
Understand "pants", "jeans", "pair of pants/jeans" as pair of trousers.
The specification of pair of trousers is "Trousers (or pants/jeans) are casual clothes worn over the legs/thighs and crotch. They can usually be unzipped to allow access to the crotch."
A pair of trousers is usually overwear.
The cloth decency of pair of trousers is usually casual.
The cover areas of a pair of trousers is usually {leg area, thigh area, crotch area}.
A pair of trousers is usually default cover blocking.
A pair of trousers is usually shiftable. The shiftyness of a pair of trousers is usually zipable. The shifting revealed cover areas of a pair of trousers is usually {crotch area}.

A pair of shorts is a kind of garment.
They are usually plural-named. The indefinite article is usually "a". The plural of shorts is pairs of shorts.
The specification of pair of shorts is "Shorts are (as the name implies) short pants that don't cover the legs. As such they are casual overwear that cover the thighs and crotch. They can usually be unzipped to allow access to the crotch."
A pair of shorts is usually overwear.
The cloth decency of pair of shorts is usually casual.
The cover areas of a pair of shorts is usually {thigh area, crotch area}.
A pair of shorts is usually default cover blocking.
A pair of shorts is usually shiftable. The shiftyness of a pair of shorts is usually zipable. The shifting revealed cover areas of a pair of shorts is usually {crotch area}.

A skirt is a kind of garment.
The specification of skirt is "A skirt is usually a casual overwear that covers the crotch and thighs, and can easily be made longer by changing the default cover areas. It's usually liftable to expose everything."
A skirt is usually overwear.
The cloth decency of skirt is usually casual.
The cover areas of a skirt is usually {thigh area, crotch area}.
A skirt is usually shiftable. The shiftyness of a skirt is usually raisable. The shifting revealed cover areas of a skirt is usually a {thigh area, crotch area}.

A sweater is a kind of garment.
The specification of a sweater is "A sweater is a casual overwear that covers the entire upper body and arms. It can be pulled up to expose the upper and lower torso."
A sweater is usually overwear.
The cloth decency of sweater is usually casual.
The cover areas of a sweater is usually {shoulder area, arm area, upper torso area, lower torso area, upper back area, lower back area}.
A sweater is usually default cover blocking.
A sweater is usually shiftable. The shiftyness of a sweater is usually raisable. The shifting revealed cover areas of a sweater is usually a {upper torso area, lower torso area}.

A suit is a kind of garment.
The specification of a suit is "A suit is really a combination of a sweater-jacket and pants. It's usually formal overwear, and covers the back of the torso (it's assumed to be open to the chest), arms, legs/thighs and crotch. It can be unzipped to access the crotch."
The cover areas of a suit is usually {arm area, shoulder area, upper back area, lower back area, leg area, thigh area, crotch area}.
A suit is usually overwear.
The cloth decency of suit is usually casual.
A suit is usually default cover blocking.
A suit is usually shiftable. The shiftyness of a suit is usually zipable. The shifting revealed cover areas of a suit is usually {crotch area}.

Chapter 5.1.2d - Outerwear

[Outerwear is the topmost layer of clothing, and consists of clothing that would normally be suitable for outdoor use, over your normal clothes.]

A pair of shoes is a kind of garment.
They are usually plural-named. The indefinite article is usually "a". The plural of shoes is pairs of shoes.
The specification of pair of shoes is "Shoes are formal outerwear worn on the feet."
A pair of shoes is usually outerwear.
The cloth decency of pair of shorts is usually formal.
The cover areas of a pair of glasses is usually {feet area}.

A pair of boots is a kind of garment.
They are usually plural-named. The indefinite article is usually "a". The plural of boots is pairs of boots.
The specification of pair of boots is "Boots are formal outerwear like shoes, but are higher and cover both feet and legs.
Note; take care to use boots with dresses, as they technically go on the outside of a long dress."
A pair of boots is usually outerwear.
The cloth decency of pair of boots is usually formal.
The cover areas of a pair of glasses is usually {feet area, leg area}.

A hat is a kind of garment.
The specification of hat is "A hat goes on the head, and is usually formal outerwear. Because a hat covers the head area, it will block direct view of hair."
A hat is usually outerwear.
The cloth decency of a hat is usually formal.
The cover areas of a hat is usually {head area}.

A jacket is a kind of garment.
The specification of jacket is "A jacket is usually formal outerwear that is worn over the torso. It can be unbuttoned to expose the front."
The cover areas of a jacket is usually {arm area, shoulder area, upper torso area, lower torso area, upper back area, lower back area}.
A jacket is usually outerwear.
The cloth decency of jacket is usually formal.
A jacket is usually default cover blocking.
A jacket is usually shiftable. The shiftyness of a jacket is usually buttonable. The shifting revealed cover areas of a jacket is usually {upper torso area, lower torso area}.

A coat is a kind of garment.
The specification of coat is "A coat a longer version of a jacket, that also covers the thighs and crotch. It can be unbuttoned to expose the front and thighs/crotch."
The cover areas of a coat is usually {arm area, shoulder area, upper torso area, lower torso area, upper back area, lower back area, crotch area, thigh area}.
A coat is usually outerwear.
The cloth decency of coat is usually formal.
A coat is usually default cover blocking.
A coat is usually shiftable. The shiftyness of a coat is usually buttonable. The shifting revealed cover areas of a coat is usually {shoulder area, upper torso area, lower torso area, crotch area, thigh area}.

A pair of gloves is a kind of garment.
They are usually plural-named. The indefinite article is usually "a". The plural of gloves is pairs of gloves.
The specification of pair of gloves is "Gloves are formal outerwear that go over the hands."
A pair of gloves is usually outerwear.
The cloth decency of pair of gloves is usually formal.
The cover areas of a pair of gloves is usually {hand area}.



Part 5.1.3 - Furniture








Erotic Storytelling ends here.

---- DOCUMENTATION ----

NOTE: 27.12 of the documentation states that headings should be marked as Chapter:/Section:, but iirc colons do not compile.

Chapter - Using this Extension

To use this framework, you need to install it (which you probably have if you're reading this) and include it in your story:

	Include Version 1 of Adult Framework by Fictitious Frode.

By including this extension, you will enable certain actions (listed below) for the player, which you should write your own custom "After" rules for, and a warning/information screen will be printed at the start of a story. In order to turn this off, you should change the "warn of adult content" activity. Additionally, the extension provides a lot of options that are available, but not present unless you specify them:

	Body Parts
	Garments (Clothing layered over body parts)
	Arousal (with thresholds for actions)

Section - Body Part Templates

Section - Garment Templates

The "Kinds" section of the index has an exhaustive list of the template garments available, including documentation.


Chapter - Descriptions and Responses

At its most basic level a story can be seen as the printing of responses and descriptions to the players actions, completely skipping over any higher levels such as an over-arching story and the like. Therefore one can argue that the most important part of the framework is to make these descriptions and responses as easy as possible for the story author (that would be you) to write.

In order to make this as seamless as possible, the framework tries to work within the Inform standard rules where possible. For actions this means you should continue to use the Before, Instead and After rulebooks for responses, and the persuasion rules for asking other actors to perform actions. Additionally, you need to use the consent rules (which works similarly to persuasion rules) to define when actions involving other actors should be allowed. Descriptions of things are similar, with the regular description property working as before, but with several new description properties that will be printed under the correct circumstances. These are detailed below.

Section - Describing Persons

Section - Describing Body Parts

Body parts have two new text properties, one of which will be printed after the regular description of the body part. They have no default values, so if they are undefined nothing will be printed.

	Concealed description: Printed if all the cover areas for the body part are concealed by opaque garments.
	Visible description: Printed if atleast one of the cover areas for the body part is not concealed by an opaque garment.

This can be used in 3 main ways: If you only provide a description for a body part, that text will always be printed, regardless of clothing. This might be helpful for "always on" body parts, such as hair and eyes. The other extreme is to only provde concealed and visible descriptions, which miught be useful for body parts that are radically different, typically genitalia. The most common approach would be to use a combination of the two, where the description deals with the aspects that are readily inferable, and the concealed and visible descriptions providing additional details.

Section - Describing Garment

Garments have four new text properties, one of which will be printed after the regular description of the body part. Unlike for body parts, most of these do have default description if a custom one is not defined.

	Ripped description: Printed if the garment is both ripped and worn. Defaults to stating that the garment is ripped to shreds.
	Shifted description: Printed if the garment is both shifted and worn. Defaults to stating that the garment is shifted to be more revealing.
	Worn description: Printed if the garment is worn, but not shifted or ripped. Defaults to stating that the garment is worn.
	Unworn description: Printed if the garment is not worn, and is usually superflous to the regular description. No default value.




Section - Action Responses

Chapter - Body Parts

Chapter - Garments

Section - Layering

Section - 

Section - Shifting

Section - Ripping

Chapter - Consent and Arousal

Chapter - Advanced Topics

Section - Custom Body Parts

Section - Custom Garments

Section - Layered Clothing

Concealment is not cover. 
-Military Proverb

This framework takes aim to provide clothing (with integrated body parts) that can:
 * Block visibility
 * Deny and allow access (touchability)
 * Opening/Shifting/Breaking



Chapter - Technical Notes

Section - Version History

Section - Method Overview