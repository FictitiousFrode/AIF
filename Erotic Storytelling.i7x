Version 1 of Erotic Storytelling by Fictitious Frode begins here.
"An extension focused on writing Adult Interactive Fiction (AIF). Includes erotic actions, components and mechanics for layered clothing with distinct body parts, as well as consent system for actions involving others. 
Also includes an optional customizable ready-to-use Discrete-Arousal-based Consent and Stimulation systems, semi-automatic improved description generation, and templates for npc behavior.

Future plans include conversation and posturing, as well as out-of-game features such as content limits, completion tracking and hints."

Volume 0 - New Verbs

[These are the new verbs the framework uses; We put this in it's own volume in case anyone needs to rewrite it for compatibility:]

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
To fuck is a verb.

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

[Status: Complete
Decency is a control mechanism the story author can employ to control what the player should be allowed to do.]

A decency is a kind of value. The decencies are indecent, immodest, casual, formal and undefined decency.
The specification of decency is "Decency is a measure of what is socially acceptable in a given location. A room has a decency threshold (usually casual)
For a person, decency is a measure of how much skin that person is showing, and is defined for cover areas and garments. Body parts will inherit the lowest decency of the areas it covers, but this can be 'upgraded' by covering with clothing. The decency of a person is a value that will be referenced more often than it's updated, so we cache it and force the actions that will change it to update the cached value using the provided method 'update decency for Person'. Note; It's possible to manually set the decency of a person to a different value than it would be calculated to be; this value would hold untill the next action that recalculates it. Currently, the actions wearing, taking off, shifting, unshifting and ripping garments will recalculate the decency of the (former) wearer. Before doing any of these actions (as well as going), the person's (updated) decency is compared to the threshold to see if the action should be allowed.
The erotic actions also have a decency, which is also compared to the threshold. For many actions, this check is somewhat redundant as the action is only meaningful when indecent body parts are visible.
The undefined decency is not intended to be used, but is needed to signal that the value hasn't been calculated yet."

A person has a decency called the current decency. The current decency of a person is usually the undefined decency.

A room has a decency called the decency threshold. The decency threshold of a room is usually casual.

Chapter 1.1.1b - Cover Areas

[Status: Complete
Cover areas are the link between body parts and garments, and are used to defined visibility (with decency) and accesibility.]

A cover area is a kind of value. The cover area are defined by the Table of Coverage.
The specification of cover area is "Cover areas are the distinct, non-overlapping areas of the body that can be covered by garments. They are needed to provide the link between garments and body parts in order to provide decency, as not all areas on a person might be associated with a body part.
A body part or garment is considered to be visible if atleast one of it's cover areas is not covered. Visibility of garments are handled by the concealed possessions rulebok, while body parts are obviously present even when covered and as such are handled by descriptions instead. See body parts for more details.
The cover areas are defined by the Table of Coverage, which can be extended. NOTE: When altering the table, it's also important to update the body areas of people, which state which cover areas are applicable for that person."

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

[Status: Complete
Body parts are (as the name implies) parts of a body that the player can interact with.
It's possible to use body parts directly, but most of the time you would use a specific body part from the template section.]

A body part is a kind of thing.
The specification of body part is "A body part represents a part of a person that the player can interact with. While they can be instantiated directly, it's usually better to use one of the templated subclasses.
There can be several body parts in any given cover area, and although rare a body part can be in several areas and is only concealed if all of those areas have worn garments. The decency of a body part is determined by the least decent area it's in."

A body part has a list of cover areas called cover locations.

Section - Descriptions

A body part has some text called the covered description.
A body part has some text called the uncovered description.

Section - Understanding

A body part has some text called owner's pronoun. [Note: This will be updated at story start with the initiate erotic storytelling rule to match the person the part belongs to.]
Understand the owner's pronoun property as describing a body part. 

Does the player mean examining a body part that is part of the player: It is unlikely.

Part 1.1.2 - Clothing

[Status: Complete
Garments are implementation of wearable clothing that can be layered over cover areas. They have several complex sub-sets, grouped herein by chapter.]

A garment is a kind of thing.
The specification of garment is "A garment is something a person can wear over their body parts and related cover areas. 
Garments are quite complex, with several distinct sub-features: Some garments can be shiftable in various ways, or even be ripped apart. Transparency determines whether it blocks vision, and they can allow or block touching through. Clothing size is provided to allow garments to only be wearable by matching persons."

A garment is always wearable.
A garment has a decency called cloth decency. The cloth decency of a garment is usually casual.
A garment can be transparent or opaque. A garment is usually opaque. [Determines visibility to underlying parts.]
A garment can be allow touching through or block touching through. A garment is usually block touching through. [Determines touchability of underlying parts.]

A person has a list of garments called the preferred clothing. [Used by dressing action.]

Chapter 1.1.2a - Shifting and Ripping

[Status: Complete
Shifting and ripping are two related but separate ways to alter the covered areas of a garment. Shifting is temporary but ripping is permanent.]

A shiftyness is a kind of value. The shiftyness are defined by the Table of Shift.
The specification of shiftyness is "Shiftyness (which isn't really a word) are the positions that a garment can be shifted to in order to allow (usually) more access to underlying parts.
Mechanic-wise, it functions similarly to open, with the shiftable property determining whether the player can shift it, and shifted determining if it has been. Shiftyness determines what verbs the player can use to move the garment, and the textual responses.
Shifting a garment also has the possibility of altering the areas covered (through the list property shifted cover areas), and default cover blocking determines wheter to use the default cover areas or the ripped/shifted cover areas to determine if blocks unwearing."

Table of Shift
Shiftyness	describe shifting (text)	describe shifted (text)	describe unshifting (text)	describe unshifted (text)
moveable	"[move] aside"	"moved aside"	"[move] back"	"in place"
buttonable	"[unbutton]"	"unbuttoned"	"[button] up"	"buttoned"		
zipable	"[unzip]"	"unzipped"	"[zip] up"	"zipped up"
fastenable	"[unfasten]"	"unfastened"	"[fasten]"	"fastened"
raisable	"[hike] up"	"hiked up"	"[pull] down"	"in place"
lowerable	"[pull] down"	"pulled down"	"[pull] up"	"in place"

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

Book 1.2 - Functionality

Chapter 1.2.0a - Startup Procedures

Section - Info/Warning Screen

[TODO]

Section - Initiation

When play begins (this is the initiate erotic storytelling rule):
	[Set correct pronouns for body parts:]
	Repeat with part running through the body parts:
		If part is part of the player:
			Now owner's pronoun of part is "my";		
		Else if part is part of a man:
			Now owner's pronoun of part is "his";
		Else if part is part of a woman:
			Now owner's pronoun of part is "her";
		Else:
			Now owner's pronoun of part is "their";
	[Set correct pronouns for garments:]
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
	Repeat with A running through the cover locations of P:
		Let clothing be the list of garments worn by the holder of P;
		Sort clothing in reverse clothing layer order;
		Repeat with cloth running through clothing:
			[Only consider opaque garments]
			If cloth is opaque:
				If A is not listed in the modified covered areas of cloth: [Take shifted/ripped into account]
					Remove cloth from clothing;
			Else:
				Remove cloth from clothing;
		If clothing is empty, decide yes; [Nothing covers this area, so P is visible]
	Decide no; [We only come here if no cover areas were visible]
	
To decide which list of garments is concealing vision of (P - a body part):
	Let concealers be a list of garments;
	Repeat with A running through the cover locations of P:
		Let clothing be the list of garments worn by the holder of P;
		Sort clothing in reverse clothing layer order;
		Repeat with cloth running through clothing:
			Repeat with A running through the cover locations of P:
				If cloth is opaque and A is listed in the modified covered areas of cloth:
					Add cloth to concealers, if absent;
	Decide on concealers;

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
Definition: A person is bottomless if the crotch area can be seen for it.
Definition: A person is nearly nude if it is topless and it is bottomless.
Definition: A person is nude if it is not wearing any garments.

Part 1.2.3 - Visibility

[Status: Complete
Deals with determining which items are visible for the player, as well as custom descriptions.]

Chapter 1.2.3a - Concealed Possessions

A rule for deciding the concealed possessions of someone:
	If the particular possession is a garment (called G):
		If G can be seen, no;
		Else yes;
	Make no decision;[Defer to other rules]

Chapter 1.2.3b - Examining Body Parts

The examining body parts rule is listed after the standard examining rule in the carry out examining rulebook.
Carry out examining (this is the examining body parts rule):
	If noun is a body part:
		If noun can be seen:
			If noun provides the property uncovered description and the uncovered description of the noun is not the default value of text:
				Say "[uncovered description of the noun][line break]";
				Now examine text printed is true;
		Else:
			If noun provides the property covered description and the covered description of the noun is not the default value of text:
				Say "[covered description of the noun][line break]";
				Now examine text printed is true;

Chapter 1.2.3c - Examining Garments

The examining garments rule is listed after the standard examining rule in the carry out examining rulebook.
Carry out examining (this is the examining garments rule):
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
				Now examine text printed is true;
		Else:
			If noun provides the property unworn description and the unworn description of the noun is not the default value of text:
				Say "[unworn description of the noun][line break]";
				Now examine text printed is true;

Part 1.2.4 - Forcing Clothing

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
To force dress (P - a person) in (L - a list of garments):
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

[This book deals with the player actions related to changing clothes.]

Part 1.3.1 - Wearing Garments

[Status: Complete
We use the standard wearing action, but add some checks and replace the carry out rule.
See also the consent and arousal sections.]

Chapter 1.3.1a - Check

Check an actor wearing something (This is the check wearing garments rule):
	If the noun is a garment (called G):
		Unless G can be worn by the actor:
			Let B be the preventing wearing of G by the actor;
			If the player is the actor:
				Say "[We] [can't] wear [noun] on top of [B]." (A);
			If the player can see the actor and the action is not silent:
				Say "[The actor] [can't] wear [noun] on top of [B]." (B);
			Stop the action;

Check an actor wearing something (This is the check garment size rule):
	If the noun provides the property clothing size:
		If the clothing size of noun is not the clothing size of the actor:
			If the player is the actor:
				Say "[We] [can't] wear [noun], [it's] the wrong size." (A);
			If the player can see the actor and the action is not silent:
				Say "[The actor] [can't] wear [noun], [it's] the wrong size." (B);
			Stop the action;

Check an actor wearing something (This is the wearing requires consent rule):
	If the noun is a garment (called G):
		Follow the consent rules;
		Unless the outcome of the rulebook is the give consent outcome:
			Stop the action;

Chapter 1.3.1b - Carry Out

Carry out an actor wearing (this is the wearing garments rule):
	If the noun is a garment:
		Update decency for the actor;

Part 1.3.2 - Taking Off Garments

[Status: Complete.
For an actor taking off their own garments, we can use the standard taking off action, but add some checks and replace the carry out rule.
The drop undressed garments property of a person decided if the items taken off a dropped or kept by the actor.
Part 1.3.3 deals with an actor taking someone elses clothes.
See also the consent and arousal sections.]

A person can be keep clothes after undress. A person is usually keep clothes after undress.

Chapter 1.3.2a - Check

[Make sure that garments that are covered can't be taken off.]
Check an actor taking off something (this is the can't take off covered items rule):
	If noun is a garment (called G):
		Unless G can be taken off:
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

Check an actor taking something (This is the taking garments requires consent rule):
	If the noun is a garment and the noun is worn:
		Follow the consent rules;
		Unless the outcome of the rulebook is the give consent outcome:
			Stop the action;

Chapter 1.3.2b - Carry Out

The modified taking off rule substitutes for the standard taking off rule.
Carry out an actor taking off (this is the modified taking off rule):
	Let wearer be the holder of the noun;
	Now the actor carries the noun;
	If actor is not keep clothes after undress, silently try the actor dropping the noun;
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
	Unless the noun is a garment and the noun is worn:
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

Check an actor taking something (This is the taking off requires consent rule):
	If the noun is a garment and the noun is worn:
		Follow the consent rules;
		Unless the outcome of the rulebook is the give consent outcome:
			Stop the action;

The taking garments rule is listed first in the carry out taking rulebook.
Carry out an actor taking a garment (called G) (this is the taking garments rule):
	If G is worn:
		Let wearer be the holder of G;
		Now the actor carries G;
		If G is shifted, now G is unshifted;
		Update decency for the wearer;

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
	Unless the noun provides the property shiftable and the noun is shiftable and the noun provides the property shiftyness:
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
		Unless G can be shifted:
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

Check an actor shifting something (This is the shifting requires consent rule):
	If the noun is a garment and the noun is worn:
		Follow the consent rules;
		Unless the outcome of the rulebook is the give consent outcome:
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
	Unless the noun provides the property shiftable and the noun is shiftable and the noun provides the property shiftyness:
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
		Unless G can be shifted:
			Let blockers be the preventing shifting of G;
			If the player is the actor:
				Say "[We] [can't] [describe shifting of the shiftyness of the noun] [noun] when it's covered by [blockers]." (A);
			If the player can see the actor and the action is not silent:
				Say "[The actor] [can't] [describe shifting of the shiftyness of the noun] [noun] when it's covered by [blockers]." (B);
			Stop the action;

Check an actor unshifting something (This is the unshifting requires consent rule):
	If the noun is a garment and the noun is worn:
		Follow the consent rules;
		Unless the outcome of the rulebook is the give consent outcome:
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
		Unless G can be ripped:
			Let blockers be the preventing ripping of G;
			If the player is the actor:
				Say "[We] [can't] [rip] apart [noun] when it's covered by [blockers]." (A);
			If the player can see the actor and the action is not silent:
				Say "[The actor] [can't] [rip] apart [noun] when it's covered by [blockers]." (B);
			Stop the action;

Check an actor ripping (this is the can only rip rippable items rule):
	Unless the noun provides the property rippable and the noun is rippable:
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

Check an actor ripping something (This is the ripping requires consent rule):
	If the noun is a garment and the noun is worn:
		Follow the consent rules;
		Unless the outcome of the rulebook is the give consent outcome:
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

[This volume deals with fleshing out actors.
The first book deals with automating behavior to make actors seem more life-like.
The second book deals with ways to automatically flesh out the description of people.
The third book is an attempt at an improved conversation system.
The last book deals with posturing.]

Book 2.1 - Behavior

[An actor can have three levels of behavior:
Idle: Messages that are printed when the actor is not actively engaged in something. These are only processed if the player can see the actor.
Planned: Actions that the actor seeks to perform, but which will be postponed if they are engaged with someone.
Urgent: Actions that the actor urgently seek to perform, even if engaged with someone.]

Part 2.1.1 - Concepts

[Status: Complete
This part deals with the underlying concepts needed to make behavior processing possible]

Chapter 2.1.1a - Occupied Flag

[We need a way to stop people from doing several behaviors in a turn, so we set a flag.
This is also used to suppress planned behavior when the player interacts with that person, and can also be used to allow NPCs to interact with each other without acting twice.
It can also be set manually as needed to delay behavior for a turn, but if longer term stopping is needed, use the next property instead.]

A person can be occupied or unoccupied. A person is usually unoccupied.

Before asking someone (called P) to try doing something:
	Now P is occupied;
	Continue the action;

Before doing something to someone (called P):
	Now P is occupied;
	Continue the action;

Before doing something to a body part (called B):
	If B is part of a person (called P):
		Now P is occupied;
	Continue the action;

Before doing something to a garment (called G):
	If G is worn by person (called P):
		Now P is occupied;
	Continue the action;

Chapter 2.1.1b - Enabling

[In order to support easy temporary disabling of a persons behavior, we put in a toggle.
This would also slightly reduce the overhead as we don't need to parse rulebooks for people that are not supposed to have behavior.]

A person can be behavior-enabled or behavior-disabled. A person is usually behavior-disabled.

Chapter 2.1.1c - Priority

[In order to control which NPCs script gets called first, we introduce a simple numerical property to order actors by.]
A person has a number called priority.

Chapter 2.1.1d - Behavior State

[The behavior state can be used to control the script, but the main purpose is to hook into the person description generation.]
A person has some text called the behavior state description.

Part 2.1.2 - Rulebooks

[Status: Complete
We modify the turn sequence rulebook to add a stage that's responsible for calling the script rules for each person.
Exactly at which point it should be inserted can be argued, but as we want this to emulate the every turn rules, we insert it just before. We delay clearing the occupied flag untill after the every turn stage, so that the flag is available for every turn rules.]

Chapter 2.1.2a - Turn Sequence

The behavior stage rule is listed before the every turn stage rule in the turn sequence rules.
The behavior cleanup rule is listed after the every turn stage rule in the turn sequence rules.

This is the behavior stage rule:
	Let actors be the list of all behavior-enabled persons;
	Sort actors in reverse priority order;
	[First, allow actors to perform any urgent actions]
	Repeat with person running through actors:
		Follow the urgent behavior rulebook for person;
		If the rule succeeded, now the person is occupied;
	[Secondly, planned actions are performed]
	Repeat with person running through actors:
		If person is unoccupied:
			Follow the planned behavior rulebook for person;
			If the rule succeeded, now the person is occupied;
	[Lastly, print idle messages]
	Repeat with person running through actors:
		If person is unoccupied and the player can see the person:
			Follow the idle behavior rulebook for person;
			If the rule succeeded, now the person is occupied;

This is the behavior cleanup rule:
	Repeat with person running through persons:
		Now person is unoccupied;

Chapter 2.1.2b - New Rulebooks

The urgent behavior rulebook is a person based rulebook.
The urgent behavior rules have outcomes behavior cancelled (failure), behavior postponed (no outcome), and behavior performed (success - the default).

The planned behavior rulebook is a person based rulebook.
The planned behavior rules have outcomes behavior cancelled (failure), behavior postponed (no outcome), and behavior performed (success - the default).

The idle behavior rulebook is a person based rulebook.
The idle behavior rules have outcomes behavior cancelled (failure), behavior postponed (no outcome), and behavior performed (success - the default).

Book 2.2 - Describing People

[This book deals with describing both the player and other actors.]

Part 2.2.1 - Framework

[Status: 
In order to easily expand upon how people are described when examining, we create a new rulebook that's responsible for printing a description, and then hooking this up in the carry out examining rules. In order to create generic description rules, we also have a rulebook for determining how notable a given feature of a person is.]

Chapter 2.2.1a - Rulebooks

Section - Description Generation Rulebook

[The description generation rules is the rulebook consulted to generate a description, and is the one authors are to use.]
The description generation rules are a person based rulebook.
The description generation rules have outcomes undescribable (failure), undescribed (no outcome), and described (success - the default).

Section - Default Description Generation Rulebook

[The default description generation rules are called by the generate default descriptions rule.]
The default description generation rules are a person based rulebook.
[BUGFIX: All the default description rules should be considered!
The default description generation rules have outcomes undescribable (failure), undescribed (no outcome), and described (success - the default).]

Section - Notability Rulebook

[The description notability rules are used by some of the default description generation rules to determine how something should be categorized.]
The description notability rules are a thing based rulebook.
The description notability rules have outcomes hidden (failure), unnotable (failure), unknown (no outcome - the default), grouped (success) and distinct (success).

Section - Status Description Rulebook

The status description generation rules are a person based rulebook.

Chapter 2.2.1b - Examine Integration

The examining people rule is listed after the standard examining rule in the carry out examining rulebook.
Carry out an actor examining (this is the examining people rule):
	If noun is a person:
		Follow the description generation rules for the noun;
		If rule succeeded, now examine text printed is true;

Chapter 2.2.1c - Properties

[The short description should be a short (3-4) word summary of the body part or garment, that will be used in list printing.]

A body part has some text called short description.
A garment has some text called short description.

Part 2.2.2 - Description Generation Rules

Chapter 2.2.2a - Default Notability Rules

Description notability for something (called N)  worn by someone (this is the worn items notability rule):
	If N is concealed:
		Hidden;
	Otherwise:
		Grouped;

Description notability for a thing (called N) carried by someone (this is the carried items notability rule):
	If N is concealed:
		Hidden;
	Otherwise:
		Grouped;

Chapter 2.2.2b - Default Description Generation

[This rulebook gets called on after the normal description of the person is printed, so it should generate the interesting points of the person that the description didn't touch upon. We do this by sub-calling four specific rules.
* The distinctly notable body parts, worn garments and held items.
* Any other distinctly notable status-features.
* A list of you-can-also-see grouped features.
* What the person is currently doing.]

A description generation rule for a person (called P) (this is the generate default descriptions rule):
	Follow the default description generation rules for P;

The generate specific status description rule is listed first in the default description generation rules. [2]
The generate specific description rule is listed first in the default description generation rules. [1]

The generate grouped description rule is listed last in the default description generation rules. [3]
The generate script description rule is listed last in the default description generation rules. [4]

Chapter 2.2.2c - Notable features (1)

[The purpose of this rule is to list out any notable features of a person, such as body parts, worn clothing and carried possessions.]
A default description generation for a person (called P) (This is the generate specific description rule):
	[Set up lists for holding the descriptions we want printed:]
	Let notable body part descriptions be a list of text;
	Let notable clothing descriptions be a list of text;
	Let notable possession descriptions be a list of text;
	[Populate the lists, based on the description notability rules:]
	Let parts be the list of body parts enclosed by P;
	Repeat with part running through parts:
		Follow the description notability rules for part;
		If the outcome of the rulebook is the distinct outcome:
			If part provides the property short description 
			and the short description of the part is not the default value of text:
				Add short description of part to the notable body part descriptions;
			Else:
				Let article be "";
				If part is not proper-named:
					If part is plural-named, let article be "some ";
					If part is singular-named, let article be "a ";
				Add "[article][the printed name of the part]" to the notable body part descriptions;
	Let clothing be the list of things worn by P;
	Repeat with cloth running through clothing:
		Follow the description notability rules for cloth;
		If the outcome of the rulebook is the distinct outcome:
			If cloth provides the property short description 
			and the short description of the cloth is not the default value of text:
				Add short description of cloth to the notable clothing descriptions;
			Else:
				Let article be "";
				If cloth is not proper-named:
					If cloth is plural-named, let article be "some ";
					If cloth is singular-named, let article be "a ";
				Add "[article][the printed name of the cloth]" to the notable clothing descriptions;
	Let possessions be the list of things carried by P;
	Repeat with possession running through possessions:
		Follow the description notability rules for possession;
		If the outcome of the rulebook is the distinct outcome:
			If possession provides the property short description 
			and the short description of the possession is not the default value of text:
				Add short description of possession to the notable possession descriptions;
			Else:
				Let article be "";
				If possession is not proper-named:
					If possession is plural-named, let article be "some ";
					If possession is singular-named, let article be "a ";
				Add "[article][the printed name of the possession]" to the notable possession descriptions;
	[Convert the lists to printed text. We try to combine clothing with carried items.]
	If notable body part descriptions is non-empty:
		Say "[Regarding P][They] [have] [notable body part descriptions].";
	If notable clothing descriptions is non-empty:
		If notable possession descriptions is non-empty:
			Say "[Regarding P][They] [are] wearing [notable clothing descriptions] and carrying [notable possession descriptions].";
		Else:
			Say "[Regarding P][They] [are] wearing [notable clothing descriptions].";

Chapter 2.2.2d - Status summary (2)

[The purpose of this rule is to list any noteworthy statuses of a person; including (but not limited to) nudenes/topless, sperming, penetrations, etc.
In order to keep this expandable, the actual contents are in their own rulebook.]
A default description generation rule for a person (called P) (this is the generate specific status description rule):
	Follow the status description generation rules for P;

[The job of this rule is not to list what the person is wearing, but summarize it.]
A status description generation rule for a person (called P) (this is the clothing status rule):
	If P is nude:
		Say "[Regarding P][They] [are] completely naked.";
	Else if P is nearly nude:
		Say "[Regarding P][They] [are] almost naked.";
	Else if P is topless:
		Say "[Regarding P][They] [are] topless.";
	Else if P is bottomless:
		Say "[Regarding P][Their] nether regions are on display.";

Chapter 2.2.2e - Grouped features (3)

[The purpose of this rule is to list out any other features of a person (you can also see...), such as body parts, worn clothing and carried possessions.]
A default description generation rule for a person (called P) (this is the generate grouped description rule):
	[Set up lists for holding the descriptions we want printed:]
	Let grouped body part descriptions be a list of text;
	Let grouped clothing descriptions be a list of text;
	Let grouped possession descriptions be a list of text;
	[Populate the lists, based on the description notability rules:]
	Let parts be the list of body parts enclosed by P;
	Repeat with part running through parts:
		Follow the description notability rules for part;
		If the outcome of the rulebook is the grouped outcome:
			Let article be "";
			If part is not proper-named:
				If part is plural-named, let article be "some ";
				If part is singular-named, let article be "a ";
			Add "[article][the printed name of the part]" to the grouped body part descriptions;
	Let clothing be the list of things worn by P;
	Repeat with cloth running through clothing:
		Follow the description notability rules for cloth;
		If the outcome of the rulebook is the grouped outcome:
			Let article be "";
			If cloth is not proper-named:
				If cloth is plural-named, let article be "some ";
				If cloth is singular-named, let article be "a ";
			Add "[article][the printed name of the cloth]" to the grouped clothing descriptions;
	Let possessions be the list of things carried by P;
	Repeat with possession running through possessions:
		Follow the description notability rules for possession;
		If the outcome of the rulebook is the grouped outcome:
			Let article be "";
			If possession is not proper-named:
				If possession is plural-named, let article be "some ";
				If possession is singular-named, let article be "a ";
			Add "[article][the printed name of the possession]" to the grouped possession descriptions;
	[Convert the lists to printed text:]
	If grouped body part descriptions is non-empty:
		Say "[We] also note that [regarding P][they] [have] [grouped body part descriptions].";
	If grouped clothing descriptions is non-empty:
		If grouped possession descriptions is non-empty:
			Say "[Regarding P][They] [are] wearing [grouped clothing descriptions] and carrying [grouped possession descriptions].";
		Else:
			Say "[Regarding P][They] [are] wearing [grouped clothing descriptions].";

Section - State summary (4)

[The purpose of this rule is to give a quick status of what the person is doing, or rather the state snapshot of their AI script.]
A default description generation rule for a person (called P) (this is the generate script description rule):
	If P provides the property behavior state description and the behavior state description is not the default value of text:
		Say the behavior state description of P;

Book 2.3 - Conversation

[TODO]

Book 2.4 - Posturing

[TODO]

Volume 3 - Erotic Actions

Book 3.1 - Concepts

Part 3.1.1 - Stimulation

Chapter 3.1.1a - Stimulation Rulebook

[Stimulation is a rulebook that deals with altering the arousal of participants in erotic actions.
We create a new rulebook, with outcomes stimulated and unstimulated, and defaulting to being stimulated. Because of the default value, rules will not fall though to the next case unless explicitly told to make no decision. This allows us to populate the rulebook with default rules.]

The stimulation rules is a rulebook.
The stimulation rules have outcomes stimulated (success - the default) and unstimulated (failure).

[We also create a seperate rulebook to pack the default rules into, that we only want called explicitly.]
The default-stimulation rules is a rulebook.
The default-stimulation rules have outcomes stimulated (success - the default) and unstimulated (failure).

Part 3.1.2 - Consent

Chapter 3.1.2a - Consent Rulebook

[We use a rulebook to gain consent for actions.]
The consent rules is a rulebook.
The consent rules have outcomes give consent (success - the default) and deny consent (failure).

[This default consent rule is as generic as possible, and will be executed last.]
A consent rule (this is the default consent rule):
	[Check consent for the actor first; we assume that the player always consent.]
	If the actor is not the player:
		Say "[The actor] [aren't] consenting to that ([current action])." (A);
		Deny consent;
	[Check consent for the noun directly]
	If the noun is a person:
		If the noun is not the player:
			Say "[The noun] [aren't] consenting to that ([current action])." (B);
			Deny consent;
	Else if the noun is a body part:
		Let P be the holder of the noun;
		If P is not the player:
			Say "[The P] [aren't] consenting to that ([current action])." (C);
			Deny consent;

[We also create a seperate rulebook to pack the default rules into, that we only want called explicitly.]
The default-consent rules is a rulebook.
The default-consent rules have outcomes give consent (success - the default) and deny consent (failure).

Part 3.1.3 - Properties

Chapter 3.1.3a - Action Control Adjectives

[The following properties are specified to control which things the correspondingly named action is applicable to.
These can be applied to other things than body part if wanted, and access to garments are supported.]

A body part can be touchable or untouchable. A body part is usually untouchable.
A body part can be rubbable or unrubbable. A body part is usually unrubbable.
A body part can be tickleable or untickleable. A body part is usually untickleable.
A body part can be spankable or unspankable. A body part is usually unspankable.
A body part can be pinchable or unpinchable. A body part is usually unpinchable.
A body part can be lickable or unlickable. A body part is usually unlickable.
A body part can be biteable or unbiteable. A body part is usually unbiteable.

Chapter 3.1.3b - Sexual Adjectives

A body part can be penetrating. A body part is usually not penetrating.
A body part can be orificial. A body part is usually not orificial.

Part 3.1.4 - Body Part Patterns

Chapter 3.1.4a - Erectable

[TODO
A body part has a an arousal called the erection threshold.
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

The touching decency is initially immodest.

Chapter 3.2.1a - Understanding

Understand "caress [something]" and "feel [something]" as touching.

Does the player mean touching a body part: It is likely.
Does the player mean touching a person: It is unlikely.
Does the player mean touching the player: It is very unlikely.
Does the player mean touching something that is part of the player: It is very unlikely.

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
		Unless the noun provides the property touchable and the noun is touchable:
			If the actor is the player:
				Say "[We] [can't] touch that." (A);
			Else if the player can see the actor and the action is not silent:
				Say "[The actor] [can't] touch that." (B);
			Stop the action;

Check an actor touching (this is the touching reachability rule):
	If the noun is a body part or noun is a garment:
		Unless noun can be touched:
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
		Follow the consent rules;
		Unless the outcome of the rulebook is the give consent outcome:
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

The rubbing decency is initially immodest.

Chapter 3.2.2a - Understanding

Understand "massage [something]", "rub [something]", "fondle [something]" as rubbing. 

Does the player mean rubbing a body part: It is likely.
Does the player mean rubbing a person: It is unlikely.
Does the player mean rubbing the player: It is very unlikely.
Does the player mean rubbing something that is part of the player: It is very unlikely.

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
		Unless the noun provides the property rubbable and the noun is rubbable:
			If the actor is the player:
				Say "[We] [can't] rub that." (A);
			Else if the player can see the actor and the action is not silent:
				Say "[The actor] [can't] rub that." (B);
			Stop the action;

Check an actor rubbing (this is the rubbing reachability rule):
	If the noun is a body part or noun is a garment:
		Unless noun can be touched:
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
		Follow the consent rules;
		Unless the outcome of the rulebook is the give consent outcome:
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

The tickling decency is initially immodest.

Chapter 3.2.3a - Understanding

Understand "tickle [something]" as tickling. 

Does the player mean tickling something tickleable: It is very likely.
Does the player mean tickling the player: It is very unlikely.
Does the player mean tickling something that is part of the player: It is very unlikely.

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
	Unless the noun provides the property tickleable and the noun is tickleable:
		If the actor is the player:
			Say "[We] [can't] tickle that." (A);
		Else if the player can see the actor and the action is not silent:
			Say "[The actor] [can't] tickle that." (B);
		Stop the action;

Check an actor tickling (this is the tickling reachability rule):
	If the noun is a body part or noun is a garment:
		Unless noun is touchable:
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
		Follow the consent rules;
		Unless the outcome of the rulebook is the give consent outcome:
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
		Say "[The actor] [tickle] [the noun]." (B);
	Else if the player can see the noun:
		Say "[The noun] [are] tickled." (C);

Part 3.2.4 - Slapping/Spanking

[Status: Complete; Consent and stimulation defered to later chapter
Spanking is a new action. It takes into account that other people's body parts can be spanked, decency and consent/arousal, and handle reporting. Unlike other new actions, we will allow self-spanking.]

Spanking is an action applying to one touchable thing.
The specification of the spanking action is "Spanking is the act of hitting or slapping a person's body parts. Attempts to spank a person will redirect to the rear end."

The spanking decency is initially indecent.

Chapter 3.2.4a - Understanding

Understand "spank [something]", "slap [something]", "smash [something]", "hit [something]", "punch [something]" and "thump [something]" as spanking.

Does the player mean spanking something spankable: It is very likely.
Does the player mean spanking the player: It is very unlikely.
Does the player mean spanking something that is part of the player: It is very unlikely.

Chapter 3.2.4b - Check

Check an actor spanking (This is the spanking specificity rule):
	If the noun is a person:
		If the actor is the player:
			Say "[We] [have] to be more specific about what to spank." (A);
		Else if the player can see the actor and the action is not silent:
			Say "[We] [have] to be more specific about what [the actor] should spank." (B);
		Stop the action;

Check an actor spanking (This is the control what can be spanked rule):
	Unless the noun provides the property spankable and the noun is spankable:
		If the actor is the player:
			Say "[We] [can't] spank that." (A);
		Else if the player can see the actor and the action is not silent:
			Say "[The actor] [can't] spank that." (B);
		Stop the action;

Check an actor spanking (this is the spanking reachability rule):
	If the noun is a body part or the noun is a garment:
		Unless noun is touchable:
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
		Follow the consent rules;
		Unless the outcome of the rulebook is the give consent outcome:
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
		Say "[The actor] [spank] [the noun]." (B);
	Else if the player can see the noun:
		Say "[The noun] [are] spanked." (C);

Part 3.2.5 - Pinching

[Status: Complete; Consent and stimulation defered to later chapter
Pinching is a new action. It takes into account that only other people's body parts can be pinched, decency and consent/arousal, and handle reporting.]

Pinching is an action applying to one touchable thing.
The specification of the pinching action is "Tease another person by pinching their body parts."

The pinching decency is initially immodest.

Chapter 3.2.5a - Understanding

Understand "pinch [something]", "squeeze [something]" as pinching. 

Does the player mean pinching something pinchable: It is very likely.
Does the player mean pinching the player: It is very unlikely.
Does the player mean pinching something that is part of the player: It is very unlikely.

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
	Unless the noun provides the property pinchable and the noun is pinchable:
		If the actor is the player:
			Say "[We] [can't] pinch that." (A);
		Else if the player can see the actor and the action is not silent:
			Say "[The actor] [can't] pinch that." (B);
		Stop the action;

Check an actor pinching (this is the pinching reachability rule):
	If the noun is a body part or noun is a garment:
		Unless noun is touchable:
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
		Follow the consent rules;
		Unless the outcome of the rulebook is the give consent outcome:
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
		Say "[The actor] [pinch] [the noun]." (B);
	Else if the player can see the noun:
		Say "[The noun] [are] pinched." (C);

Part 3.2.6 - Licking

[Status: Complete; Consent and stimulation defered to later chapter
Licking is a new action, used only on body parts but attempts to redirect from persons. It handles decency, access.]

Licking is an action applying to one touchable thing.
The specification of the licking action is "This action is intended for when the actor uses their mouth on a body part. Trying to lick a person will try to find a better part of that person to lick."

The licking decency is initially immodest.

Chapter 3.2.6a - Understanding

Understand "lick [something]" and "suck [something]" as licking. 

Does the player mean licking something lickable: It is very likely.
Does the player mean licking a person: It is likely.
Does the player mean licking the player: It is very unlikely.
Does the player mean licking something that is part of the player: It is very unlikely.

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
	Unless the noun provides the property lickable and the noun is lickable:
		If the actor is the player:
			Say "[We] [can't] lick that." (A);
		Else if the player can see the actor and the action is not silent:
			Say "[The actor] [can't] lick that." (B);
		Stop the action;

Check an actor licking (this is the licking reachability rule):
	If the noun is a body part or the noun is a garment:
		Unless noun is accessible:
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
		Follow the consent rules;
		Unless the outcome of the rulebook is the give consent outcome:
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
		Say "[The actor] [lick] [the noun]." (B);
	Else if the player can see the noun:
		Say "[The noun] [are] licked." (C);

Part 3.2.7 - Biting

[Status: Complete; Consent and stimulation defered to later chapter
Biting is a new action, used only on body parts, but attempts to bit something edible is eating. It handles decency, access.]

Biting is an action applying to one touchable thing.
The specification of the biting action is "This action is intended for when the actor bites on something. Attempts to bite something edible redirects to eating."

The biting decency is initially indecent.

Chapter 3.2.7a - Understanding

Understand "bite [something]", "gnaw [something]" and "chomp [something]" as biting. 

Does the player mean biting something biteable: It is very likely.
Does the player mean biting the player: It is very unlikely.
Does the player mean biting something that is part of the player: It is very unlikely.

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
	Unless the noun provides the property biteable and the noun is biteable:
		If the actor is the player:
			Say "[We] [can't] bite that." (A);
		Else if the player can see the actor and the action is not silent:
			Say "[The actor] [can't] bite that." (B);
		Stop the action;

Check an actor biting (this is the biting reachability rule):
	If the noun is a body part or noun is a garment:
		Unless noun is accessible:
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
		Follow the consent rules;
		Unless the outcome of the rulebook is the give consent outcome:
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
		Say "[The actor] [bite] [the noun]." (B);
	Else if the player can see the noun:
		Say "[The noun] [are] bitten." (C);

Part 3.2.8 - Fucking It With

[Status: Complete
Fucking it with is a new action with some complexity, and is the act of inserting something penetrating into something orificial.
See also the person-oriented redirect actions.]

Fucking it with is an action applying to one touchable thing and one thing.
The specification of the fucking it with action is "Fucking it with is the action of putting something into something else. By default it expects to receive an orifice to put something penetrating into. See also the person-oriented actions 'fuck', 'assfuck' and 'titfuck' which redirect here."

The fucking decency is initially indecent.

Chapter 3.2.8a - Understanding

Understand "fuck [something] with [something]" as fucking it with.
Understand "fuck [something penetrating] with [something orificial]" as fucking it with (with nouns reversed).

Does the player mean fucking something with a something penetrating: it is likely.
Does the player mean fucking something orificial with something: it is likely.
Does the player mean fucking something with a something penetrating enclosed by the player: it is very likely.

Chapter 3.2.8b - Check

Check an actor fucking something with (this is the self fucking rule):
	If the noun is the actor or the noun is part of the actor:
		If the second noun is the actor or the second noun is part of the actor:
			If the actor is the player:
				say "[We] [don't] get much from that." (A);
			Else if the player can see the actor and the action is not silent:
				Say "[The actor] [don't] get much from that." (B);
			Stop the action;

[Ensure that the actor is in control of atleast one of the parts, and that all parts are carried or enclosed]
Check an actor fucking something with (This is the control what can be fucked rule):
	Unless the noun is part of the actor or the actor has the noun:
		Unless the second noun is part of the actor or the actor has the second noun:
			If the actor is the player:
				Say "[We] [can't] do that withouth being a part of it." (A);
			Else if the player can see the actor and the action is not silent:
				Say "[The actor] [can't] do that without being a part of it." (B);
			Stop the action;

[Make sure that the first noun is orificial and the second noun is penetrating]
Check an actor fucking something with (This is the fucking specificity rule):
	If the noun provides the property orificial and the noun is orificial:
		If the second noun provides the property penetrating and the second noun is penetrating:
			Continue the action;
	If the noun provides the property penetrating and the noun is penetrating:
		If the second noun provides the property orificial and the second noun is orificial:
			Try the actor fucking the second noun with the noun instead;
	If the actor is the player:
		Say "[We] [have] to be more specific about what should go where." (A);
	Else if the player can see the actor and the action is not silent:
		Say "[We] [have] to be more specific about what [the actor] should put where." (B);
	Stop the action;

Check an actor fucking something with (this is the fucking reachability rule):
	If the noun is a body part or noun is a garment:
		Unless noun is accessible:
			If the player is the actor:
				Say "[We] [can't] reach that." (A);
			Else if the player can see the actor:
				Say "[The actor] [can't] reach that." (B);
			Stop the action;
	If the second noun is a body part or second noun is a garment:
		Unless second noun is accessible:
			If the player is the actor:
				Say "[We] [can't] reach that." (C);
			Else if the player can see the actor:
				Say "[The actor] [can't] reach that." (D);
			Stop the action;

Check an actor fucking something with (this is the fucking decency rule):
	Let L be the location of the actor;
	If the decency threshold of L is greater than the fucking decency:
		If the player is the actor:
			Say "It [are] too public for [us] to bite [noun] here." (A);
		Else if the player can see the actor:
			Say "It [are] too public for [the actor] to bite [noun] here." (B);
		Stop the action;

Check an actor fucking something with (this is the seek consent for fucking rule):
	Follow the consent rules;
	Unless the outcome of the rulebook is the give consent outcome:
		Stop the action;

Chapter 3.2.8c - Carry Out

Carry out an actor fucking something with (this is the seek stimulation for fucking rule):
	Follow the stimulation rules;

Chapter 3.2.8d - Reporting

[Default response]
Report an actor fucking something with (this is the report fucking rule):
	If the player is the actor:
		Say "[We] [fuck] [the noun] with [the second noun]." (A);
	Else if the player can see the actor:
		Say "[The actor] [fuck] [the noun] with [the second noun]." (B);
	Else if the player can see the noun:
		Say "[The noun] [are] fucked." (C);

Book 3.3 - Person Actions

[These actions only take another person as the noun, but some redirect if used on body parts.]

Part 3.3.1 - Kissing

[Status: Complete; Consent and stimulation defered to later chapter
Kissing is already covered in the Standard Rules, but it's disabled by default.
We replace the blocks with our own checks, taking into account that only other people can be kissed, decency and consent/arousal, and handle action reporting.]

The specification of the kissing action is "Possibly because Inform was originally written by an Englishman, attempts at kissing another person are normally blocked as being unrealistic or not seriously meant. So the Standard Rules simply block attempts to kiss people, but the action exists for rules to make exceptions.
Erotic Storytelling replaces the existing checks that block kissing, replacing them with checks to see that only other people can be kissed, and attempts to kiss body parts are redirected to licking that part."

The kissing decency is initially casual.

Chapter 3.3.1a - Understanding

Understand "kiss [body part]" as kissing.

Does the player mean kissing a person: It is likely.
Does the player mean kissing the player: It is very unlikely.
Does the player mean kissing something that is part of the player: It is very unlikely.

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
		Follow the consent rules;
		Unless the outcome of the rulebook is the give consent outcome:
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
		Say "[The actor] [kiss] [the noun]." (B);
	Else if the player can see the noun:
		Say "[The noun] [are] kissed." (C);

Part 3.3.2 - Hugging

[Status: Complete; Consent and stimulation defered to later chapter
Hugging is a new action. It takes into account that only other people can be hugged, decency and consent/arousal, and handle reporting.]

Hugging is an action applying to one touchable thing.
The specification of the hugging action is "Shows affection to another person by giving them a hug. Only other people can be hugged, hugging a body part redirects to touching."

The hugging decency is initially formal.

Chapter 3.3.2a - Understanding

Understand "hug [something]" as hugging.

Does the player mean hugging a person: It is likely.
Does the player mean hugging the player: It is very unlikely.
Does the player mean hugging something that is part of the player: It is very unlikely.

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
		Follow the consent rules;
		Unless the outcome of the rulebook is the give consent outcome:
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
		Say "[The actor] [hug] [the noun]." (B);
	Else if the player can see the noun:
		Say "[The noun] [are] hugged." (C);

Part 3.3.3 - Dancing 

[Status: Complete; Consent and stimulation defered to later chapter
Dancing with is a new action. It takes into account that only other people can be danced with, decency and consent/arousal, and handle action reporting.]

The dancing decency is initially formal.

Dancing is an action applying to one touchable thing.
The specification of the dancing action is "Dancing with is the act of dancing with a someone, including dancing with yourself."

Chapter 3.3.3a - Understanding

Understand "dance" as dancing.
Understand "dance with [something]" as dancing.

Does the player mean dancing a person: It is likely.
Does the player mean dancing the player: It is very unlikely.
Does the player mean dancing something that is part of something: It is very unlikely.

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
		Follow the consent rules;
		Unless the outcome of the rulebook is the give consent outcome:
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
		Say "[The actor] [dance] with [the noun]." (B);
	Else if the player can see the noun:
		Say "[The noun] [are] danced with." (C);

Book 3.4 - Redirect Helpers

[To improve the understanding of the player, we provide some helper actions that redirect.]
		
Part 3.4.1 - Fucking

Fucking is an action applying to one touchable thing.
The specification of the fucking action is "Fucking is a helper action that can allows the player to target a person, and logic is applied to decide what parts are supposed to be involved. Redirects to the fucking it with action."

Chapter 3.4.1a - Understanding

Understand "fuck [something]" as fucking.
Does the player mean fucking a person: It is likely.
Does the player mean fucking something orificial: It is likely.

Chapter 3.4.1b - Redirecting

Check an actor fucking (This is the fucking redirect rule):
	[Case 1: The target is an orifice, and we need to find a suitable penetrator:]
	If the noun provides the property orificial and the noun is orificial:
		If the actor is enclosing a penis (called P):
			Try the actor fucking the noun with P instead;
		If the actor is enclosing a penetrating body part (called P):
			Try the actor fucking the noun with P instead;
		If the actor is wearing a penetrating garment (called P):
			Try the actor fucking the noun with P instead;
		If the actor is carrying a penetrating thing (called P):
			Try the actor fucking the noun with P instead;
	[Case 2: The target is a penetrator, and we need to find a suitable orifice and reverse:]
	If the noun provides the property penetrating and the noun is penetrating:
		If actor is enclosing a vagina (called V):
			Try the actor fucking V with the noun instead;
		If actor is enclosing an ass (called A):
			Try the actor fucking A with the noun instead;
		If actor is enclosing an orificial body part (called O):
			Try the actor fucking O with the noun instead;
	[Case 3: The target is a person, and we try to first find the penetrator then the orifice:]
		If actor is enclosing a penis (called P):
			If noun is enclosing a vagina (called V):
				Try the actor fucking V with P instead;
			If noun is enclosing an ass (called A):
				Try the actor fucking A with P instead;
			If noun is enclosing an orificial body part (called O):
				Try the actor fucking O with P instead;
		If the actor is enclosing a penetrating body part (called P):
			If noun is enclosing a vagina (called V):
				Try the actor fucking V with P instead;
			If noun is enclosing an ass (called A):
				Try the actor fucking A with P instead;
			If noun is enclosing an orificial body part (called O):
				Try the actor fucking O with P instead;
		If the actor is wearing a penetrating garment (called P):
			If noun is enclosing a vagina (called V):
				Try the actor fucking V with P instead;
			If noun is enclosing an ass (called A):
				Try the actor fucking A with P instead;
			If noun is enclosing an orificial body part (called O):
				Try the actor fucking O with P instead;
		If noun is enclosing a penis (called P):
			If actor is enclosing a vagina (called V):
				Try the actor fucking V with P instead;
		If the actor is carrying a penetrating thing (called P):
			If noun is enclosing a vagina (called V):
				Try the actor fucking V with P instead;
			If noun is enclosing an ass (called A):
				Try the actor fucking A with P instead;
			If noun is enclosing an orificial body part (called O):
				Try the actor fucking O with P instead;
	[Default: Unable to parse]
	If the actor is the player:
		Say "[We] [have] to be more specific about what should go where." (A);
	Else if the player can see the actor and the action is not silent:
		Say "[We] [have] to be more specific about what [the actor] should put where." (B);
	Stop the action;

Part 3.4.2 - Assfucking

Assfucking is an action applying to one touchable thing.
The specification of the assfucking action is "Assfucking is a helper action that can allows the player to target a person, and logic is applied to decide what parts are supposed to be involved. Redirects to the fucking it with action."

Chapter 3.4.2a - Understanding

Understand "assfuck [something]" as assfucking.
Does the player mean assfucking a person: It is likely.
Does the player mean assfucking an ass: It is likely.

Chapter 3.4.2b - Redirecting

Check an actor assfucking (This is the assfucking redirect rule):
	If the noun is an ass:
		Try the actor fucking the noun instead;
	Else if the noun is a person enclosing an ass (called A):
		Try the actor fucking the A instead;
	If the actor is the player:
		Say "[We] [can't] find a way to do that." (A);
	Else if the player can see the actor and the action is not silent:
		Say "[The actor] [can't] find a way to do that." (B);
	Stop the action;

Part 3.4.3 - Titfucking

Titfucking is an action applying to one touchable thing.
The specification of the titfucking action is "Titfucking is a helper action that can allows the player to target a person, and logic is applied to decide what parts are supposed to be involved. Redirects to the fucking it with action."

Chapter 3.4.3a - Understanding

Understand "titfuck [something]" as titfucking.
Does the player mean titfucking a person: It is likely.
Does the player mean titfucking a pair of breasts: It is likely.

Chapter 3.4.3b - Redirecting

Check an actor titfucking (This is the titfucking redirect rule):
	If the noun is a a pair of breasts:
		Try the actor fucking the noun instead;
	Else if the noun is a person enclosing a pair of breasts (called B):
		Try the actor fucking the B instead;
	If the actor is the player:
		Say "[We] [can't] find a way to do that." (A);
	Else if the player can see the actor and the action is not silent:
		Say "[The actor] [can't] find a way to do that." (B);
	Stop the action;

Book 3.5 - Discrete Arousal

[Status: Complete
Arousal has typically been implemented as a linear numeric system, with continuous incremental changes up to thresholds based on the actor and actions. This model typically leads to spamming 'g' (repeat) in order to raise the arousal so as to unlock new actions.
This extension uses Informs natural value enumeration to divide arousal into discrete values, which should provide a smoother and more natural progression. This part is just the bare bones, allowing the story author to use arousal as a decision making tool.
The system is extensible, but it assumes that unaorused is the neutral setting, and unattainable arousal is the last defined value.
In the template volume, this is extended into a full-blown stimulation and consent system.]

Part 3.5.1 - Definitions

Chapter 3.5.1a - Discrete Arousals

An arousal is a kind of value. The arousals are frigid arousal, unaroused, slightly aroused, aroused, very aroused, orgasmic, unattainable arousal.
The specification of arousal is "Arousal is a discrete measure of how aroused a person is. Unaroused is the neutral zero-point, with frigid arousal as a negative value and the unattainable arousal (as the last value defined) as the unset/null-value. These methods for arousing and cooling of a person will take these into account."

A person has an arousal called current arousal. The current arousal of a person is usually unaroused.

Chapter 3.5.1b - Orgasms

A person has a number called orgasms. The orgasms of a person is usually 0.
A person has a number called orgasmic attempts. The orgasmic attempts of a person is usually 0.

Part 3.5.2 - Working with Arousals

Part 3.5.2a - Comparisons

[Note: Unattainable is treated as a null value, and is never considered more or less than anything.]
To decide whether (P - a person) is (A - an arousal) or more:
	If the current arousal of P is the unattainable arousal, decide no;
	If the current arousal of P is at least A, decide yes;
	Decide no;

[Note: Unattainable is treated as a null value, and is never considered more or less than anything.]
To decide whether (P - a person) is (A - an arousal) or less:
	If the current arousal of P is the unattainable arousal, decide no;
	If the current arousal of P is at most A, decide yes;
	Decide no;

Part 3.5.2b - Arousing
	
[Increase the arousal of a person by one grade, with a maxmimum level.
Note: Unattainable is treated as a null value, and calls to increase to it are ignored.]
To arouse (P - a person) up to (A - an arousal):
	If the current arousal of P is less than A and A is not the unattainable arousal:
		Now the current arousal of P is the arousal after the current arousal of P;

[Increase the arousal of a person by one grade, without a maxmimum.
Note: Will not increase to the unattainable arousal.]
To arouse (P - a person):
	Arouse P up to (the arousal before the unattainable arousal);

Part 3.5.2c - Cooling Down

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

Part 3.5.2d - Attaining Orgasms

A person has an arousal called the orgasm reset arousal. The orgasm reset arousal of a person is usually aroused.

[We want to make it so that every time a person orgasms, it's harder to achieve the next one.
The chance to succed is attempts : orgasms; the first orgasm is 'free'; the second is 50% at first attempt and 100% at second, third is 1/3 then 2/3, and so on.]
To decide whether (P - a person) orgasms:
	If the current arousal of P is the unattainable arousal, decide no;
	If P is orgasmic or more:
		Increase the orgasmic attempts of P by 1;
		Let X be the orgasmic attempts of P;
		Let Y be the orgasms of P + 1;
		If a random chance of X in Y succeeds:
			Increase the orgasms of P by 1;
			Now the orgasmic attempts of P is 0;
			Now the current arousal of P is the orgasm reset arousal of P;
			Decide yes;
	Decide no;

Volume 4 - Support Systems

[This volume deals with out-of-game support systems to improve the experience for both the player and the author.
TODO:
Help System
Limits
Completion Tracking
Commentary System]
	
Volume 5 - Templates

[This volume provides ready-to-use templates that can be used in a story.]

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
A pair of thighs is usually touchable. A pair of thighs is usually rubbable.

A pair of legs is a kind of body part.
The cover locations of a pair of legs is usually {the leg area}.
They are usually plural-named. The indefinite article is usually "a". The plural of pair of legs is pairs of legs.
A pair of legs is usually touchable. A pair of legs is usually rubbable.

A pair of ankles is a kind of body part.
The cover locations of a pair of ankles is usually {the feet area, the leg area}.
They are usually plural-named. The indefinite article is usually "a". The plural of pair of ankles is pairs of ankles.

A pair of feet is a kind of body part.
The cover locations of a pair of feet is usually {the feet area}.
They are usually plural-named. The indefinite article is usually "a". The plural of pair of feet is pairs of feet.
A pair of feet is usually touchable. A pair of feet is usually rubbable. A pair of feet is usually tickleable. A pair of feet is usually lickable. A pair of feet is usually biteable.

Section - Arms

A pair of arms is a kind of body part.
The cover locations of a pair of arms is usually {the arm area}.
They are usually plural-named. The indefinite article is usually "a". The plural of pair of arms is pairs of arms.
A pair of arms is usually touchable. A pair of arms is usually rubbable.

A pair of wrists is a kind of body part.
The cover locations of a pair of wrists is usually {the hand area, the arm area}.
They are usually plural-named. The indefinite article is usually "a". The plural of pair of wrists is pairs of wrists.

A pair of hands is a kind of body part.
The cover locations of a pair of arms is usually {the hand area}.
They are usually plural-named. The indefinite article is usually "a". The plural of pair of hands is pairs of hands.
A pair of hands is usually touchable. A pair of hands is usually rubbable.

Chapter 5.1.1c - Torso

A neck is a kind of body part.
The cover locations of a neck is usually {the shoulder area}.
A neck is usually lickable. A neck is usually biteable.

A pair of shoulders is a kind of body part.
The cover locations of a pair of shoulders is usually {the shoulder area}.
They are usually plural-named. The indefinite article is usually "a". The plural of pair of shoulders is pairs of shoulders.
A pair of shoulders is usually rubbable. 

A chest is a kind of body part.
The cover locations of a chest is usually {the upper torso area}.
A chest is usually touchable. A chest is usually rubbable. A chest is usually tickleable. A chest is usually lickable. A chest is usually biteable.

A pair of breasts is a kind of body part.
The cover locations of a pair of breasts is usually {the upper torso area}. 
They are usually plural-named. The indefinite article is usually "a". The plural of pair of breasts is pairs of breasts. 
Understand "tit", "tits", "breast", "boob", "boobs", "tittie", "titties" and "juggs" as a pair of breasts.
A pair of breasts is usually touchable. A pair of breasts is usually rubbable. A pair of breasts is usually tickleable. A pair of breasts is usually lickable. A pair of breasts is usually biteable. A pair of breasts is usually pinchable.

A midriff is a kind of body part.
The cover locations of a midriff is usually {the lower torso area}.
Understand "stomach", "tummy" as midriff.
A midriff is usually touchable. A midriff is usually rubbable. A midriff is usually tickleable. A midriff is usually lickable.

A waist is a kind of body part.
The cover locations of a waist is usually {the lower torso area, the lower back area}.

A backside is a kind of body part.
The cover locations of a backside is usually {the upper back area, the lower back area}.

Chapter 5.1.1d - Crotch

An ass is a kind of body part.
The cover locations of an ass is usually {the crotch area}.
Understand "asshole", "anus", "rear", "rear end", "butt", "bottom", "rump" as ass.
An ass is usually touchable. An ass is usually rubbable. An ass is usually spankable. An ass is usually pinchable. An ass is usually lickable. An ass is usually orificial.

A penis is a kind of body part.
The cover locations of a penis is usually {the crotch area}.
Understand "cock", "dick", "wang", "dong", "wiener", "willy", "schlong", "boner", "pecker" as penis.
A penis is usually touchable. A penis is usually rubbable. A penis is usually pinchable. A penis is usually lickable. A penis is usually biteable. A penis is usually penetrating.

A vagina is a kind of body part.
The cover locations of a vagina is usually {the crotch area}.
Understand "pussy", "cunt", "slit", "crotch", "snatch", "clitoris", "clit", "twat" as vagina.
A vagina is usually touchable. A vagina is usually rubbable. A vagina is usually lickable. A vagina is usually orificial.

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
A pair of stockings is usually rippable. The ripping revealed cover areas of a pair of stockings is usually {thigh area}.

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

A pair of glasses is a kind of garment.
They are usually plural-named. The indefinite article is usually "a". The plural of glasses is pairs of glasses.
Understand "goggles", "eyewear" as pair of glasses.
The specification of pair of glasses is "Glasses go on the face, and are usually formal normalwear. Because of this, they will block direct access and view to face parts (such as the mouth); this is usually not a problem as kissing redirects to the person."
A pair of glasses is usually normalwear.
The cloth decency of pair of glasses is usually formal.
The cover areas of a pair of glasses is usually {face area}.

Chapter 5.1.2c - Overwear

[Overwear is the outer layer of clothing, and is only covered by outerwear (clothing that is meant for outside use).]

A dress is a kind of garment.
The specification of a dress is "A dress covers the entire torso (front and back), as well as the arms/shoulders and thighs/legs. It is usually formal and outerwear. This means a shirt under it, but not a sweater can be worn over it. Making it normalwear would also make for some interesting interactions with pantyhose and trousers. By default a dress can be unbuttoned to access the upper torso; to change this to make it raisable to access the crotch see the definition of minidress (you might also want to change default cover blocking).
Note; Dresses go under boots, which might cause some issues if boots are modified to cover legs/thighs."
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
The specification of a suit is "A suit is really a combination of a sweater-jacket and pants. It's usually formal overwear, and covers the  front and back of the torso, arms, legs/thighs and crotch. It can be unzipped to access the crotch."
The cover areas of a suit is usually {upper torso area, lower torso area, arm area, shoulder area, upper back area, lower back area, leg area, thigh area, crotch area}.
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

Part 5.1.3 - Toy Box

Chapter 5.1.3 - Sex Toy

A sex toy is a kind of thing.
The specification of a sex toy is "A sex toy is a thing that is intended for use with the fucking it with action, and therefore supports the adjectives penetrating and orificial. It is usually penetrating but not orificial."

A sex toy can be penetrating. A sex toy is usually penetrating.
A sex toy can be orificial. A sex toy is usually not orificial.

Chapter 5.1.4 - Strap-On

A strap-on is a kind of garment.
The specification of a strap-on is "A strap-on is a special garment that is intended for use with the fucking it with action, and therefore also supports the adjective penetrating (which it usually is). It is indecent and outerwear, so it can be worn over pants and dresses if needed."

A strap-on can be penetrating. A strap-on is usually penetrating.
A strap-on is usually outerwear.
The cloth decency of a strap-on is usually indecent.
A strap-on is usually allow touching through.
The cover areas of a strap-on is usually {crotch area}.

Part 5.1.4 - Furniture

[Status: Awaiting implementation of posturing.
TODO]

Book 5.2 - Discrete Arousal-based Consent and Stimulation

[Status: Complete
This books deals with integrating the discrete arousals into the stimulation and consent framework of the actions, to create a basis system that grants consent based on arousal. It's separated into it's own part in order to make it easier to excise it if needed, like if the author wants to use a numerical arousal system.
The underlying parts deals with responses of the actors, action integration and custom values for the templated body parts.]

Part 5.2.1 - Responses

[Status: Complete
If an action is stopped because the actors aren't interested (either in each other, or the arousal threshold is unattainable), then the uninterested response should be issued. If the action is stopped because the current arousal isn't high enough (yet), then the unaroused response should be issued.]

A person has some text called the uninterested response. The uninterested response of a person is usually "'That's not going to happen,' [printed name] says cooly."
A person has some text called the unaroused response. The unaroused response of a person is usually "'Not yet,' [printed name] says softly."

Part 5.2.2 - Action Integration

[Status: Mostly complete
For now we assume that the player always consents; this is something that should be remade into a variable later on. (TODO)
In order to keep the number of default variables down so as to simplify the author's job, most actions are grouped together:

Dressing:	Wearing, taking (off)
Soft-play:	Touching, rubbing, tickling, kissing, hugging, dancing.
Rough-play:	Spanking, pinching, biting
Oral-play:	Licking
Fucking

Each of these groups function in a similar manner:
Consent is given if the actors have each other as love-interests, and the current arousal of the actors are atleast the arousal threshold for the action group. For body parts, the lowest threshold of the part and the person it's attached to is taken into consideration.
Stimulation is similarly handled, being increased one level up to the cap for the group. For body parts, the higher of the person's and the body part's cap is used. There are two caps for each group, one for being the active participant and one for being the passive.

Additionally, there's a check to see if the two actors want to interact with each other, which is used as a default deny rule.]

Chapter 5.2.2a - General Requirements

[A person has a list of other actors they are willing to engage with. Make sure that all people potentially involved are listed in each others love interests.
If the interactor is listed, make no decision in order to allow other rules to be consulted as well.]

A person has a list of people called love interests.

[Always check the love interests first.]
The love interest consent rule is listed first in the consent rules.

A consent rule (this is the love interest consent rule):
	[Determine which people are involved]
	Let first person be the actor;[TODO: This must be redone]
	If the noun is a thing:
		If the noun is a person:
			Let first person be the noun;
		Else if the noun is part of a person (called P):
			Let first person be P;
		Else if the noun is held by a person (called P):
			Let first person be P;
	Let second person be the actor;
	If the second noun is a thing:
		If the second noun is a person:
			Let second person be the second noun;
		Else if the second noun is part of a person (called P):
			Let second person be P;
		Else if the second noun is held by a person (called P):
			Let second person be P;	
	[Check love interests for actor]
	Unless actor is the player:
		Say "Testing interest of Person0.";
		If first person is a person and first person is not listed in the love interests of the actor:
			Say the uninterested response of the actor;
			Deny consent;
		If second person is a person and second person is not listed in the love interests of the actor:
			Say the uninterested response of the actor;
			Deny consent;
	[Check love interests for first person]
	If first person is a person and first person is not the player:
		Say "Testing interest of Person1.";
		If actor is not listed in the love interests of the first person:
			Say the uninterested response of the first person;
			Deny consent;
		If second person is a person and second person is not listed in the love interests of the first person:
			Say the uninterested response of the first person;
			Deny consent;
	[Check love interests for second person]
	If second person is a person and second person is not the player:
		Say "Testing interest of Person0.";
		If actor is not listed in the love interests of the actor:
			Say the uninterested response of the second person;
			Deny consent;
		If first person is a person and first person is not listed in the love interests of the second person:
			Say the uninterested response of the second person;
			Deny consent;
	[Defer to other rules]
	Make no decision;

Chapter 5.2.2b - Clothing

[Clothing threshold is the minimum arousal at which a person or a garment will (un-)dress.]
A person has an arousal called the clothing threshold. The clothing threshold of a person is usually slightly aroused.
A garment has an arousal called the clothing threshold. The clothing threshold of a garment is usually slightly aroused.

Section - Wearing

A default-consent rule (this is the dressing consent rule):
	If the noun is a garment (called G):
		Unless the actor is the player:
			If the clothing threshold of the actor is the unattainable arousal
			or the clothing threshold of G is the unattainable arousal:
				Say the uninterested response of the actor;
				Deny consent;
			Unless the actor is the clothing threshold of the actor or more
			and the actor is the clothing threshold of G or more:
				Say the unaroused response of the actor;
				Deny consent;
	Give consent;

A consent rule for an actor wearing something (this is the dressing default consent rule): Abide by the dressing consent rule;

Section - Worn Garments

A default-consent rule (this is the undressing consent rule):
	If the noun is a garment (called G) and G is worn:
		Let P be the holder of G;
		Unless the actor is the player:
			If the clothing threshold of the actor is the unattainable arousal
			or the clothing threshold of G is the unattainable arousal:
				Say the uninterested response of the actor;
				Deny consent;
			Unless the actor is the clothing threshold of the actor or more
			and the actor is the clothing threshold of G or more:
				Say the unaroused response of the actor;
				Deny consent;
		Unless P is the player:
			If the clothing threshold of P is the unattainable arousal
			or the clothing threshold of G is the unattainable arousal:
				Say the uninterested response of P;
				Deny consent;
			Unless P is the clothing threshold of P or more
			and P is the clothing threshold of G or more:
				Say the unaroused response of the P;
				Deny consent;
	Give consent;

A consent rule for an actor taking off something (this is the undressing default consent rule): Abide by the undressing consent rule;
A consent rule for an actor taking a garment (this is the taking off default consent rule): Abide by the undressing consent rule;
A consent rule for an actor ripping a garment (this is the ripping default consent rule): Abide by the undressing consent rule;
A consent rule for an actor shifting a garment (this is the shifting default consent rule): Abide by the undressing consent rule;
A consent rule for an actor unshifting a garment (this is the unshifting default consent rule): Abide by the undressing consent rule;

Chapter 5.2.2c - Soft-play

[This part deals with the "soft" touching actions, which share the same thresholds by default.]

[Soft-play threshold is the minimum arousal at which a person or it's body part will engage in the soft-play actions.]
A person has an arousal called the soft-play threshold. The soft-play threshold of a person is usually slightly aroused.
A body part has an arousal called the soft-play threshold. The soft-play threshold of a body part is usually slightly aroused.

[Active/passive soft-play arousal is the arousal attainable by soft-play actions, as the active and passive participant.]
A person has an arousal called the soft-play performer limit. The soft-play performer limit of a person is usually aroused.
A person has an arousal called the soft-play recipient limit. The soft-play recipient limit of a person is usually aroused.
A body part has an arousal called the soft-play performer limit. The soft-play performer limit of a body part is usually aroused.
A body part has an arousal called the soft-play recipient limit. The soft-play recipient limit of a body part is usually aroused.

[Create a default consent rule]
A default-consent rule (this is the soft-playing consent rule):
	[Check consent for the actor first; we assume that the player always consent.]
	Unless the actor is the player:
		If the soft-play threshold of the actor is the unattainable arousal:
			Say the uninterested response of the actor;
			Deny consent;
		Unless the actor is the soft-play threshold of the actor or more:
			Say the unaroused response of the actor;
			Deny consent;
	[Check consent for the noun directly]
	If the noun is a person:
		Unless the noun is the player:
			If the soft-play threshold of the noun is the unattainable arousal:
				Say the uninterested response of the noun;
				Deny consent;
			Unless the noun is the soft-play threshold of the noun or more:
				Say the unaroused response of the noun;
				Deny consent;
	Else if the noun is a body part:
		Let P be the holder of the noun;
		Unless P is the player:
			If the soft-play threshold of the noun is the unattainable arousal:
				Say the uninterested response of P;
				Deny consent;
			If the soft-play threshold of P is the unattainable arousal:
				Say the uninterested response of P;
				Deny consent;
			Unless P is the soft-play threshold of the noun or more:
				Say the unaroused response of P;
				Deny consent;
			Unless P is the soft-play threshold of P or more:
				Say the unaroused response of P;
				Deny consent;
	Give consent;

A consent rule for an actor touching (this is the default touching consent rule): Abide by the soft-playing consent rule;
A consent rule for an actor rubbing (this is the default rubbing consent rule): Abide by the soft-playing consent rule;
A consent rule for an actor tickling (this is the default tickling consent rule): Abide by the soft-playing consent rule;
A consent rule for an actor kissing (this is the default kissing consent rule): Abide by the soft-playing consent rule;
A consent rule for an actor hugging (this is the default hugging consent rule): Abide by the soft-playing consent rule;
A consent rule for an actor dancing (this is the default dancing consent rule): Abide by the soft-playing consent rule;

[Create a default stimulation rule]
A default-stimulation rule (this is the soft-playing stimulation rule):
	[Stimulate the actor first:]
	Arouse the actor up to the soft-play performer limit of the actor;
	If the noun is a person:
		Arouse the noun up to the soft-play recipient limit of the noun;
	Else if the noun is a body part:
		Let P be the holder of the noun;
		Let target arousal be the soft-play recipient limit of the noun;
		If the soft-play recipient limit of P is greater than the target arousal:
			Let target arousal be the soft-play recipient limit of P;
		Arouse P up to target arousal;
	Stimulated;

A stimulation rule for an actor touching (this is the default touching stimulation rule): Abide by the soft-playing stimulation rule;
A stimulation rule for an actor rubbing (this is the default rubbing stimulation rule): Abide by the soft-playing stimulation rule;
A stimulation rule for an actor tickling (this is the default tickling stimulation rule): Abide by the soft-playing stimulation rule;
A stimulation rule for an actor kissing (this is the default kissing stimulation rule): Abide by the soft-playing stimulation rule;
A stimulation rule for an actor hugging (this is the default hugging stimulation rule): Abide by the soft-playing stimulation rule;
A stimulation rule for an actor dancing (this is the default dancing stimulation rule): Abide by the soft-playing stimulation rule;

Chapter 5.2.2d - Rough Play

[This part deals with the "rough" actions, which share the same thresholds by default.]

[Rough-play threshold is the minimum arousal at which a person or it's body part will engage in the rough-play actions.]
A person has an arousal called the rough-play threshold. The rough-play threshold of a person is usually very aroused.
A body part has an arousal called the rough-play threshold. The rough-play threshold of a body part is usually very aroused.

[Active/passive rough-play arousal is the arousal attainable by rough-play actions, as the active and passive participant.]
A person has an arousal called the rough-play performer limit. The rough-play performer limit of a person is usually very aroused.
A person has an arousal called the rough-play recipient limit. The rough-play recipient limit of a person is usually very aroused.
A body part has an arousal called the rough-play performer limit. The rough-play performer limit of a body part is usually very aroused.
A body part has an arousal called the rough-play recipient limit. The rough-play recipient limit of a body part is usually very aroused.

[Create a default consent rule]
A default-consent rule (this is the rough-playing consent rule):
	[Check consent for the actor first; we assume that the player always consent.]
	Unless the actor is the player:
		If the rough-play threshold of the actor is the unattainable arousal:
			Say the uninterested response of the actor;
			Deny consent;
		Unless the actor is the rough-play threshold of the actor or more:
			Say the unaroused response of the actor;
			Deny consent;
	[Check consent for the noun directly]
	If the noun is a person:
		Unless the noun is the player:
			If the rough-play threshold of the noun is the unattainable arousal:
				Say the uninterested response of the noun;
				Deny consent;
			Unless the noun is the rough-play threshold of the noun or more:
				Say the unaroused response of the noun;
				Deny consent;
	Else if the noun is a body part:
		Let P be the holder of the noun;
		Unless P is the player:
			If the rough-play threshold of the noun is the unattainable arousal:
				Say the uninterested response of P;
				Deny consent;
			If the rough-play threshold of P is the unattainable arousal:
				Say the uninterested response of P;
				Deny consent;
			Unless P is the rough-play threshold of the noun or more:
				Say the unaroused response of P;
				Deny consent;
			Unless P is the rough-play threshold of P or more:
				Say the unaroused response of P;
				Deny consent;
	Give consent;

A consent rule for an actor spanking (this is the default spanking consent rule): Abide by the rough-playing consent rule;
A consent rule for an actor pinching (this is the default pinching consent rule): Abide by the rough-playing consent rule;
A consent rule for an actor biting (this is the default biting consent rule): Abide by the rough-playing consent rule;

[Create a default stimulation rule]
A default-stimulation rule (this is the rough-playing stimulation rule):
	[Stimulate the actor first:]
	Arouse the actor up to the rough-play performer limit of the actor;
	If the noun is a person:
		Arouse the noun up to the rough-play recipient limit of the noun;
	Else if the noun is a body part:
		Let P be the holder of the noun;
		Let target arousal be the rough-play recipient limit of the noun;
		If the rough-play recipient limit of P is greater than the target arousal:
			Let target arousal be the rough-play recipient limit of P;
		Arouse P up to target arousal;
	Stimulated;

A stimulation rule for an actor spanking (this is the default spanking stimulation rule): Abide by the rough-playing stimulation rule;
A stimulation rule for an actor pinching (this is the default pinching stimulation rule): Abide by the rough-playing stimulation rule;
A stimulation rule for an actor biting (this is the default biting stimulation rule): Abide by the rough-playing stimulation rule;

Chapter 5.2.2e - Oral Play

[This part deals with the "oral" actions, which share the same thresholds by default.]

[Oral-play threshold is the minimum arousal at which a person or it's body part will engage in the oral-play actions.]
A person has an arousal called the oral-play threshold. The oral-play threshold of a person is usually aroused.
A body part has an arousal called the oral-play threshold. The oral-play threshold of a body part is usually aroused.

[Active/passive oral-play arousal is the arousal attainable by oral-play actions, as the active and passive participant.]
A person has an arousal called the oral-play performer limit. The oral-play performer limit of a person is usually very aroused.
A person has an arousal called the oral-play recipient limit. The oral-play recipient limit of a person is usually very aroused.
A body part has an arousal called the oral-play performer limit. The oral-play performer limit of a body part is usually very aroused.
A body part has an arousal called the oral-play recipient limit. The oral-play recipient limit of a body part is usually very aroused.

[Create a default consent rule]
A default-consent rule (this is the oral-playing consent rule):
	[Check consent for the actor first; we assume that the player always consent.]
	Unless the actor is the player:
		If the oral-play threshold of the actor is the unattainable arousal:
			Say the uninterested response of the actor;
			Deny consent;
		Unless the actor is the oral-play threshold of the actor or more:
			Say the unaroused response of the actor;
			Deny consent;
	[Check consent for the noun directly]
	If the noun is a person:
		Unless the noun is the player:
			If the oral-play threshold of the noun is the unattainable arousal:
				Say the uninterested response of the noun;
				Deny consent;
			Unless the noun is the oral-play threshold of the noun or more:
				Say the unaroused response of the noun;
				Deny consent;
	Else if the noun is a body part:
		Let P be the holder of the noun;
		Unless P is the player:
			If the oral-play threshold of the noun is the unattainable arousal:
				Say the uninterested response of P;
				Deny consent;
			If the oral-play threshold of P is the unattainable arousal:
				Say the uninterested response of P;
				Deny consent;
			Unless P is the oral-play threshold of the noun or more:
				Say the unaroused response of P;
				Deny consent;
			Unless P is the oral-play threshold of P or more:
				Say the unaroused response of P;
				Deny consent;
	Give consent;

A consent rule for an actor licking (this is the default licking consent rule): Abide by the oral-playing consent rule;

[Create a default stimulation rule]
A default-stimulation rule (this is the oral-playing stimulation rule):
	[Stimulate the actor first:]
	Arouse the actor up to the oral-play performer limit of the actor;
	If the noun is a person:
		Arouse the noun up to the oral-play recipient limit of the noun;
	Else if the noun is a body part:
		Let P be the holder of the noun;
		Let target arousal be the oral-play recipient limit of the noun;
		If the oral-play recipient limit of P is greater than the target arousal:
			Let target arousal be the oral-play recipient limit of P;
		Arouse P up to target arousal;
	Stimulated;

A stimulation rule for an actor licking (this is the default licking stimulation rule): Abide by the oral-playing stimulation rule;

Chapter 5.2.2f - Fucking

[This part deals with the fucking.]

[Fuck-play threshold is the minimum arousal at which a person or it's body part will engage in the oral-play actions.]
A person has an arousal called the fuck-play threshold. The fuck-play threshold of a person is usually aroused.
A body part has an arousal called the fuck-play threshold. The fuck-play threshold of a body part is usually aroused.

[Active/passive fucking-play arousal is the arousal attainable by fucking, as the active and passive participant.]
A person has an arousal called the fuck-play performer limit. The fuck-play performer limit of a person is usually very aroused.
A person has an arousal called the fuck-play recipient limit. The fuck-play recipient limit of a person is usually very aroused.
A body part has an arousal called the fuck-play performer limit. The fuck-play performer limit of a body part is usually very aroused.
A body part has an arousal called the fuck-play recipient limit. The fuck-play recipient limit of a body part is usually very aroused.

[Create a default consent rule:
Due to prior checks, we assume that the actor is enclosing one of the nouns, so we only check consent for the controller of each noun:]
A default-consent rule (this is the fuck-playing consent rule):
	If the noun is a body part:
		Let P be the holder of the noun;
		Unless P is the player:
			If the fuck-play threshold of the noun is the unattainable arousal:
				Say the uninterested response of P;
				Deny consent;
			If the fuck-play threshold of P is the unattainable arousal:
				Say the uninterested response of P;
				Deny consent;
			Unless P is the fuck-play threshold of the noun or more:
				Say the unaroused response of P;
				Deny consent;
			Unless P is the fuck-play threshold of P or more:
				Say the unaroused response of P;
				Deny consent;
	Else if the noun is held:
		Let P be the holder of the noun;
		Unless P is the player:
			If the fuck-play threshold of P is the unattainable arousal:
				Say the uninterested response of P;
				Deny consent;
			Unless P is the fuck-play threshold of P or more:
				Say the unaroused response of P;
				Deny consent;
	If the second noun is a body part:
		Let P be the holder of the second noun;
		Unless P is the player:
			If the fuck-play threshold of the second noun is the unattainable arousal:
				Say the uninterested response of P;
				Deny consent;
			If the fuck-play threshold of P is the unattainable arousal:
				Say the uninterested response of P;
				Deny consent;
			Unless P is the fuck-play threshold of the second noun or more:
				Say the unaroused response of P;
				Deny consent;
			Unless P is the fuck-play threshold of P or more:
				Say the unaroused response of P;
				Deny consent;
	Else if the second noun is held:
		Let P be the holder of the second noun;
		Unless P is the player:
			If the fuck-play threshold of P is the unattainable arousal:
				Say the uninterested response of P;
				Deny consent;
			Unless P is the fuck-play threshold of P or more:
				Say the unaroused response of P;
				Deny consent;
	Give consent;

A consent rule for an actor fucking something with (this is the default fucking consent rule): Abide by the fuck-playing consent rule;

[Create a default stimulation rule:
Due to prior checks, we assume that the actor is enclosing one of the nouns, so we don't stimulate the actor directly.
We do need to make sure we don't stimulate a self-pleasuring actor twice.]
A default-stimulation rule (this is the fuck-playing stimulation rule):
	Let actor-stimulation be false;
	If the noun is a body part:
		Let P be the holder of the noun;
		If P is the actor:
			Let target arousal be the fuck-play performer limit of the noun;
			If the fuck-play performer limit of P is greater than the target arousal:
				Let target arousal be the fuck-play performer limit of P;
			Arouse P up to target arousal;
			Let actor-stimulation be true;
		Else:
			Let target arousal be the fuck-play recipient limit of the noun;
			If the fuck-play recipient limit of P is greater than the target arousal:
				Let target arousal be the fuck-play recipient limit of P;
			Arouse P up to target arousal;
	Else if the noun is held:
		Let P be the holder of the noun;
		If P is the actor:
			Arouse P up to the fuck-play performer limit of P;
			Let actor-stimulation be true;
		Else:
			Arouse P up to the fuck-play recipient limit of P;
	If the noun is a body part:
		Let P be the holder of the noun;
		If P is the actor:
			If actor-stimulation is true:
				Stimulated; [Actor controls both nouns, and stimulation is already achieved.]
			Let target arousal be the fuck-play performer limit of the noun;
			If the fuck-play performer limit of P is greater than the target arousal:
				Let target arousal be the fuck-play performer limit of P;
			Arouse P up to target arousal;
		Else:
			Let target arousal be the fuck-play recipient limit of the noun;
			If the fuck-play recipient limit of P is greater than the target arousal:
				Let target arousal be the fuck-play recipient limit of P;
			Arouse P up to target arousal;
	Else if the noun is held:
		Let P be the holder of the noun;
		If P is the actor:
			If actor-stimulation is true:
				Stimulated; [Actor controls both nouns, and stimulation is already achieved.]
			Arouse P up to the fuck-play performer limit of P;
		Else:
			Arouse P up to the fuck-play recipient limit of P;
	Stimulated;

A stimulation rule for an actor fucking something with (this is the default fucking stimulation rule): Abide by the fuck-playing stimulation rule;

Part 5.2.3 - Body Part Integration

[Status: Complete
Some of the template body parts should have different arousal thresholds and caps.
We set them all explicitly, even if some are the same as the default values.]

Chapter 5.2.3a - Ass

[No Change: The soft-play threshold of an ass is usually slightly aroused.]
The soft-play performer limit of an ass is usually very aroused.
The soft-play recipient limit of an ass is usually very aroused.

[No Change: The rough-play threshold of an ass is usually very aroused.]
[No Change: The rough-play performer limit of an ass is usually very aroused.]
[No Change: The rough-play recipient limit of an ass is usually very aroused.]

[No Change: The oral-play threshold of an ass is usually aroused.]
The oral-play performer limit of an ass is usually aroused.
[No Change: The oral-play recipient limit of an ass is usually very aroused.]

[No Change: The fuck-play threshold of an ass is usually very aroused.]
[No Change: The fuck-play performer limit of an ass is usually very aroused.]
[No Change: The fuck-play recipient limit of an ass is usually very aroused.]

Chapter 5.2.3b - Breasts

The soft-play threshold of a pair of breasts is usually aroused.
The soft-play performer limit of a pair of breasts is usually very aroused.
The soft-play recipient limit of a pair of breasts is usually very aroused.

[No Change: The rough-play threshold of a pair of breasts is usually very aroused.]
[No Change: The rough-play performer limit of a pair of breasts is usually very aroused.]
[No Change: The rough-play recipient limit of a pair of breasts is usually very aroused.]

[No Change: The oral-play threshold of a pair of breasts is usually aroused.]
[No Change: The oral-play performer limit of a pair of breasts is usually very aroused.]
[No Change: The oral-play recipient limit of a pair of breasts is usually very aroused.]

The fuck-play threshold of a pair of breasts is usually aroused.
[No Change: The fuck-play performer limit of a pair of breasts is usually very aroused.]
[No Change: The fuck-play recipient limit of a pair of breasts is usually very aroused.]

Chapter 5.2.3c - Penis

The soft-play threshold of a penis is usually aroused.
The soft-play performer limit of a penis is usually very aroused.
The soft-play recipient limit of a penis is usually orgasmic.

[No Change: The rough-play threshold of a penis is usually very aroused.]
[No Change: The rough-play performer limit of a penis is usually very aroused.]
[No Change: The rough-play recipient limit of a penis is usually very aroused.]

[No Change: The oral-play threshold of a penis is usually aroused.]
[No Change: The oral-play performer limit of a penis is usually very aroused.]
The oral-play recipient limit of a penis is usually orgasmic.

[No Change: The fuck-play threshold of a penis is usually very aroused.]
The fuck-play performer limit of a penis is usually orgasmic.
The fuck-play recipient limit of a penis is usually orgasmic.

Chapter 5.2.3d - Vagina

The soft-play threshold of a vagina is usually aroused.
The soft-play performer limit of a vagina is usually very aroused.
The soft-play recipient limit of a vagina is usually orgasmic.

[No Change: The rough-play threshold of a vagina is usually very aroused.]
[No Change: The rough-play performer limit of a vagina is usually very aroused.]
[No Change: The rough-play recipient limit of a vagina is usually very aroused.]

[No Change: The oral-play threshold of a vagina is usually aroused.]
[No Change: The oral-play performer limit of a vagina is usually very aroused.]
The oral-play recipient limit of a vagina is usually orgasmic.

[No Change: The fuck-play threshold of a vagina is usually very aroused.]
The fuck-play performer limit of a vagina is usually orgasmic.
The fuck-play recipient limit of a vagina is usually orgasmic.



Erotic Storytelling ends here.

---- DOCUMENTATION ----

Chapter 1 - Using this Extension

To use this framework, you need to download and install it (which you probably have if you're reading this) and include it in your story:

*:
	Include Version 1 of Adult Framework by Fictitious Frode.

By including this extension, you will enable most of what's necessary to write erotic stories.
Most of the content is not automatically available out-of-the-box, but have to be specifically included by the author for the player to notice.
The only parts available by default, are the expanded actions (listed in the action overview below), but these don't do anything without proper targets such as the templated garments and body parts.
There is also an introductory warning/information screen at the start of the story, which is governed by the 'warn of adult content' activity.
[TODO: Implement said activity]

The sections of this chapter introduces the various concepts available within the extension, and subsequent chapters will go into further detail.
Towards the end of the documentation you will find a fully fleshed out tutorial and sample adventure, and a complete technical reference.
All kinds and actions are also documented inside the Inform IDE.

Note; Inform can behave slightly odd regarding the naming (and creation) of things which are part of the character, this is described in chapter 4.15 of Writing with Inform.
If the player is declared after the creation of the body part, then the body part will be named after what the character was named.
Also, any gender-specific creations might not occur if the gender of the player was undetermined at that point.
Likewise, changing the identity of the player during play might give interesting results.

In short, declare the persons(especially the player) with gender before invoking body part creation.

Section 1.1 - Documentation Overview

As this is quite a sprawling extension, a proper overview of what can be found in the documentation is in order.

	Chapter 1: An overview of the included concepts, necessary reading for using the extension.
	Chapter 2: A deeper look at the actions available, and how to make them work.
	Chapter 3: In-depth explanation of how the layered clothing system works. Mostly intended for advanced users who want customization.
	Chapter 4: Guidelines on how to write better descriptions, using both the hooks in the extension and Inform's standard rules.
	Chapter 5: Techniques for how to write better Non-Player Characters (NPCs) with the extension.
	Chapter 6: A complete technical reference for everything changed or added with this extension.
	Chapter 7: A tutorial on how to write Erotic Stories in Inform.

[TODO: List of examples]

Section 1.2 - Responses and Descriptions

Reduced to it's most basic components, an interactive fiction story (adult or not) can be seen as the printing of responses to the player's actions.
It follows that an extension should focus on making it easier for the story author to write these responses, taking care of the gritty details such as checking if actions are valid.
This allows the author to focus on the arguably more important features such as over-arching plotlines.

Inform offers several ways of altering responses for specific actions; Writing with Inform has several examples of varying text, and chapter 12.2 ("How actions are processed") goes into some detail on how action responses are chosen.
What follows is a quick overview of how to best utilize this extension to generate responses and description:

After: As the name implies, these rules are processed after the action has taken place, in place of the default action report rules.
This is where most custom responses would go.

Before/Instead: As the name implies, these rules are processed before the action takes place.
The difference (also implied by the naming) is that instead rules will stop the action from taking place (unless explicitly told to allow it to continue), while before rules are the opposite.
Instead rules are great for writing custom "errors" to the player, while the before rules are often used to flesh out some of the standard actions.

Descriptions: Descriptions are a special form of response, issued by the "x/examine" action.
All things in Inform can have the description property, which is printed when the thing is examined.
Two of the new kinds in this extension, garments and body parts, also have some special description properties that are printed under certain circumstances, while persons get an entire rulebook dedicated to generate descriptions.
See the later chapter "Descriptions in Detail" for more on this.

Persuasion/Consent: Persuasion is a built-in rulebook, and is invoked when the player asks another person to do something.
This can be a common occurence in AIFs, so it's important to include (or atleast give better persuasion failed rules).
Chapter 12.4 of Writing with Inform covers the use of persuasion.
Consent is a new rulebook for this extension, and is intended to work in a similar way, to allow persons the possibility to object to the player's actions if they are directly involved.
This is covered in more detail later on, in the chapter on Dealing with Actors.
Note that it's also possible to take advantage of the bundled Discrete-Arousal-based Consent and Stimulation (DACS) system.

Inform is quite smart about processing rulebooks, allowing you to write a mixture of general and specific rules, picking the most specific rule to process.
In general, the more specific the parameters are (a named person beats a generic person, and a templated body part beats the generic body part) the higher priority the rule gets.
Handily, if a scene is listed (with the during keyword), it's considered more specific than without.
This makes it very easy to give diferrent responses for the same action but at different times (scenes) in the story.
For reference, the exact laws used to sort rulebooks are described in 19.16.

Section 1.3 - Action Overview

The following table lists all the actions that are defined or modified in the extension:

	Table of Modified Actions
	Action	Category	Type
	Assfucking	Person	New	Redirect
	Biting	Body Part	New	Rough-play
	Dancing	Person	New	Soft-play
	Dressing	Clothing	New
	Fucking	Person	New	Redirect
	Fucking it with	Body Part	New	Fuck-play
	Hugging	Person	New	Soft-play
	Kissing	Person	Modified	Soft-play
	Licking	Body Part	New	Oral-play
	Pinching	Body Part	New	Rough-play
	Ripping	Clothing	New
	Rubbing	Body Part	Modified	Soft-play
	Shifting	Clothing	New
	Spanking	Body Part	New	Rough-play
	Stripping	Clothing	New
	Taking	Clothing	Modified
	Taking Off	Clothing	Modified
	Tickling	Body Part	New	Soft-play
	Titfucking	Person	New	Redirect
	Touching	Body Part	Modified	Soft-play
	Unshifting	Clothing	New
	Wearing	Clothing	Modified

These are detailed both in the IDE, and covered in Chapter 2 of this documentation.

Section 1.4 - Layering and Templates

A common feature to promote realism in AIFs, is clothing that can be examined and removed one piece at a time.
The most common technical implementation of this in libraries is called layered clothing.
In order to facilitate layered clothing, the extension uses cover areas to link people, body parts, and garments.
The technical peculiarities of this is covered in chapter 3, but the extension provides templates for garments and body part that cover most normal use.
Example A shows a simple setup with templated body parts and garments.
One notabale difference between garments and body parts is regarding to knowledge and visiblitity.
Garments that are not visible are considered to be concealed and un-interactive for the player, while body parts are always known regardless of visibility and can thus be refered to by the player.

While you're free to create your own body parts as you please, the extension comes with a variety of ready-made template parts you can use.
Here is an overview, with the most pertinent properties (See section 2.1) and the default decency (as implied by their cover locations):

	Ass (Indecent): touchable, rubbable, spankable, pinchable, lickable, orificial.
	pair of Ankles (Immodest): plural; 
	pair of Arms (Casual): plural; touchable, rubbable
	Backside (Immodest): rubbable, spankable
	pair of Breasts (Indecent): plural; touchable, rubbable, lickable, biteable, tickleable, pinchable
	Chest (Indecent): touchable, rubbable, lickable, biteable, tickleable
	pair of Eyes (Formal): plural
	Face (Formal): 
	pair of Feet (Immodest): plural; touchable, rubbable, lickable, biteable, tickleable
	Hair (Formal): plural (ambigously)
	pair of Hands (Formal): plural; touchable, rubbable
	Head (Formal): 
	pair of Legs (Casual): plural; touchable, rubbable
	Midriff (Immodest): touchable, rubbable, lickable, tickleable
	Mouth (Formal):
	Neck (Casual): lickable, biteable
	Penis (Indecent): touchable, rubbable, pinchable, lickable, biteable, penetrating.
	pair of Shoulders (Casual): plural; rubbable
	pair of Thighs (Immodest): plural; touchable, rubbable
	Vagina (Indecent): touchable, rubbable, lickable, orificial.
	Waist (Immodest): 
	pair of Wrists (Casual): plural;

Similar to body parts, Garments can also be created from the base kind, but the extension has most normal clothing available for use.
Below is an overview of the properties for the default garments; note that all of this is possible to change for specific garments.
There is also more informatin available in the kind listing in the IDE.

	Bodysuit (Indecent Underwear): Covers shoulder area, arm area, upper torso area, upper back area, lower torso area, lower back area, crotch area, thigh area, leg area and feet area (Or, everything except hands, head and face).
	Bra (Indecent Underwear): Covers upper torso/back; allow touching through.
	Mask (Immodest Underwear): Covers face and head.
	pair of Panties (Indecent Underwear): Covers crotch, but can be moved or ripped to reveal crotch; allow touching through; plural.
	Swimsuit (Immodest Underwear): Covers upper/lower torso, lower back/crotch, but can be moved aside to reveal upper torso area; allow touching through.
	Undershirt (Immodest Underwear): Covers upper/lower torso/back, but can be ripped to reveal upper torso; allow touching through.
	
	pair of Glasses (Formal Normalwear): Covers the face; plural.
	pair of Pantyhose (Formal Normalwear): Covers feet, leg, thigh and crotch, but can be ripped to expose crotch; allow touching through; plural.
	Shirt (Casual Normalwear): Covers upper/lower torso/back, arm and shoulder, but can be unbuttoned or ripped to reveal shoulder and upper/lower torso.
	pair of Socks (Formal Normalwear): Covers feet; allow touching through; plural.
	pair of Stockings (Formal Normalwear): Covers feet, leg and thigh, but can be ripped to expose thigh; allow touching through; plural.
	
	Dress (Casual Overwear): Covers upper/lower torso/back, shoulder, crotch, thigh and leg, but can be unbuttoned to reveal the shoulder and upper/lower torso (without altering full access).
	Minidress (Immodest Overwear): Covers upper/lower torso/back, shoulder, crotch, and thigh, but can be pulled up to reveal crotch and thigh.
	pair of Shorts (Casual Overwear): Covers thigh and crotch, but can be unzipped to reveal crotch; plural.
	Skirt (Casual Overwear): Covers thigh and crotch, but can be lifted up to reveal both.
	Suit (Casual Overwear): Combination of trousers and jacket, it covers upper/lower torso/back, shoulder, arm, crotch, thigh and leg. Can be unzipped to reveal crotch.
	Sweater (Casual Overwear): Covers upper/lower torso/back, shoulder and arm. Can be raised up to reveal the upper/lower torso.
	pair of Trousers (Casual Overwear): Covers leg, thigh and crotch, but can be unzipped to reveal crotch; plural.

	pair of Boots (Formal Outerwear): Covers feet and leg; plural.
	Coat (Formal Outerwear): Covers upper/lower torso/back, arm, shoulder, crotch and thigh. Can be unbuttoned to reveal upper/lower torso, crotch, thigh and shoulder.
	pair of Gloves (Formal Outerwear): Covers hand; plural.
	Hat (Formal Outerwear): Covers head.
	Jacket (Formal Outerwear): Covers upper/lower torso/back, arm, shoulder. Can be unbuttoned to reveal upper/lower torso.
	pair of Shoes (Formal Outerwear): Covers feet; plural.

Additionally, an outfit is a special kind of garment, designed to be an alternative to individual garment pieces the player can interact with.
It therefore cover almost all the body areas of a person, except hands and head/face.

Section 1.5 - Discrete Arousal-based Consent and Stimulation

Ever since the early days of AIF there has been a need to limit which actions an NPC is willing to let the player do, and two patterns quickly emerged.
ADRIFT games usually had a puzzle to solve to 'unlock the girl', after which anything you wanted was fair game.
TADS with it's more traditional programming language allowed more complex solutions, and ever since Moist(*) used 'excitement' with thresholds to control the flow of sex scenes, arousal-like mechanics have been a staple of TADS games.
The downside of using arousal thresholds, is that sex scenes quickly turn into guess-which-action-works (**), and then repeating that action untill you think a new action has been unlocked. 

Regardless of our feelings over arousal-based systems, there needs to be some mechanism in place to control which actions are permissible.
To accomplish this in Inform, this extension has settled on using 'Consent' as a new rulebook which works in a similar way to the existing rules for persuasion (which governs when the player asks an NPC to something).
This allows authors to write aribitrarily complex control mechanisms.

Not every author is technically inclined to write such a system though, so we also make available an optional system to grant consent based on the current arousal of the involved parties.
This is a similar approach to how the TADS libraries work.
First we have to decide how we want arousal represented; in traditional TADS, arousal was always represented as finite numbers with thresholds.
This extension has opted to use a discrete set of arousals, using Inform's support for enumerated values.
This has several benefits; the code is easier to read, and fewer discrete values makes it easier to model both for the author and the player exploring it.
Second, such a system isn't much use if the current arousal of a person is fixed, or left to the author to update manually for each action.
This led to the stimulation rules, which together with some default consent rules form the Discrete Arousal-based Consent and Stimulation-system (DACS for short).

This system isn't entirely enabled out of the box however, both to avoid unplanned sex-scenes and to make it optional.
There is a lot more that can be customized in the system, which is covered in the later chapter on NPCs.
To use the included DACS-system in your story, you have to do the following:

	1: Add the actors to the love interests of each other.
	2: Increase the arousal of any NPC to slightly aroused, or lower the threshold of an action to unaroused.

Example B shows a simple DACS setup with some customizations.

(*): I believe Moist was the first game to implement arousal, but feel free to correct me if you know of an earlier example than 1996.
(**): See 'Anatomy of a Sex Scene', by ExLibris. http://overanalysingaif.blogspot.no/2010/12/anatomy-of-sex-scene.html

Section 1.6 - Behavior Overview

A recurring difficulty in person-oriented IF, which most AIF are, is how to make people seem lifelike.
This problem manifests in several way, from the simple task of writing 'idle'-messages when the actor is not doing anything, to actors who roam around the map either randomly or goal oriented.
The standard approach to this in Inform, is to write 'every turn' rules, which work very well for goal oriented actors.
The problem arises when you have actors who are active only under certain conditions, and otherwise can idle.
Speaking as a player, it's also very frustrating to have a randomly loitering NPC wander away from you in the middle of an interaction.

From this, we can infer that a NPC has three different stages of behavior, that require different treatment:
At the most basic stage, a NPC without a goal might want to print a randomized text message ('idle') to show that they aren't just static scenery.
For characters that have a goal, we want to distinguish between planned and urgent behavior, with 'normal' planned behavior being postponed by interactions, but urgent behavior being executed regardless.
To facilitate this, the extension introduces a new stage in the turn processing rules, called the behavior stage, where we consult the urgent, planned and idle behavior rules for behavior-enabled persons.

The later chapter on NPCs covers this topic in detail, and Example C shows some sample interactive actors.

Section 1.7 - Version History

Release 1 (v2.0):

	Remake of the old AIF framework, reworking the previous extensions body parts, garments, outfits, erotic story actions and consent into one.

Section 1.8 - Contact Info

The author of this extension can be reached in the following ways:

	Mail: fictitious.frode@gmail.com
	Blog: https://informedaif.wordpress.com/ is a blog dedicated to writing AIF with Inform 7, and is the official host of the extension. It contains both dicussions around AIF and tutorials on both Inform in general and this extension in particular.
	Reddit: https://www.reddit.com/r/AIFCentral/ is the subreddit for the AIF community, and the author checks this regularly.
	GitHub: https://github.com/FictitiousFrode/AIF Contains the latest version of the extension, possibly including functionality that hasn't been released yet.

Feedback of all varieties is welcome, but constructive criticism and discussion is the most appreciated, along with reports of bugs and other issues.
For support I would appreciate using public communication, so that other may learn from the request as well.

Section 1.9 - Acknowledgments

The author of this extension would like to acknowledge the influence of several people in the AIF community, some of which are:

	Scarlet Herring and CCole; for providing the material of my first forays into AIF.
	Mr Flibble; for his excellent game 'The Magician's Nephew', which provided inspiration for parts of this extension.
	ExLibris; for sobering discussions on AIF in general.
	AnotherWannabe; whose AIF Library is a worthy alternative to this extension, with different priorities.
	ABomire and Dudeman; whose early work on AIF in I7 inspired me to start this journey.

A hearty round of applause to anyone who has contributed criticism, feedback, bug reports and the like during the development.

Chapter 2 - Player Actions

For most players, the most visible part of the extension is the erotic actions.
Understanding of how these actions work is therefore necessary in order to meet their expectations.
Section 1.3 gave a brief overview of the actions, grouped into three broad categories:
Those targeting either persons or body parts, and those that are clothing-related.
Each of these three categories will be explored below, after an introduction to the limiting factors that apply to varying degrees to all of them.

Section 2.1 - Limiting Factors

It's unrealistic (and rather boring) to expect that every erotic action would succeed in every occasion.
The actions go through a similar set of checks (with some exceptions) to verify that the action is feasible:

	The body part isn't part of the actor. Exceptions: touching/rubbing/spanking/dancing. Fucking is also a special case.
	The noun is the correct type (person/body part); some action tries to redirect to a noun of the correct type.
	The noun supports the action, through the adjectives listed below.
	The clothing of the person allows access to the noun
	The action is decent enough for the location
	The owner of the noun consents

The check to se whether the noun supports an action is done through a set of adjectives, which by default are defined for body parts.
These adjectives are named according to the related action, and the default negated form is the un- prefix.
The check does not assume that the noun is a body part however, so it would be possible to extend these adjectives to other things.
Some of the template body part have the adjective set, but this can be overriden both for specific parts and in general.
There are alsto two special adjectives, penetrating and orificial, which are used for the fucking action.
The adjectives, along with which templates they are set for, are:

	Biteable: Breasts, Feet, Neck, Penis
	Lickable: Ass, Breasts
	Orificial: Ass, Vagina
	Penetrating: Penis
	Pinchable: Ass, Breasts, Chest, Feet, Midriff, Neck, Penis, Vagina
	Rubbable: Arms, Ass, Backside, Breasts, Chest, Feet, Hands, Legs, Midriff, Penis, Shoulders, Thighs, Vagina
	Spankable: Ass, Backside
	Tickleable: Breasts, Chest, Feet, Midriff
	Touchable: Arms, Ass, Breasts, Chest, Feet, Hands, Legs, Midriff, Penis, Thighs, Vagina

Decency is intended to control what behavior is proper in a given location, and a new kind of value is implemented to control it.
By default, it has the four values indecent, immodest, casual and formal, as well as the undefined decency which works as a unset/null-values.
Every room has a decency threshold (which defaults to casual) that determines what is allowed in that room.
For garment related actions, the resulting decency is calculated and compared to the threshold, stopping any actions that would violate the threshold.
Attempts to violate the threshold by entering in the wrong state of undress is also similarly stopped.
Actions applying to body parts or persons are also compared to the threshold, and for ease of modification the values are stored in a global variable for each action:

*:
	The biting decency is initially indecent.
	The dancing decency is initially formal.
	The fucking decency is initially indecent.
	The hugging decency is initially formal.
	The kissing decency is initially casual.
	The licking decency is initially immodest.
	The pinching decency is initially immodest.
	The rubbing decency is initially immodest.
	The spanking decency is initially indecent.
	The tickling decency is initially immodest.
	The touching decency is initially immodest.

The last check is to see if all involved parties consent to the action, which is a separate rulebook described in section 5.1.
It's possible to use the builtin (optional) Discrete Arousal-based Consent and Stimulation system (DACS), which is described in Section 5.2.

As mentioned earlier, the actions are split into those who expects a person as the noun, and those that expect a body part.
The other checks are written to not assume that this check has been performed, in order for them to be reworked to allow more targets.
For instance, clothing coverage checks are only applied for body parts and garments, as those are the only two kinds for which clothing coverage rules apply.
This should make it possible to rework these limitations, but if you do choose to so take good care that the results are what you would expect.

Section 2.2 - Clothing-related

In order to make garments work as a special form of wearable things, some alterations to the standard actions dealing with wearing and taking off was needed.
In order to allow undressing by other parties than the wearer, some changes to the taking action was also needed.
These actions are covered in this section, while chapter 3 will describe how coverage works in more detail.

When wearing a garment, we check that the current clothing coverage state allows the garment to be put on.
We also check that the size of the garment matches the wearer, which is purely a cosmetic check intended to easily limit garments to a certain person.
For removing garments, we check that current clothing coverage state allows sufficient access to take off the garment, and that the decency revealed by taking it off doesn't conflict with the location's decency threshold.
In order to allow the taking action to remove worn garments from others, we had to make a small exception in the can't take people's possessions rule, to not block worn garments.
All of these actions also require the consent of the (potential) wearer of the garment.
Lastly, a person taking off garments usually keeps them afterwards, but this behavior can be changed to dropping the clothes by stating that they are 'not keep clothes after undress'.

There is also two helper actions for wholesale changing of clothes.
Stripping is as the name implies the act of taking off every worn garment, in the correct order.
There are no special checks done for stripping, instead relying on each garment being taken off in turn.
Similarly, dressing makes the person try to put on the garments listed in their preferred clothing property.
Note that these actions are intended for players; in order to support changing clothes "behind the scenes" you can use the 'force dress' and 'force strip' methods.

Garments can also be shifted into other states to allow more access (detailed in Section 3.2), so we need some actions to implement this behavior.
Shifting is a temporary change into a more open state, while ripping is permanent and not compatible with shifting.
The shifting action thus checks that the garment is worn, can be shifted, is not ripped and is not already shifted before the usual checks of access, decency and consent.
Unshifting does a similiar check that the garment can be shifted and is already shifted, before checking access and consent.
Ripping is similar to shifting, and checks that the garment can be ripped and isn't already so before checking access, decency and consent.
The necessary access for these actions, is that all the modified cover areas of the garment are not covered by another garment.
Thus you only need the crotch to be accessible to unzip a pair of pants.

Section 2.3 - Person-related

While many erotic actions are very detail oriented, and thus expects a body part as the noun, there are some actions for which the usual context is the other person itself.
The most obvious are perhaps hugging and dancing, but kissing is a borderline case in that players would sometimes want to kiss specific body parts as well as the person.
In order to keep the required responses at a reasonable level, we assume that kissing a body part is similar to licking it, and redirect to the licking action instead.
A player might also expect an order to 'fuck someone' to work, even though that action involves body parts.
We therefore create some helper actions that redirect to using the correct nouns with the fucking it with action.
In total, we have six person related actions; a reworking of the existing kissing action, the new hugging and dancing with actions, and three helper actions that redirect to fucking it with.

Dancing with is a slightly special action; it's valid to use without a noun, implying that a person dances with themself. Thus the command "Dance" turns into "Dance with yourself" for the purpose of responses and consent.
Hugging is a rather simple action, checking that a person does not try to hug oneself.
We've already briefly covered kissing; the standard rules of Inform block the action. 
We interfere and redirect attempts to kiss body parts to lick them instead, and allow kissing people while blocking any other types of noun. 
For all three actions, the decency of the action is checked against the location's decency threshold, and the consent rules is consulted.

The helping action fucking goes through a rather complex algorithm to try to determine what are the relevant penetrator and orifice, and then redirects to that.
Assfucking and titfucking however already have the orifice specified, and only tries to find a relevant penetrator.
Note that the breasts template is not orificial by default, which will stop titfucking from taking place.
The titfucking command is provided regardless as an option for authors, and provide proper error messages for players.

Section 2.4 - Body Part-related

Settling on which actions to support in a story can be quite an onerous task.
Too few actions risks losing the immersion of the player, while too many leads to a significant workload for the author, and players might not even find most of the responses.
Luckily, by using the adjectives controlling which parts are applicable, we can keep the number of valid responses down while still giving the player some agency.
With that in mind, the extension has settled on providing a mixture of 'soft', 'active' and 'rough' actions. 

The touching and rubbing actions are part of the standard library in Inform 7, so while the acts are similar they should be treated distinctly.
As the specification states, touching is just that: touching something without applying pressure, while rubbing is more active.
There's nothing wrong with redirecting rubbing to touching through an instead of rule or the like, to cut down on the number of action responses.
Both follow the general limiting factors set out in section 2.1 in mostly the same way, but both touching and rubbing can be done to yourself.
The clothing coverage check allows for some garments to be 'allow touching through', which allows these action to succeed even if the part in question is obscured by the garment.

To cater to more special conditions, we also have the tickling, pinching and spanking actions, of which only spanking can be done to oneself.
Apart from that, these actions also follow the general limiting factors set out in section 2.1 in mostly the same way.
Similar to touching and rubbing, the clothing coverage check here takes into account 'allow touching through' on the covering garments.
The scope of which things these actions apply to can be controlled by the adjectives described in section 2.1, and both spanking and tickling are by default severly limited.

Besides kissing (which target persons), we have licking and biting as the oral-oriented actions.
Unlike the touching actions, these require bare skin contact, which means that atleast one cover area of the body part is not covered by garments.

Lastly, we have perhaps the most important action, fucking it with.
Unlike the previous body part actions, it's associated with two adjectives: orificial and penetrating, and requires one thing of each type.
Although it supports the player providing the nouns in any order, for writing responses it's important to use the orifice as the first noun and the penetrator as the second.
The special nature of dealing with two nouns also means we must take some other checks than usual:
We assure that the actor is in fact in control of atleast one of the two nouns; and if the actor should happen to control both, we ensure that they aren't both attached to the actor.
Lastly we ensure that any involved body parts or garments, are not covered by (other) garments.

Chapter 3 - Layering and Coverage

Clothing and body parts have several overlapping qualities, but are still easily distinguishable from each other.
They can both be covered, but only clothing can be the covering part of this relationship.
The natural way to model this in Inform is using relationships, and the Inform documentation has an implementation of layered clothing in example 242.
Unfortunately, there are several fatal flaws with this approach.
Firstly, because relations can only be between things and not kinds, the amount of relations needed to keep track scales geometrically with the number of dressed actors.
Partial coverage also becomes very problematic without impressing an unwanted amount of body parts onto the story author:
If a person was wearing a long coat and a pair of pants, then these would overlap in the crotch and thigh, but if those were the only parts implemented that the pants covered, they would turn invisible for the player.

The first version of this framework tried to turn example 242 into a full blown clothing model, but in the end it was better to start from scratch using the cover area model that's been used in TADS.
By using cover area to link body parts with garments and defining a depth/clothing level for garments, it's possible to calculate coverage based on what is worn without costly all-to-all relations.
This approach is less flexible than using relations, but it's more workable even though it results in some oddities.
For instance, socks are defined as normalwear instead of underwear in order to make them incompatible with pantyhose, which has to be able to be worn over underwear.
A case could me made for a hybrid model, using cover areas for coverage and relations for depth, but that is left as an excercise for the reader.

Section 3.1 - Kinds and Templates

The technical implementation breaks a person down into cover areas, stored in the body area list property for each person.
Body parts can then be assigned to be in one or more cover areas, stored in the cover locations for each body part.
Cover areas are defined in the Table of Coverage, which links a given area to a decency.

Garments are then implemented as a type of clothing that can be worn over cover areas in layers.
For simplicity this layering is discrete using the new kind of value clothing layer.
Determining the cover areas that a garment covers is slightly more complex, because the system supports garments that can be altered to be more revealing.
Each garment has a default list of areas covered, stored in the cover areas property.
Depending on the status of the garment, this list can be modified by either the shifting revealed cover areas or ripping revealed cover areas, and the MODIFIED COVERED AREAS OF (garment) phrase selects the correct list of cover areas based on the garment's status.
This is detailed further in section 3.3.
Garments also have a clothing size property that is used to match against the clothing size of a person.
Every person and garments defaults to the same size, but this is an easy way of limiting certain garments to certain persons.

Not every person needs to have a complete set of garments, and some stories might not want to deal with a detailed clothing system.
Outfits serve this purpose, it's a special kind of garment that is incompatible with any other garments, and covers everything except the hands and head/face.

The garment and body part kinds can be used to create parts and clothing directly, but most stories will need the same parts and clothing types.
The extension therefore comes with an extensive set of templates that can be used directly, descriptions are all that's needed.
Both types can be defined indepentendly or broadly for groups of persons, as shown in Example A.
Section 1.4 contains a complete list of all garment and body part templates included.

In theory, any thing that has the penetrating and orificial properties can potentially be used in the fucking it with action.
For ease of use however we create the two template kinds sex toy and strap-on.
A sex toy is simply a thing that canbe penetrating and orificial and defaults to being penetrating.
A strap-on is slightly more complicated; it's a garment that covers the crotch area on the outerwear level (allowing it to fit over trousers) that's penetrating.

If you feel the included templates are lacking, feel free to contact the extension author as described earlier.
Creating your own custom parts and garments is covered in later sections and Example D.
It's very important to note that no garments or body parts are ever created without the author explicitly saying so.

Section 3.2 - Access and Visibility

The extension works with three general levels of access to garments and body parts: vision, touching and accessible (manipulation).
Section 6.9 - Phrases for Deciding on Values covers the phrases that deal with calculating this, and most phrases are pretty self explanatory.
This section will instead focus on how they are implemented and the differences between them.
For simplicity sake we'll refer to something as covered if the related person is wearing atleast one garment whose modified cover areas match the compared items' and the clothling level is higher on the worn item.

The visibility checks require that atleast one cover area is not covered by any garments that are opaque.
Transparent garments will allow visibility even through multiple layers of garments.
Touching is similarly calculated if atleast one cover area is not covered by any garments that are not allow touching through.
Accesibility however is used for 'major' actions such as taking off garments and sexual contact with body parts, and therefore it requires that all the cover areas are not covered and touching through is not considered.

Section 3.3 - Manipulating Garments

Manipulation of garments is heavily dependant on coverage.
At the most basic level, a garment can not be worn if the person is already wearing something that would cover the garment being put on.
Similarly, a garment can only be taken off if it is not covered, and we can also calculate which things (and decency) would be revealed by taking off a garment.

Garments can also be manipulated in other ways, specifically the have the possibility of being ripped apart or shifted to be more revealing.
These work in much the same way, except that ripping is permanent and shifting is only applicable to worn garments and a ripped garment can no longer be shifted.
Shiftable garments also have a property called shiftyness, which determines the verbs the player can use and how the feedback on the action is given.
Both of these options are controlled by a property on each garment, and some templated garments have these properties set.
Garments that can be manipulated in this way should also include the ripping or shifting revealed cover areas property to say which areas are revealed by the action.
In order to manipulate a garment in this way, these revealed cover areas have to be not covered by anything (although the access might be temporary in the form of a shifted garment).

The following templates are rippable and will reveal:

	pair of Panties: crotch
	pair of Pantyhose: crotch
	Shirt: shoulder, upper/lower torso
	pair of Stockings: thigh
	Undershirt: upper torso

The following templates are shiftable in a given way and will reveal:

	Coat (Unbutton): shoulder, upper/lower torso, crotch, thigh
	Dress (Unbutton): shoulder, upper/lower torso
	Jacket (Unbutton): upper/lower torso
	Minidress (Raise): crotch, thigh
	pair of Panties (Move): crotch
	Shirt (Unbutton): shoulder, upper/lower torso
	pair of Shorts (Unzip): Crotch
	Skirt (Raise): crotch, thigh
	Suit (Unzip): crotch
	Sweater (Raise): upper/lower torso
	Swimsuit (move): upper torso
	pair of Trousers (Unzip): Crotch

Section 3.4 - Customization

If a story has a need that's not covered by the templates, it's easy to create new garments, body parts or even cover areas.
Example D shows how one might add a tail, which includes creating a custom cover area, body part and garment.

Body parts and garments are the easiest to customize, and you have the option of adapting one of the templates or using the base kind as a reference.
For one-off items you can just create a new thing of the base kind, but most times it's best to create a new template kind.
Once the thing or template is defined, the real work lies in setting the needed properties on it.
The most important of these is the relevant cover areas, stored in cover locations for body parts and cover areas for garments.
Garments also should have decency and a clothing level, which requires some work to fit in with other garments.
As mentioned in the previous section garments can also be manipulated, governed by the rippable and shiftable (with shiftability) properties.
For a custom body parts to be involved in a sexual action it needs one or more of the limiting properties, as defined in section 2.1.
The complete set of properties available for these kinds are listed in chapter 6.

It's slightly more complex to create new cover areas.
These are defined in the Table of Coverage containing the columns Cover Area and Uncovered Decency (decency), where cover area is the name of the new value and decency is the decency of any visibile body parts in that area.
Creating a new cover area doesn't do much on it's own though, and it has to be added to the body areas property of the relevant persons.
This can be done by either adding it to the list when play begins (or dynamically during play), or typing out the entire set of cover areas for a person.

Chapter 4 - Descriptions in Detail

While it's possible to use multimedia resources in interactive fiction, the main medium is still the written word.
Inform 7 has a good built-in support for varying textual descriptions, with several chapters of Writing with Inform devoted to variations.
The depiction of persons in traditional interactive fiction is usually more focused on conversation than clothing and body parts.
This extension tries to make it easier to write good descriptions of persons, their parts and clothing based on their current state.

Section 4.1 - Body Parts

For body parts, the main state to consider for descriptions is whether the part is covered by clothing or not.
Writing an if statement in every relevant body part description quickly becomes cumbersome, especially since in-line if statements can't be nested.
To make it easier we crate two new description properties for when the body part is covered and uncovered, and alter the examining rules to perform a special check for body parts to determine which description to print.
These descriptions work in the same way as the normal description property; they have no defaults and if none of the three properties are defined (and only then) the standard 'nothing special' message is printed.

Additionally, we have a new short description property.
This is intended to capture the essential essence of the part in just a few words, and will (if defined) be used for the automatic person description detailed later on.

Authors can use these in different ways:
The short description can be worked into all three descriptions to keep them consistent.
For parts where the covered and uncovered descriptions vary widely, it might be best to forego the normal description and write everything in the covered and uncovered descriptions.
In other circumstances the body part doesn't vary much by clothing, so it might be better to write the bulk of the text in the regular description, and use covered and uncovered to highlight changes.

In summary, the following new properties deal with descriptions for body parts:

	Short description: The essentials of the part, used in automatic description generation for perons.
	Covered description: Printed if all the cover areas for the body part are concealed by opaque garments.
	Uncovered description: Printed if atleast one of the cover areas for the body part is not concealed by an opaque garment.

Section 4.2 - Garments

Similar to body parts, garments have new description properties that are printed based on their state.
Unlike body parts however, a garment that is covered is considered to be concealed.
Anything that is concealed can't be examined directly by the player, so we don't need to take that into account.
Instead the main differentiator is whether the garment is worn or not, and whether it is ripped or shifted.
Because shifting and ripping are relevant state information that isn't conveyed to the player in any other way, there are default values printed for these states.

Garments also have the short description property which should capture the essential essence of the garment and will be used for the automatic person description.
It can also be used to keep the most important details consistent across the various descriptions.

In summary, the following new properties deal with descriptions for garments:

	Short description: The essentials of the garment, used in automatic description generation for persons.
	Ripped description: Printed if the garment is both ripped and worn. Defaults to stating that the garment is ripped to shreds.
	Shifted description: Printed if the garment is both shifted and worn. Defaults to stating that the garment is shifted to be more revealing.
	Worn description: Printed if the garment is worn, but not shifted or ripped. No default value.
	Unworn description: Printed if the garment is not worn, and is usually superflous to the regular description. No default value.

Section 4.3 - Persons

A person often has many dynamic parts of their description, making it hard to fit it all into a text description property.
This implies that a rule-based approach for generating descriptions of people is the better way to go.
This allows us to write explicit rules for describing a given person, but also to create a framework for autogeneration.
Both of these approaches are intended to supplment the normal description property for a person, and will be printed after the normal description if it's defined.
The autogeneration approach is the most complex under the hood, but should be the easier way to implement, while using explicit rules for each person gives the most flexibility at the cost of more work to implement.
[The rules should take care of all the dynamic aspects while the text property covers the static parts.]

Writing an explicit description rule for a person is as simple as stating 'Description generation for PERSON'.
For most occassions it would be most readable to have a single description rule for each person of interest, but Inform gives several opportunities for flexibility when writing rules.
On one end it's possible to write a generic rule for all women, and on the other you can have several rules for the same person differentiated by scene.
The generation rules have three outcomes which allow more advanced control of what happens:
Described is the default success, which stops processing after that rule and suppresses the 'nothing special' default response.
Undescribed is a no-response outcome, which means the rulebook will continue to look for matching rules, and eventually end up in the default generation rules if no other rules are found.
Undescribable is a failure, which will stop the rulebook processing, and potentially print the 'nothing special' default response if no other description has been printed.
A simple example of description generation is shown below:

*:
	Peter is a man in Library.
	Peter carries a pocket watch.
	A dapper suit is a suit worn by Peter.
	
	Description generation for Peter:
		If peter is wearing the dapper suit:
			Say "Peter looks smashing in his dapper suit.";
		Else if Peter is nude:
			Say "Peter is wearing just what the creator gifted him with.";
		Else:
			Say "Peter is wearing [a list of unconcealed garments worn by Peter].";
		If peter is carrying something unconcealed:
			Say "He is carrying [a list of unconcealed things carried by Peter].";

The default description generation rules tries to break down the dynamic parts of a person into four broad categories, in part using another new rulebook for determining how notable something is.
The first part is writing out any body parts, garments and carried items that are deemed to be distinctly notable.
Because this should be a list of the important parts of the person, we use the short description (described for body parts and garments) instead of just the title.
Almost as important are any notable statuses for the person;
by default it will state the clothing level using the definitions (See section 6.6) but it's possible to extend the person status rules.
This is an area where some expansion is planned in the future.
We then list any parts of the person that are grouped notable, into an 'You can also see' text.
Lastly we give a snapshot of the person's behavior state, stored in the behavior state description.

The description notability rules are the key to implementing this, and have five distinct outcomes listed in the table below.
Worn clothing and carried items that are not concealed will be grouped, but all concealed clothing will default to hidden.
No other defaults exist in the rules, leaving it to the author to decide which body parts are distinct or grouped.

	Distinct (Success): The item is distinctly notable and should be printed in the first listed first using the short description description (if defined).
	Grouped (Success): The item is notable and should be printed in the second listing using just the title.
	Unknown (No outcome): Defer determination to another rule.
	Unnotable (Failure): The item should not be printed.
	Hidden (Failure): The item should not be printed.

The two failure results are technically the same as neither will be printed, and are intended for extendability.

Section 4.4 - Responses

Action responses should be written using the standard Inform 7 rulebooks After, Before and Instead.
As the names imply, after rules are for after an action suceeds, before are for before the action is checked for validity, and instead rules block the action from taking place.
Writing with Inform has literally chapters devoted to this, so instead this part will focus on tips, tricks and recreating TADS library features.

Perhaps one of the best underused features of Inform is scenes, which allow you to tightly group together the narrative and it's consequences.
One immediate application in AIF is controling the sex scenes.
By implementing these as scenes, you can ensure it that starts when the requisite unlocking puzzle(s) are completed, and ends when a set condition is met.
You can then tie in any consent and persuasion rules to only apply during that scene, as well as action responses.
The real benefit comes when a person is involved in several sex scenes, by tying responses to the individual scenes you can be certain to avoid printing responses for the wrong scene.

To emulate the action repeat functionality, you can use the 'for X time' or 'for x turns' clauses.
Both take into account repeating actions, but 'times' is the total number of times, while 'turns' is the number of times/turns in a row.
Randomly alternating text is also very simple, using the 'one of' constructs described in chapter 5.7 of Writing with Inform.
The following short example highlights some of the these tricks:

*:
	After waiting, say "[first time]This will only be printed the first time. [only]You [one of]wait[or]linger[or]sulk[or]skulk[then at random]."
	After waiting the second time, say "This is getting boring."
	After waiting for four turns, say "You sneeze. Whoops."
	After waiting for more than six times, say "Get on with it!"
	Test me with "z / z / z / z / z / z / z"

Chapter 5 - NPCs

Chapter 6 - Technical Reference

Contained in this chapter is a technical description of all the new and altered mechanics for the extension, divided by type.
It's intended as a companion to the other chapters, although an experienced author could glean much of the previous information from this chapter alone.

Section 6.1 - New Kinds of Value

The extension creates a few new kinds of value to help cohesion.
Several of these could have been implemented as numeric properties instead, but making them kinds of value improves readability and makes it harder to compare the wrong values. 

Arousal has typically been implemented as a linear numeric system, with continuous incremental changes up to thresholds based on the actor and actions. This model typically leads to spamming 'g' (repeat) in order to raise the arousal, so as to unlock new actions.
To avoid this, we use Informs natural value enumeration to divide arousal into discrete values, which should provide a smoother and more natural progression.
This part is just the bare bones, allowing the story author to use arousal as a decision making tool.
The system is extensible, but it assumes that unaorused is the neutral setting, and unattainable arousal is the last defined value.
The Discrete Arousal-based Consent and Stimulation (DACS) template makes use of several arousal properties for both persons and body parts, detailed both below and in the chapter on DACS.

Clothing Layer is a simplified method of divvying up which garments can be worn over others.
By default, the clothing layers are skinwear, underwear, normalwear, overwear and outerwear.
This can be expanded upon, but the ordering of the values is important.

Cover Area is a link between garments, persons and their body parts, and is used to avoid every story having a fully implemented set of body parts.
By defining areas, we can have garments that only partially cover each other, and even be shifted to reveal certain areas (See Shiftyness).
The cover areas are defined by the Table of Coverage which links each area to a decency.
This table can be expanded upon, but then it's important to note that any added areas are not included in people by default.

Decency is intended to control what behavior is proper in a given location.
By default there are the four stages indecent, immodest, casual, formal, as well as the undefined decency (because I7 doesn't allow for null-values).
Every room has a decency threshold, and attempts to enter (or undress in) that room when the visible clothing and body parts gives you a lesser decency is stopped; certain actions also have a decency associated (see Global Variables) that is also checked for.

Shiftyness is a horrible made up word, which governs how the player can rearrange a garment in order to gain access to more cover areas.
The values (and their associated textual descriptions) are defined in the Table of Shift, which can be expanded upon.
See Garments for more details.

Section 6.2 - New Kind: Body Part

Besides the new Kind of Values, the extension also defines some new Kinds.
Note that this section only covers the new base kinds, as these will have templated sub-kinds with different defaults.

A Body Part represents a part of a person, and is intended to always be a part of something, and some parts might fail if you have a spare body part.
They are designed to be flexible and customizable, and while there's nothing wrong with defining body parts directly, for most purposes it's better to use one of the templates mentioned earlier.

	Covered Description: A text that is printed in addition to the normal description property when examined, if all cover ares of the body part are concealed. If the property is not set, nothing is printed.
	Short Description: Used in the listing of notable body parts for person description generation if defined; should contain the essentials of the part.
	Uncovered Description: A text that is printed if atleast one of the cover areas of the body part is visible (even through transparent garments). If the property is not set, nothing is printed.
	Owner's Pronoun: A "hack" to allow the player to refer to "my/his/her/their" body part. Set at the start of play by the initiate erotic storytelling rule, and should be updated if the person changes gender or plurality.
	
A body part also has some properties to control which of the actions are applicable. The body part templates redefine some of these:

	A body part can be touchable or untouchable. A body part is usually untouchable.
	A body part can be rubbable or unrubbable. A body part is usually unrubbable.
	A body part can be tickleable or untickleable. A body part is usually untickleable.
	A body part can be spankable or unspankable. A body part is usually unspankable.
	A body part can be pinchable or unpinchable. A body part is usually unpinchable.
	A body part can be lickable or unlickable. A body part is usually unlickable.
	A body part can be biteable or unbiteable. A body part is usually unbiteable.
	A body part can be penetrating. A body part is usually not penetrating.
	A body part can be orificial. A body part is usually not orificial.

Body parts also have quite a few arousals for use with DACS; How these work are described in more detail earlier in the arousal section, but the default values are listed here:

	Soft-play:
		Threshold: Slightly Aroused, Aroused for breasts, penis and vagina.
		Performer Limit: Aroused; Very Aroused for ass, breasts, penis, vagina.
		Recipient Limit: Aroused; Very Aroused for ass and breasts; Orgasmic for penis and vagina.
	Rough-play:
		Threshold: Very Aroused.
		Performer Limit: Very Aroused.
		Recipient Limit: Very Aroused.
	Oral-play:
		Threshold: Aroused
		Performer Limit: Very Aroused; Aroused for ass.
		Recipient Limit: Very Aroused; Orgasmic for penis and vagina.
	Fuck-play:
		Threshold: Very Aroused; Aroused for breasts.
		Performer Limit: Very Aroused; Orgasmic for penis and vagina.
		Recipient Limit: Very Aroused; Orgasmic for penis and vagina.

Section 6.3 - New Kind: Garment

A garment is as the name implies a thing that is designed to be worn, and as such is always wearable.
It interacts with body parts through the use of the cover area kind of value, as described earlier.
It has several properties to facilitate functionality such as layering, shifting and transparency.
Garments are also referenced by persons, in the list of preferred clothing which is used by the dressing action.

	Allow Touching Through/Block Touching Through (Default): Determines if body parts (and garments) that are covered by the garment can still be touched. Calculated recursively, so a body part can be touched through several layers of garments that allow it.
	Cloth Decency (Defaults to casual): The decency projected by the garment on the cover areas it currently overlies, used to calculate the current decency of the wearer.
	Clothing Size (Defaults to 0): Defines what persons can wear the garment, see the same property on persons.
	Cover Areas (List): The areas of a body that the garment normally covers.
	Default Cover Blocking (Not Default): If this property is set, the Cover Area property is always used to determine full access actions, such as removing garments, regardless of the state of the garment.
	Rippable (Not default): Determines if the garment can be ripped/torn, exposing new cover areas. Permanent change.
	Ripped (Not default): Determines if the garment has been ripped/torn.
	Ripped Description: A text that is printed in addition to the normal description property when examined, if the garment is ripped. If the property is not set, "[The noun] [are] ripped to shreds." is printed instead.
	Ripping Revealed Cover Areas (List): The cover areas of the garment that are revealed (removed from consideration) when the garment is ripped. If the garment is Default Cover Blocking, they are still considered for full access actions such as removing garments.
	Shiftable (Not default): Determines if the garment can be shifted, exposing new cover areas. Temporary change.
	Shifted (Not default): Determines if the garment is currently shifted. Only worn garments can be shifted.
	Shifted Description: A text that is printed in addition to the normal description property when examined, if the garment is shifted. If the property is not set, "[The noun] [are] [describe shifted of the shiftyness] to be more revealing." is printed instead.
	Shifting Revealed Cover Areas (List): The cover areas of the garment that are revealed (removed from consideration) when the garment is shifted. If the garment is Default Cover Blocking, they are still considered for full access actions such as removing garments.
	Shiftyness: Determines in which way the garment can be shifted. See the shiftyness kind of value above.
	Short Description: Used in the listing of notable worn clothing for person description generation if defined; should contain the essentials of the garment.
	Transparent/Opaque (Defaults to opaque): Determines visibility to underlying parts; transparent garments allow underlying garments and body parts to be seen. Calculated recursively, so a body part can be visible through several layers of transparent garments.
	Worn Description: A text that is printed in addition to the normal description property when examined, if the garment is worn by someone. If the property is not set, nothing is printed.
	Unworn Description: A text that is printed in addition to the normal description property when examined, if the garment is not worn by anyone. If the property is not set, nothing is printed.

Section 6.4 - New Properties for Existing Kinds

Besides defining new Kinds and Kinds of Value, the extension also adds some properties to existing Kinds: Room and Person.

Rooms get a minimal change:

	Decency Threshold (Defaults to casual): Defines the decency that is allowed in the room, taking into account both the clothing of a person and certain actions (See global Variables below).

Persons get more changes, see also decency above.

	Behavior-enabled (Defaults to behavior-disabled): Used by the behavior rules to enable or disable the rules for a person.
	Behavior State Description:	Used by the behavior and description generation rules to convey the current state of the person, if defined.
	Body Areas (List of cover areas): The cover areas that a person incorporates. See Cover Area above.
	Clothing Size (Defaults to 0): Defines what garments a person can wear, see the same property on garments.
	Current Arousal (Defaults to unaroused): The current discrete arousal level of the person. See Arousal above.
	Current Decency: A stored value (calculated by UPDATE DECENCY FOR) that indicates the decency of visible garments and body parts for a person.
	Keep Clothes after Undress (default): Decides if the person shold keep or drop clothes when undressing.
	Love Interests (List of persons): The list of people that they are willing to engage in erotic actions with, used by the DACS templates.
	Occupied (Defaults and resets to Unoccupied): Used by the behavior rules to stop a person from more than one behavior action per turn.
	Orgasm Reset Arousal (Default to aroused): The discrete arousal level the person is reset to after the ORGASMS phrases succeeds.
	Orgasms: The number of times the person has orgasmed, as defined by the number of times the ORGASMS phrase has succeeded. Used to calculate the success rate for ORGASMS.
	Orgasmic Attemps: The number of times the ORGASMS phrase has been called since the last orgasm. Used to calculate the success rate for ORGASMS.
	Priority: Used by the behavior rules to determine the acting order.
	Unaroused Response: Issued by the DACS templates when the person is not interested in the action, due to the current arousal of the person not being high enough. Defaults to "'Not yet,' [printed name] says softly."
	Uninterested Response: Issued by the DACS templates when the person is not interested in the action, either due to unattainable arousal threshold or lack of love interest. Defaults to "'That's not going to happen,' [printed name] says cooly."

Persons also have quite a few arousals for use with DACS; How these work are described in more detail earlier in the arousal section, but the default values are listed here:

	Clothing threshold: Slightly Aroused.
	Soft-play:
		Threshold: Slightly Aroused.
		Performer Limit: Aroused.
		Recipient Limit: Aroused.
	Rough-play:
		Threshold: Very Aroused.
		Performer Limit: Very Aroused.
		Recipient Limit: Very Aroused.
	Oral-play:
		Threshold: Aroused.
		Performer Limit: Very Aroused.
		Recipient Limit: Very Aroused.
	Fuck-play:
		Threshold: Very Aroused.
		Performer Limit: Very Aroused.
		Recipient Limit: Very Aroused.

Section 6.5 - Global Variables

As described in section 2.1, all of the erotic actions have a corresponding decency which is compared to the decency threshold of the room to see if the action should be allowed.
To make it easy for an author to alter this, they are defined as global variables, listed below.

*:
	The biting decency is initially indecent.
	The dancing decency is initially formal.
	The fucking decency is initially indecent.
	The hugging decency is initially formal.
	The kissing decency is initially casual.
	The licking decency is initially immodest.
	The pinching decency is initially immodest.
	The rubbing decency is initially immodest.
	The spanking decency is initially indecent.
	The tickling decency is initially immodest.
	The touching decency is initially immodest.

Section 6.6 - Adjectives

The extension provides some adjectives for the story author to take advantage of:

	A (person) is TOPLESS: If the upper torso cover area of the person is visible. 
	A (person) is BOTTOMLESS: If the crotch cover area of the person is visible.
	A (person) is NEARLY NUDE: If the person is both topless and bottomless. Other body parts can be covered, however.
	A (person) is NUDE: If the person is not wearing any garments. Other wearable things can be worn, however.

The extension itself never uses these.

Section 6.7 - Phrases for Saying

These phrases are provided to simplify using the properties of shiftyness, which are mainly used as say-able values.

	DESCRIBE SHIFTING OF (shiftyness): Describe how the shiftyness is applied, as defined by the describe shifting entry in the Table of Shift.
	DESCRIBE UNSHIFTING OF (shiftyness): Describe how the shiftyness is reversed, as defined by the describe unshifting entry in the Table of Shift.
	DESCRIBE SHIFTED OF (shiftyness): Describe the shifted appearance, as defined by the describe shifted entry in the Table of Shift.
	DESCRIBE UNSHIFTED OF (shiftyness): Describe the un-shifted appearance, as defined by the describe unshifted entry in the Table of Shift.

Section 6.8 - Phrases for Updating Values

The extension contains some phrases which are used to update the world model.
The phrases for forcing clothing are most applicable to a story author, and are intended to simplify set-changing.
They bypass all action checks on wearing garments, and will allow for a person to wear incompatible clothing that can cause problems later on.

	UPDATE PRONOUN FOR (garment): Sets the pronoun property for a garment, which allows the player to refer to garments by using "my/his/her/their".
	UPDATE DECENCY FOR (person): Sets the current decency for a person, based on visible garments and cover areas.
	FORCE STRIP (person): Forcibly removes all worn items from a person, bypassing all restrictions. Use with caution!
	FORCE DRESS (person) in (list of garments): Forcibly replaces the currently worn items of a person with the list of garments, bypassing all restrictions. Use with caution!

Section 6.9 - Phrases for Deciding on Values

The extension contains some phrases to decide on values, which are used in actions.
These only do calculations and don't update anything, so they are safe to use for a story author.

These phrases deals with calculating decency:

	which (decency) is the DECENCY OF (cover area): Gives the decency of a cover area, as defined by the Table of Coverage.
	which (decency) is the BASE DECENCY OF (body part): Gives the decency of a body part, as defined by the lowest decency of the cover areas it occupies.
	which (decency) is EXPOSED BY (cover area) ON (person): Gives the decency of a cover area on person, taking into account worn clothing.
	which (decency) is EXPOSED BY TAKING OFF (garment): Calculates what the decency of a person would be if the garment was taken off.
	which (decency) is EXPOSED BY SHIFTING (garment): Calculates what the decency of a person would be if the garment was shifted.
	which (decency) is EXPOSED BY RIPPING (garment): Calculates what the decency of a person would be if the garment was ripped.

These phrases deals with determining which cover areas should be used for a garment:

	what (list of cover areas) is the MODIFIED COVER AREAS OF (garment): Takes into account whether the garment is ripped or shifted for greater access.
	what (list of cover areas) is the BLOCKED COVER AREAS OF (garment): Takes into account whether the garment ripping or shifting a garment makes it possible to remove/access underlying things (through the cover blocking property).

These phrases deals with what the player can see:

	whether (body part) CAN BE SEEN: Checks if a body part is visible, taking into account transparent clothing.
	whether (cover area) CAN BE SEEN FOR (person): Checks if a cover area on a given person can be seen, taking into account transparent clothing.
	whether (garment) CAN BE SEEN: Checks if a garment can be seen, taking into account transparent clothing. Unworn garments are considered always visible.
	which (list of garments) is CONCEALING VISION OF (garment): The opaque garments that are worn over a given garment, regardless of visibility.
	which (list of garments) is CONCEALING VISION OF (body part): The opaque garments that are worn over a given body part, regardless of visibility.
	which (list of things) is REVEALED BY TAKING OFF (garment): The list of things that would be revealed if a garment was removed entirely.
	which (list of things) is REVEALED BY shifting (garment): The list of things that would be revealed if a garment was shifted.
	which (list of things) is REVEALED BY ripping (garment): The list of things that would be revealed if a garment was ripped.
	which (list of things) is CONCEALED BY (garment) FOR (cover area): The list of things that would be revealed on a given cover area if the garment would no longer cover that area. Used by the other REVEALED BY phrases.

These phrases deals with touching garments and body parts, which can happen even through worn clothes:

	whether (body part) CAN BE TOUCHED: Checks if a body part is not covered by any clothing that blocks touching through.
	whether (garment) CAN BE TOUCHED: Checks if a garment is not covered by any clothing that blocks touching through.
	which (list of garments) is PREVENTING TOUCHING OF (body part): The garments that block touching of a body part, regardless of visibility.
	which (list of garments) is PREVENTING TOUCHING OF (garment): The garments that block touching of a garment, regardless of visibility.

These phrases deals with determining full access to garments and body parts:

	whether (body part) is ACCESSIBLE: Checks if a body part is reachable for full access (not through clothing).
	whether (garment) CAN BE WORN BY (person): Checks if the current clothing of the person allows that person to wear a given garment.
	whether (garment) CAN BE TAKEN OFF: Checks if the current clothing of the wearer of the garment allows that garment to be taken off.
	whether (garment) CAN BE SHIFTED: Checks if the current clothing of the wearer of the garment gives access to the shifting revealed cover areas.
	whether (garment) CAN BE RIPPED: Checks if the current clothing of the wearer of the garment gives access to the ripping revealed cover areas.
	which (list of garments) is PREVENTING WEARING OF (garment) BY (person): The garments that stops a garment from being worn by a given person.
	which (list of garments) is PREVENTING TAKING OFF (garment): The garments that stops access to a garment being taken off.
	which (list of garments) is PREVENTING SHIFTING OF (garment): The garments that stops access to the shifting revealed cover areas of the garment.
	which (list of garments) is PREVENTING RIPPING OF (garment): The garments that stops access to the ripping revealed cover areas of the garment.

These phrases deals with arousal and orgasms:

	whether (person) IS (arousal) OR MORE: An easy-living phrase which checks if the current arousal is equal or greater than the specified arousal.
	whether (person) IS (arousal) OR LESS: An easy-living phrase which checks if the current arousal is equal or less than the specified arousal.
	AROUSE (person): Change the current arousal of the person to the next level.
	AROUSE (person) UP TO (arousal): Change the current arousal of the person to the next level, but not past the specified arousal. If the unattainable arousal is specified as input, no change will happen.
	COOL DOWN (person): Change the current arousal of the person to the previous level.
	COOL (person) DOWN TO (arousal): Change the current arousal of the person to the previous level, but not past the specified arousal. If the unattainable arousal is specified as input, no change will happen.
	whether (person) ORGASMS: Uses the Orgasmic Attempts and Orgasms properties of the person to decide whether the person has an orgasm, and if it succeeds it sets the current arousal of the person to the Orgasm Reset Arousal. The formula is based on the ratio of attempts to orgasms.





Example: * Moulded and Stamped - Using the provided templates to flesh out actors.

This example shows some of the templated body parts and garments in action.
In order to show off the tricks better, we set unrealistic defaults for persuasion and consent.

	*: "Template Tricks"
	
	Include Erotic Storytelling by Fictitious Frode.
	Use MAX_STATIC_DATA of 300000.
	
	Lounge is a room.
	Laura is a woman in Lounge.
	