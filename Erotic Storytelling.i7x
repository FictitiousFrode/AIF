Version 1/160930 of Erotic Storytelling by Fictitious Frode begins here.
"An extension focused on writing Adult Interactive Fiction (AIF). Includes erotic actions, components and mechanics for layered clothing with distinct body parts, as well as consent system for actions involving others. 
Also includes an optional customizable ready-to-use Discrete-Arousal-based Consent and Stimulation systems, semi-automatic improved description generation, and templates for npc agency.

Future plans include conversation and posturing, as well as out-of-game features such as content limits, completion tracking and hints."

Use MAX_STATIC_DATA of 300000.

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

To decide what list of cover areas is the modified cover areas of (G - a garment):
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
	Decide on the modified cover areas of G;

Chapter 1.2.2b - Body Parts

To decide whether (P - a body part) can be seen:
	Let clothing be the list of opaque garments worn by the holder of P;
	Sort clothing in reverse clothing layer order;
	Repeat with A running through the cover locations of P:
		Repeat with cloth running through clothing:
			If A is listed in the modified cover areas of cloth, decide no;
	Decide yes;

To decide which list of garments is concealing vision of (P - a body part):
	Let concealers be a list of garments;
	Let clothing be the list of opaque garments worn by the holder of P;
	Sort clothing in reverse clothing layer order;
	Repeat with A running through the cover locations of P:
		Repeat with cloth running through clothing:
			If A is listed in the modified cover areas of cloth:
				Add cloth to concealers, if absent;
	Decide on concealers;

To decide whether (P - a body part) can be touched:
	Let clothing be the list of block touching through garments worn by the holder of P;
	Sort clothing in reverse clothing layer order;
	Repeat with A running through the cover locations of P:
		Repeat with cloth running through clothing:
			If A is listed in the modified cover areas of cloth, decide no;
	Decide yes;

To decide which list of garments is preventing touching of (P - a body part):
	Let preventers be a list of garments;
	Let clothing be the list of block touching through garments worn by the holder of P;
	Sort clothing in reverse clothing layer order;
	Repeat with A running through the cover locations of P:
		Repeat with cloth running through clothing:
			If A is listed in the modified cover areas of cloth:
				Add cloth to preventers, if absent;
	Decide on preventers;

To decide whether (P - a body part) is accessible:
	Let clothing be the list of garments worn by the holder of P;
	Sort clothing in reverse clothing layer order;
	Repeat with A running through the cover locations of P:
		Repeat with cloth running through clothing:
			If A is listed in the modified cover areas of cloth, decide no;
	Decide yes;

[TODO: Preventing access]

Chapter 1.2.2c - Cover Areas

To decide whether (A - cover area) can be seen for (P - a person):
	Let clothing be the list of opaque garments worn by P;
	Sort clothing in reverse clothing layer order;
	Repeat with cloth running through clothing:
		If A is listed in the modified cover areas of cloth:
			Decide no;
	Decide yes;

To decide which decency is exposed by (A - cover area) on (P - a person):
	Let clothing be the list of opaque garments worn by P;
	Sort clothing in reverse clothing layer order;
	Repeat with cloth running through clothing:
		If A is listed in the modified cover areas of cloth:
			Decide on the cloth decency of cloth;
	Decide on the decency of A;

[Determine what would be revealed if G was removed from a cover area]
To decide which list of things is concealed by (G - a garment) for (A - cover area):
	Let revealed be a list of things;
	[First; determine whether G would reveal anything at all]
	Let clothing be the list of garments worn by the holder of G;
	If G is listed in clothing, remove G from clothing; [We don't want to let G block or reveal itself]
	Sort clothing in reverse clothing layer order;
	[Determine if G is the topmost concealer for the area:]
	Let concealed clothing be clothing;
	Repeat with cloth running through clothing:
		If clothing layer of cloth is less than clothing layer of G:
			Break; [What remains in clothing are the potentially revealed garments]
		If clothing layer of cloth is clothing layer of G:
			Remove cloth from concealed clothing;
			Next;
		If cloth is transparent:
			Remove cloth from concealed clothing;
			Next;
		If A is listed in the modified cover areas of cloth:
			[Cloth overlies G for the area, so nothing would be revealed here]
			Decide on revealed;
	[Determine which garments would be revealed, and whether body parts are visible too.]
	Repeat with cloth running through concealed clothing:
		If A is not listed in the modified cover areas of cloth:
			Next;
		Add cloth to revealed, if absent;
		If cloth is opaque:
			[The area is covered, so body parts and underlying garments won't be revealed.]
			Decide on revealed;
	[Determine which body parts would be revealed]
	Repeat with P running through the body parts enclosed by the holder of G:
		If A is listed in the cover locations of P:
			Add P to revealed, if absent;
	Decide on revealed;

Chapter 1.2.2d - Garments

Section - Visibility of Garments

[A garment can be seen if atleast one (unmodified) cover area is visible;
a shifted/ripped garment can be seen even if the only visible cover area is visible.
An unworn garment is assumed to be visible.]

To decide whether (G - a garment) can be seen:
	If G is not worn by someone:
		Decide yes;
	Let clothing be the list of opaque garments worn by the holder of G;
	If G is listed in clothing, remove G from clothing; [We don't want to let G block itself]
	Sort clothing in reverse clothing layer order;
	Repeat with A running through the cover areas of G:
		Repeat with cloth running through clothing:
			If clothing layer of cloth is greater than clothing layer of G:
				If A is listed in the modified cover areas of cloth, decide no;
	Decide yes;

To decide which list of garments is concealing vision of (G - a garment):
	Let concealers be a list of garments;
	If G is not worn by someone:
		Decide on concealers;
	Let clothing be the list of opaque garments worn by the holder of G;
	If G is listed in clothing, remove G from clothing; [We don't want to let G block itself]
	Sort clothing in reverse clothing layer order;
	Repeat with A running through the cover areas of G:
		Repeat with cloth running through clothing:
			[Only consider opaque garments with a higher clothing layer]
			If clothing layer of cloth is greater than clothing layer of G:
				If A is listed in the modified cover areas of cloth: [Take shifted/ripped into account]
					Add cloth to concealers, if absent;
	Decide on concealers;

Section - Touching Garments

[A garment can be touched if all of the cover areas of it are not blocked by anything that doesn't allow touching]
To decide whether (G - a garment) can be touched:
	If G is not worn by someone:
		Decide yes;
	Let cover be the modified cover areas of G;
	Let clothing be the list of garments worn by the holder of G;
	If G is listed in clothing, remove G from clothing; [We don't want to let G block itself]
	Sort clothing in reverse clothing layer order;
	Repeat with A running through cover:
		Repeat with cloth running through clothing:
			If cloth is block touching through and clothing layer of cloth is greater than clothing layer of G:
				If A is listed in modified cover areas of cloth, decide no;
	Decide yes;

To decide which list of garments is preventing touching of (G - a garment):
	Let preventers be a list of garments;
	If G is not worn by someone:
		Decide on preventers;
	Let cover be the modified cover areas of G;
	Let clothing be the list of garments worn by the holder of G;
	If G is listed in clothing, remove G from clothing; [We don't want to let G block itself]
	Sort clothing in reverse clothing layer order;
	Repeat with A running through cover:
		Repeat with cloth running through clothing:
			If cloth is block touching through and clothing layer of cloth is greater than clothing layer of G:
				If A is listed in the modified cover areas of cloth:
					Add cloth to preventers, if absent;
	Decide on preventers;

Section - Wearing Garments

[A garment can be taken off if none of the blocking cover areas underlies anything]
To decide whether (G - a garment) can be worn by (P - a person):
	If G is worn by P:
		Decide yes; [Technically no, but that's stopped elsewhere]
	Let cover be the modified cover areas of G;
	Let clothing be the list of garments worn by P;
	Sort clothing in reverse clothing layer order;
	Repeat with A running through cover:
		Repeat with cloth running through clothing:
			If clothing layer of cloth is greater than clothing layer of G:
				If A is listed in the modified cover areas of cloth, decide no;
	Decide yes;
	
To decide which list of garments is preventing wearing of (G - a garment) by (P - a person):
	Let preventers be a list of garments;
	If G is worn by P:
		Decide on preventers;
	Let cover be the modified cover areas of G;
	Let clothing be the list of garments worn by P;
	Sort clothing in reverse clothing layer order;
	Repeat with A running through cover:
		Repeat with cloth running through clothing:
			If clothing layer of cloth is greater than clothing layer of G:
				If A is listed in modified cover areas of cloth:
					Add cloth to preventers, if absent;
	Decide on preventers;

Section - Taking Off Garments

To decide whether (G - a garment) can be taken off:
	If G is not worn by someone:
		Decide yes;[Technically, no; but we don't want to stop that here.]
	Let cover be the blocked cover areas of G;
	Let clothing be the list of garments worn by the holder of G;
	If G is listed in clothing, remove G from clothing; [We don't want to let G block itself]
	Sort clothing in reverse clothing layer order;
	Repeat with A running through cover:
		Repeat with cloth running through clothing:
			If clothing layer of cloth is greater than clothing layer of G:
				If A is listed in the blocked cover areas of cloth, decide no;
	Decide yes;

To decide which list of garments is preventing taking off (G - a garment):
	Let preventers be a list of garments;
	If G is not worn by someone:
		Decide on preventers;
	Let cover be the blocked cover areas of G;
	Let clothing be the list of garments worn by the holder of G;
	If G is listed in clothing, remove G from clothing; [We don't want to let G block itself]
	Sort clothing in reverse clothing layer order;
	Repeat with A running through cover:
		Repeat with cloth running through clothing:
			If clothing layer of cloth is greater than clothing layer of G:
				If A is listed in the blocked cover areas of cloth:
					Add cloth to preventers, if absent;
	Decide on preventers;

[For each cover area removed, check if G is the current concealer, and if it is, add what it conceals]
To decide which list of things is revealed by taking off (G - a garment):
	Let revealed be a list of things;
	If G is not worn by someone or G is transparent: [It doesn't conceal anything, so nothing will be revealed]
		Decide on revealed;
	[Use modified cover, as the areas revealed by shifting/ripping are already revealed:]
	Let cover be the modified cover areas of G;
	Repeat with A running through cover:
		Let items be the concealed by G for A;
		Repeat with I running through items:
			Add I to revealed, if absent;
	Decide on revealed;
			
To decide which decency is exposed by taking off (G - a garment):
	Let exposed be the undefined decency;
	If G is not worn by someone or G is transparent: [It doesn't conceal anything, so nothing will be revealed]
		Decide on exposed;
	[Use modified cover, as the areas revealed by shifting/ripping are already revealed:]
	Let cover be the modified cover areas of G;
	Repeat with A running through cover:
		Let items be the concealed by G for A;
		Repeat with I running through items:
			If I provides the property cloth decency and the cloth decency of I is less than exposed, now exposed is the cloth decency of I;
			If I is a body part and the base decency of I is less than exposed, now exposed is the base decency of I;
		If items is empty and the decency of A is less than exposed, now exposed is the decency of A;
	Decide on exposed;

Section - Shifting Garments

[A garment can be shifted if the cover areas that are exposed by the shifting are not under the blocking areas of overlying garments.]
To decide whether (G - a garment) can be shifted:
	If G is not worn by someone:
		Decide yes;[Technically, no; but we don't want to stop that here.]
	Let cover be the shifting revealed cover areas of G;
	Let clothing be the list of garments worn by the holder of G;
	If G is listed in clothing, remove G from clothing; [We don't want to let G block itself]
	Sort clothing in reverse clothing layer order;
	Repeat with A running through cover:
		Repeat with cloth running through clothing:
			If clothing layer of cloth is greater than clothing layer of G:
				If A is listed in the blocked cover areas of cloth, decide no;
	Decide yes;

To decide which list of garments is preventing shifting of (G - a garment):
	Let preventers be a list of garments;
	If G is not worn by someone:
		Decide on preventers;
	Let cover be the shifting revealed cover areas of G;
	Let clothing be the list of garments worn by the holder of G;
	If G is listed in clothing, remove G from clothing; [We don't want to let G block itself]
	Sort clothing in reverse clothing layer order;
	Repeat with A running through cover:
		Repeat with cloth running through clothing:
			If clothing layer of cloth is greater than clothing layer of G:
				If A is listed in the blocked cover areas of cloth:
					Add cloth to preventers, if absent;
	Decide on preventers;

[For each cover area removed, check if G is the current concealer, and if it is, add what it conceals]
To decide which list of things is revealed by shifting (G - a garment):
	Let revealed be a list of things;
	If G is not worn by someone or G is transparent: [It doesn't conceal anything, so nothing will be revealed]
		Decide on revealed;
	[Use the shifting revealed cover]
	Let cover be the shifting revealed cover areas of G;
	Repeat with A running through cover:
		Let items be the concealed by G for A;
		Repeat with I running through items:
			Add I to revealed, if absent;
	Decide on revealed;

To decide which decency is exposed by shifting (G - a garment):
	Let exposed be the undefined decency;
	If G is not worn by someone or G is transparent: [It doesn't conceal anything, so nothing will be revealed]
		Decide on exposed;
	[Use the shifting revealed cover]
	Let cover be the shifting revealed cover areas of G;
	Repeat with A running through cover:
		Let items be the concealed by G for A;
		Repeat with I running through items:
			If I provides the property cloth decency and the cloth decency of I is less than exposed, now exposed is the cloth decency of I;
			If I is a body part and the base decency of I is less than exposed, now exposed is the base decency of I;
		If items is empty and the decency of A is less than exposed, now exposed is the decency of A;
	Decide on exposed;

Section - Ripping Garments

[A garment can be ripped if the cover areas that are exposed by the ripping are not under the blocking areas of overlying garments.]
To decide whether (G - a garment) can be ripped:
	If G is not worn by someone:
		Decide yes;[Technically, no; but we don't want to stop that here.]
	Let cover be the ripping revealed cover areas of G;
	Let clothing be the list of garments worn by the holder of G;
	If G is listed in clothing, remove G from clothing; [We don't want to let G block itself]
	Sort clothing in reverse clothing layer order;
	Repeat with A running through cover:
		Repeat with cloth running through clothing:
			If clothing layer of cloth is greater than clothing layer of G:
				If A is listed in the blocked cover areas of cloth, decide no;
	Decide yes;


To decide which list of garments is preventing ripping of (G - a garment):
	Let preventers be a list of garments;
	If G is not worn by someone:
		Decide on preventers;
	Let cover be the ripping revealed cover areas of G;
	Let clothing be the list of garments worn by the holder of G;
	If G is listed in clothing, remove G from clothing; [We don't want to let G block itself]
	Sort clothing in reverse clothing layer order;
	Repeat with A running through cover:
		Repeat with cloth running through clothing:
			If clothing layer of cloth is greater than clothing layer of G:
				If A is listed in the blocked cover areas of cloth:
					Add cloth to preventers, if absent;
	Decide on preventers;

[For each cover area removed, check if G is the current concealer, and if it is, add what it conceals]
To decide which list of things is revealed by ripping (G - a garment):
	Let revealed be a list of things;
	If G is not worn by someone or G is transparent: [It doesn't conceal anything, so nothing will be revealed]
		Decide on revealed;
	[Use the ripping revealed cover]
	Let cover be the ripping revealed cover areas of G;
	Repeat with A running through cover:
		Let items be the concealed by G for A;
		Repeat with I running through items:
			Add I to revealed, if absent;
	Decide on revealed;

To decide which decency is exposed by ripping (G - a garment):
	Let exposed be the undefined decency;
	If G is not worn by someone or G is transparent: [It doesn't conceal anything, so nothing will be revealed]
		Decide on exposed;
	[Use the ripping revealed cover]
	Let cover be the ripping revealed cover areas of G;
	Repeat with A running through cover:
		Let items be the concealed by G for A;
		Repeat with I running through items:
			If I provides the property cloth decency and the cloth decency of I is less than exposed, now exposed is the cloth decency of I;
			If I is a body part and the base decency of I is less than exposed, now exposed is the base decency of I;
		If items is empty and the decency of A is less than exposed, now exposed is the decency of A;
	Decide on exposed;

Chapter 1.2.2e - Definitions

Definition: A person is topless if the upper torso area can be seen for it.
Definition: A person is bottomless if the crotch area can be seen for it.
Definition: A person is nearly nude if it is topless and it is bottomless.
Definition: A person is nude if it is not wearing any garments.

Part 1.2.3 - Visibility

[Status: Complete
Deals with determining which items are visible for the player, as well as custom descriptions.]

The examine undescribed things rule is listed last in the carry out examining rulebook.

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
		Else if noun is worn by someone and noun provides the property shifted and noun is shifted:
			If noun provides the property shifted description and the shifted description of the noun is not the default value of text:
				Say "[shifted description of the noun][line break]";
			Else:
				Say "[The noun] [are] [describe shifted of the shiftyness] to be more revealing.";
			Now examine text printed is true;
		Else if noun is worn by someone:
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
		[Check that G and the person have atleast one area of overlap]
		Let intersect be a list of cover areas;
		Let areas be the cover areas of G;
		Let matches be 0;
		Repeat with A running through areas:
			If A is listed in the body areas of actor, increase matches by 1;
		If matches is 0:
			If the player is the actor:
				Say "[The noun] [can't] fit on [us]." (A);
			Else if the player can see the actor and the action is not silent:
				Say "[The noun] [can't] fit on [the actor]." (B);
			Stop the action;
		[Check that G would be the topmost cover for all areas]
		Unless G can be worn by the actor:
			Let B be the preventing wearing of G by the actor;
			If the player is the actor:
				Say "[We] [can't] wear [noun] on top of [B]." (C);
			Else if the player can see the actor and the action is not silent:
				Say "[The actor] [can't] wear [noun] on top of [B]." (D);
			Stop the action;

Check an actor wearing something (This is the check garment size rule):
	If the noun provides the property clothing size:
		If the clothing size of noun is not the clothing size of the actor:
			If the player is the actor:
				Say "[We] [can't] wear [noun], [it's] the wrong size." (A);
			Else if the player can see the actor and the action is not silent:
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
				Say "[We] [can't] take off [noun] due to [blockers with definite articles]." (A);
			Else if the player can see the actor and the action is not silent:
				Say "[The actor] [can't] take off [noun] due to [blockers with definite articles]." (B);
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
	If the noun is a garment and the noun is worn by someone:
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
	Unless the noun is a garment and the noun is worn by someone:
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
	Abide by the can't take off covered items rule;
	Abide by the can't take off in public rule;

Check an actor taking something (This is the taking off requires consent rule):
	If the noun is a garment and the noun is worn by someone:
		Follow the consent rules;
		Unless the outcome of the rulebook is the give consent outcome:
			Stop the action;

The taking garments rule is listed first in the carry out taking rulebook.
Carry out an actor taking a garment (called G) (this is the taking garments rule):
	If G is worn by someone:
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
		Else if the player can see the actor and the action is not silent:
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
	Else if the player can see the actor:
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
		Else if the player can see the actor and the action is not silent:
			Say "[The actor] [can't] find a way to strip [noun]." (B);
		Stop the action;

Check an actor stripping something (this is the can't strip naked people rule):
	Let clothing be the list of things worn by noun;
	If clothing is empty:
		If the player is the actor:
			Say "[We] [are] already naked!" (A);
		Else if the player can see the actor and the action is not silent:
			Say "[The noun] [are] already naked." (B);
		Stop the action;

Chapter 1.3.5c - Carry Out

Carry out an actor stripping (this is the default stripping rule):
	Let clothing be the list of garments worn by noun;
	Sort clothing in reverse clothing layer order;
	Repeat with C running through clothing:
		If the actor is the noun:
			Silently try the actor taking off C;
		Else:
			Silently try the actor taking C;
		If the noun is wearing C, stop the action;

Chapter 1.3.5d - Report

Report an actor stripping (this is the report stripping rule):
	If the actor is not wearing any garments:
		If the player is the actor:
			Say "[We] [take] off all [their] clothes and is now completely naked." (A);
		Else if the player can see the actor and the actor is the noun:
			Say "[The actor] [take] off all [their] clothes and is now completely naked." (B);
		Else if the player can see the noun:
			If the player can see the actor:
				Say "[The noun] has all of [their] clothes removed by [the actor], and is now completely naked." (C);
			Else:
				Say "[The noun] has all of [their] clothes removed, and is now completely naked." (D);
	Else:
		If the player is the actor:
			Say "[We] [are] unable to take off [regarding the noun][their] clothes." (E);
		Else:
			Say "[The actor] [are] unable to take off [regarding the noun][their] clothes." (F);

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

Understand "pull up/-- [raisable garment]" as shifting.
Understand "raise up/-- [raisable garment]" as shifting.
Understand "lift up/-- [raisable garment]" as shifting.
Understand "hike up [raisable garment]" as shifting.

Understand "pull down/-- [lowerable garment]" as shifting.
Understand "lower down/-- [lowerable garment]" as shifting.

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
		Else if the player can see the actor and the action is not silent:
			Say "[regarding the noun][They're] too ripped up to [describe shifting of the shiftyness of the noun]." (B);
		Stop the action;

Check an actor shifting (this is the can't shift what's already shifted rule):
	If the noun is shifted:
		If the actor is the player:
			Say "[regarding the noun][They're] already [describe shifted of the shiftyness of the noun]." (A);
		Else if the player can see the actor and the action is not silent:
			Say "[regarding the noun][They're] already [describe shifted of the shiftyness of the noun]." (B);
		Stop the action;

Check an actor shifting (this is the can only shift what's worn rule):
	If the noun does not provide the property wearable or the noun is not worn by someone:
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
			Else if the player can see the actor and the action is not silent:
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
	If the noun is a garment and the noun is worn by someone:
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
			Say "[We] [the describe shifting of the shiftyness of the noun] [the noun], revealing [exposed with indefinite articles]." (A);
		Else if the player can see the actor:
			Say "[The actor] [the describe shifting of the shiftyness of the noun] [the noun], revealing [exposed with indefinite articles]." (B);
		Else if the player can see the noun:
			Say "[The noun] [are] [the describe shifting of the shiftyness of the noun], revealing [exposed with indefinite articles]." (C);
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

Understand "button up [buttonable garment]" and "button [buttonable garment]" as unshifting.
Understand "close up/-- [buttonable garment]" as unshifting.

Understand "zip up/-- [zipable garment]" as unshifting.
Understand "close up/-- [zipable garment]" as unshifting.

Understand "fasten [fastenable garment]" as unshifting.
Understand "buckle up/-- [fastenable garment]" as unshifting.
Understand "zip up/-- [fastenable garment]" as unshifting.
Understand "button up/-- [fastenable garment]" as unshifting.
Understand "close up/-- [fastenable garment]" as unshifting.

Understand "pull down/-- [raisable garment]" as unshifting.
Understand "lower down/-- [raisable garment]" as unshifting.

Understand "pull up/-- [lowerable garment]" as unshifting.
Understand "raise up/-- [lowerable garment]" as unshifting.
Understand "lift up/-- [lowerable garment]" as unshifting.
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

Check an actor unshifting (this is the can only unshift what's already shifted rule):
	If the noun is not shifted:
		If the actor is the player:
			Say "[regarding the noun][They're] already [describe unshifted of the shiftyness of the noun]." (A);
		Else if the player can see the actor and the action is not silent:
			Say "[regarding the noun][They're] already [describe unshifted of the shiftyness of the noun]." (B);
		Stop the action;

Check an actor unshifting (this is the can't unshift covered items rule):
	If noun is a garment (called G):
		Unless G can be shifted:
			Let blockers be the preventing shifting of G;
			If the player is the actor:
				Say "[We] [can't] [describe shifting of the shiftyness of the noun] [noun] when it's covered by [blockers]." (A);
			Else if the player can see the actor and the action is not silent:
				Say "[The actor] [can't] [describe shifting of the shiftyness of the noun] [noun] when it's covered by [blockers]." (B);
			Stop the action;

Check an actor unshifting something (This is the unshifting requires consent rule):
	If the noun is a garment and the noun is worn by someone:
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

Understand "rip open/off/up/-- [garment]" as ripping.
Understand "tear open/off/up/-- [garment]" as ripping.

Chapter 1.4.2b - Check

Check an actor ripping (this is the can't rip covered items rule):
	If noun is a garment (called G):
		Unless G can be ripped:
			Let blockers be the preventing ripping of G;
			If the player is the actor:
				Say "[We] [can't] [rip] apart [noun] when it's covered by [blockers]." (A);
			Else if the player can see the actor and the action is not silent:
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
		Else if the player can see the actor and the action is not silent:
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
	If the noun is a garment and the noun is worn by someone:
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
The first book deals with automating agency of actors to make them more life-like.
The second book deals with ways to automatically flesh out the description of people.
The third book is an attempt at an improved conversation system.
The last book deals with posturing.]

Book 2.1 - Agency

[An actor can have three levels of agency:
Idleness: Messages that are printed when the actor is not actively engaged in something. These are only processed if the player can see the actor.
Planned: Actions that the actor seeks to perform, but which will be postponed if they are engaged with someone.
Urgent: Actions that the actor urgently seek to perform, even if engaged with someone.]

Part 2.1.1 - Concepts

[Status: Complete
This part deals with the underlying concepts needed to make agency processing possible]

Chapter 2.1.1a - Occupied Flag

[We need a way to stop people from doing several agency actions in a turn, so we set a flag.
This is also used to suppress planned agency when the player interacts with that person, and can also be used to allow NPCs to interact with each other without acting twice.
It can also be set manually as needed to delay agency for a turn, but if longer term stopping is needed, use the next property instead.]

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

[In order to support easy temporary disabling of a persons agency, we put in a toggle.
This would also slightly reduce the overhead as we don't need to parse rulebooks for people that are not supposed to have agency.]

A person can be agency-enabled or agency-disabled. A person is usually agency-disabled.

Chapter 2.1.1c - Priority

[In order to control which NPCs script gets called first, we introduce a simple numerical property to order actors by.]
A person has a number called priority.

Chapter 2.1.1d - Agency State

[The agency state can be used to control the script, but the main purpose is to hook into the person description generation.]
A person has some text called the agency state description.

Part 2.1.2 - Rulebooks

[Status: Complete
We modify the turn sequence rulebook to add a stage that's responsible for calling the script rules for each person.
Exactly at which point it should be inserted can be argued, but as we want this to emulate the every turn rules, we insert it just before. We delay clearing the occupied flag untill after the every turn stage, so that the flag is available for every turn rules.]

Chapter 2.1.2a - Turn Sequence

The agency stage rule is listed before the every turn stage rule in the turn sequence rules.
The agency cleanup rule is listed after the every turn stage rule in the turn sequence rules.

This is the agency stage rule:
	Let actors be the list of all agency-enabled persons;
	Sort actors in reverse priority order;
	[First, allow actors to perform any urgent actions]
	Repeat with person running through actors:
		Follow the urgent agency rulebook for person;
		If the rule succeeded, now the person is occupied;
	[Secondly, planned actions are performed]
	Repeat with person running through actors:
		If person is unoccupied:
			Follow the planned agency rulebook for person;
			If the rule succeeded, now the person is occupied;
	[Lastly, print idle messages]
	Repeat with person running through actors:
		If person is unoccupied and the player can see the person:
			Follow the idleness rulebook for person;
			If the rule succeeded, now the person is occupied;

This is the agency cleanup rule:
	Repeat with person running through persons:
		Now person is unoccupied;

Chapter 2.1.2b - New Rulebooks

The urgent agency rulebook is a person based rulebook.
The urgent agency rules have outcomes agency cancelled (failure), agency postponed (no outcome), and agency performed (success - the default).

The planned agency rulebook is a person based rulebook.
The planned agency rules have outcomes agency cancelled (failure), agency postponed (no outcome), and agency performed (success - the default).

The idleness rulebook is a person based rulebook.
The idleness rules have outcomes agency cancelled (failure), agency postponed (no outcome), and agency performed (success - the default).

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
				Add "[indefinite article of part] [short description of part]" to the notable body part descriptions;
			Else:
				Add "[a part]" to the notable body part descriptions;
	Let clothing be the list of things worn by P;
	Repeat with cloth running through clothing:
		Follow the description notability rules for cloth;
		If the outcome of the rulebook is the distinct outcome:
			If cloth provides the property short description 
			and the short description of the cloth is not the default value of text:
				Add "[indefinite article of cloth] [short description of cloth]" to the notable clothing descriptions;
			Else:
				Add "[a cloth]" to the notable clothing descriptions;
	Let possessions be the list of things carried by P;
	Repeat with possession running through possessions:
		Follow the description notability rules for possession;
		If the outcome of the rulebook is the distinct outcome:
			If possession provides the property short description 
			and the short description of the possession is not the default value of text:
				Add "[indefinite article of possession] [short description of possession]" to the notable possession descriptions;
			Else:
				Add "[a possession]" to the notable possession descriptions;
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
			Add "[a part]" to the grouped body part descriptions;
	Let clothing be the list of things worn by P;
	Repeat with cloth running through clothing:
		Follow the description notability rules for cloth;
		If the outcome of the rulebook is the grouped outcome:
			Add "[a cloth]" to the grouped clothing descriptions;
	Let possessions be the list of things carried by P;
	Repeat with possession running through possessions:
		Follow the description notability rules for possession;
		If the outcome of the rulebook is the grouped outcome:
			Add "[a possession]" to the grouped possession descriptions;
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
	If P provides the property agency state description and the agency state description is not the default value of text:
		Say the agency state description of P;

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
The consent rules have outcomes give consent (success) and deny consent (failure - the default).

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

[This volume deals with out-of-game support systems to improve the experience for both the player and the author.]

Book 4.1 - Debug Functions - Not for release

Part 4.1.1 - Debug Examine (DEX)

Chapter 4.1.1a - Action Default

Debug examining is an action out of world applying to one thing.
The debug examining action has a truth state called debug text printed.

The specification of the debug examining action is "The debug examining action is intended to show the intricacies of the kinds in the Erotic Storytelling extension, that isn't always shown my using SHOWME."

Understand "debug examine [something]" and "dex [something]" as debug examining.

The default debug examine rule is listed last in the carry out debug examining rulebook.
Carry out debug examining something (This is the default debug examine rule):
	If debug text printed is false:
		say "There is nothing special about [noun]." (A).

Chapter 4.1.1b - Body Part

Carry out debug examining something (this is the debug examine body parts rule):
	If noun is a body part:
		Now debug text printed is true;
		Let P be the holder of the noun;
		Say "[The noun] is a body part that can [unless noun can be seen]not [end unless]be seen, [unless noun can be touched]not [end unless]be touched and is [unless noun is accessible]not [end unless] accessible.";
		Say "Cover Areas:[line break]";
		Repeat with L running through the cover locations of the noun:
			Say "[L]: [if L can be seen for P]visible[else]hidden[line break]";
		Say "Soft-Play:[line break]";
		If noun is touchable, say "Touchable at [soft-play threshold of noun]([soft-play threshold of P]) up to [soft-play recipient limit of noun]([soft-play recipient limit of P]).";
		If noun is rubbable, say "Rubbable at [soft-play threshold of noun]([soft-play threshold of P]) up to [soft-play recipient limit of noun]([soft-play recipient limit of P]).";
		If noun is tickleable, say "Tickleble at [soft-play threshold of noun]([soft-play threshold of P]) up to [soft-play recipient limit of noun]([soft-play recipient limit of P]).";
		Say "Rough-Play:[line break]";
		If noun is spankable, say "Spankable at [rough-play threshold of noun]([rough-play threshold of P]) up to [rough-play recipient limit of noun]([rough-play recipient limit of P]).";
		If noun is pinchable, say "Pinchable at [rough-play threshold of noun]([rough-play threshold of P]) up to [rough-play recipient limit of noun]([rough-play recipient limit of P]).";
		If noun is biteable, say "Biteable at [rough-play threshold of noun]([rough-play threshold of P]) up to [rough-play recipient limit of noun]([rough-play recipient limit of P]).";
		Say "Oral-Play:[line break]";
		If noun is lickable, say "Lickable at [oral-play threshold of noun]([oral-play threshold of P]) up to [oral-play recipient limit of noun]([oral-play recipient limit of P]).";
		Say "Fuck-Play:[line break]";
		If noun is penetrating, say "Penetrate at [fuck-play threshold of noun]([fuck-play threshold of P]) up to [fuck-play recipient limit of noun]([fuck-play recipient limit of P]).";
		If noun is orificial, say "Orifice at [fuck-play threshold of noun]([fuck-play threshold of P]) up to [fuck-play recipient limit of noun]([fuck-play recipient limit of P]).";

Chapter 4.1.1c - Garment

Carry out debug examining something (this is the debug examine garments rule):
	If noun is a garment:
		Now debug text printed is true;
		Let P be the holder of the noun;
		Say "[The noun] is a garment that [if noun is shiftable]can be [describe shifted of shiftyness of noun][else]can't be shifted[end if], and is [if noun is rippable]rippable[else]not rippable[end if]. It is [if noun can be seen]visible[else]concealed[end if] and [if noun can be touched]touchable[else]covered[end if].";
		If noun is shiftable, say "[The noun] is [if noun is shifted]shifted, revealing[else]not shifted. Shifting it will reveal[end if] the [shifting revealed cover areas of noun].";
		If noun is rippable, say "[The noun] is [if noun is ripped]ripped, revealing[else]not ripped. Ripping it will reveal[end if] the [ripping revealed cover areas of noun].";
		Repeat with L running through the cover areas of the noun:
			Say "[L]:";
			If L is listed in the shifting revealed cover areas of noun, say "(shifting-revealed)";
			If L is listed in the ripping revealed cover areas of noun, say "(shifting-revealed)";
			Say "[if L can be seen for P]visible[else]hidden[end if].";

Chapter 4.1.1d - Person

[TODO]

Book 4.2 - Hint System

Book 4.3 - Content Limits

Book 4.4 - Completion Tracking

Book 4.5 - Commentary System
	
Volume 5 - Templates

[This volume provides ready-to-use templates that can be used in a story.]

Book 5.1 - Ready-to-Use Kinds

Part 5.1.1 - Anatomy

Chapter 5.1.1a - Head

A head is a kind of body part.
The indefinite article is usually "a".
The cover locations of a head is usually {the head area}.

Some hair is a kind of body part.
The indefinite article is usually "some".
It is ambiguously plural.
The cover locations of hair is usually {the head area}.

A face is a kind of body part.
The indefinite article is usually "a".
The cover locations of face is usually {the face area}.

A mouth is a kind of body part.
The indefinite article is usually "a".
The cover locations of mouth is usually {the face area}.
Understand "lip", "lips" as mouth.

A pair of eyes is a kind of body part.
They are usually plural-named. The indefinite article is usually "a". The plural of pair of eyes is pairs of eyes.
The cover locations of pair of eyes is usually {the face area}.

Chapter 5.1.1b - Limbs

Section - Legs

A pair of thighs is a kind of body part.
They are usually plural-named. The indefinite article is usually "a". The plural of pair of thighs is pairs of thighs.
The cover locations of a pair of thighs is usually {the thigh area}. 
A pair of thighs is usually touchable. A pair of thighs is usually rubbable.

A pair of legs is a kind of body part.
They are usually plural-named. The indefinite article is usually "a". The plural of pair of legs is pairs of legs.
The cover locations of a pair of legs is usually {the leg area}.
A pair of legs is usually touchable. A pair of legs is usually rubbable.

A pair of ankles is a kind of body part.
They are usually plural-named. The indefinite article is usually "a". The plural of pair of ankles is pairs of ankles.
The cover locations of a pair of ankles is usually {the feet area, the leg area}.

A pair of feet is a kind of body part.
They are usually plural-named. The indefinite article is usually "a". The plural of pair of feet is pairs of feet.
The cover locations of a pair of feet is usually {the feet area}.
A pair of feet is usually touchable. A pair of feet is usually rubbable. A pair of feet is usually tickleable. A pair of feet is usually lickable. A pair of feet is usually biteable.

Section - Arms

A pair of arms is a kind of body part.
They are usually plural-named. The indefinite article is usually "a". The plural of pair of arms is pairs of arms.
The cover locations of a pair of arms is usually {the arm area}.
A pair of arms is usually touchable. A pair of arms is usually rubbable.

A pair of wrists is a kind of body part.
They are usually plural-named. The indefinite article is usually "a". The plural of pair of wrists is pairs of wrists.
The cover locations of a pair of wrists is usually {the hand area, the arm area}.

A pair of hands is a kind of body part.
The cover locations of a pair of arms is usually {the hand area}.
They are usually plural-named. The indefinite article is usually "a". The plural of pair of hands is pairs of hands.
A pair of hands is usually touchable. A pair of hands is usually rubbable.

Chapter 5.1.1c - Torso

A neck is a kind of body part.
The indefinite article is usually "a".
The cover locations of a neck is usually {the shoulder area}.
A neck is usually lickable. A neck is usually biteable.

A pair of shoulders is a kind of body part.
They are usually plural-named. The indefinite article is usually "a". The plural of pair of shoulders is pairs of shoulders.
The cover locations of a pair of shoulders is usually {the shoulder area}.
A pair of shoulders is usually rubbable. 

A chest is a kind of body part.
The indefinite article is usually "a".
The cover locations of a chest is usually {the upper torso area}.
A chest is usually touchable. A chest is usually rubbable. A chest is usually tickleable. A chest is usually lickable. A chest is usually biteable.

A pair of breasts is a kind of body part.
They are usually plural-named. The indefinite article is usually "a". The plural of pair of breasts is pairs of breasts. 
The cover locations of a pair of breasts is usually {the upper torso area}. 
Understand "tit", "tits", "breast", "boob", "boobs", "tittie", "titties" and "juggs" as a pair of breasts.
A pair of breasts is usually touchable. A pair of breasts is usually rubbable. A pair of breasts is usually tickleable. A pair of breasts is usually lickable. A pair of breasts is usually biteable. A pair of breasts is usually pinchable.

A midriff is a kind of body part.
The indefinite article is usually "a".
The cover locations of a midriff is usually {the lower torso area}.
Understand "stomach", "tummy" as midriff.
A midriff is usually touchable. A midriff is usually rubbable. A midriff is usually tickleable. A midriff is usually lickable.

A waist is a kind of body part.
The indefinite article is usually "a".
The cover locations of a waist is usually {the lower torso area, the lower back area}.

A backside is a kind of body part.
The indefinite article is usually "a".
The cover locations of a backside is usually {the upper back area, the lower back area}.

Chapter 5.1.1d - Crotch

An ass is a kind of body part.
The indefinite article is usually "an".
The cover locations of an ass is usually {the crotch area}.
Understand "asshole", "anus", "rear", "rear end", "butt", "bottom", "rump" as ass.
An ass is usually touchable. An ass is usually rubbable. An ass is usually spankable. An ass is usually pinchable. An ass is usually lickable. An ass is usually orificial.

A penis is a kind of body part.
The indefinite article is usually "a".
The cover locations of a penis is usually {the crotch area}.
Understand "cock", "dick", "wang", "dong", "wiener", "willy", "schlong", "boner", "pecker" as penis.
A penis is usually touchable. A penis is usually rubbable. A penis is usually pinchable. A penis is usually lickable. A penis is usually biteable. A penis is usually penetrating.

A vagina is a kind of body part.
The indefinite article is usually "a".
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
The indefinite article is usually "a".
The specification of bra is "Bras are usually indecent underwear, and go on the upper torso/back."
A bra is usually underwear.
The cloth decency of a bra is usually indecent.
A bra is usually allow touching through.
The cover areas of a pair of panties is usually {upper torso area, upper back area}.

An undershirt is a kind of garment.
The indefinite article is usually "an".
The specification of undershirt is "An undershirt is a shirt that's meant to go under a normal shirt, covering just the torso (front/back). It's usually immodest underwear. It can be ripped to expose the upper torso area."
An undershirt is usually underwear.
The cloth decency of an undershirt is usually immodest.
An undershirt is usually allow touching through.
The cover areas of an undershirt is usually {upper torso area, lower torso area, upper back area, lower back area}.
An undershirt is usually rippable. The ripping revealed cover areas of an undershirt is usually a {upper torso area}.

A swimsuit is a kind of garment.
The indefinite article is usually "a".
The specification of swimsuit is "A swimsuit is immodest underwear that covers the upper torso, lower back/torso and crotch. It doesn't necessarily have to be for swimming; teddies and similar underwear can also use the same template. It can usually be moved aside to expose upper torso."
A swimsuit is usually underwear.
The cloth decency of a swimsuit is usually immodest.
A swimsuit is usually allow touching through.
The cover areas of a swimsuit is usually {upper torso area, lower torso area, lower back area, crotch area}.
A swimsuit is usually shiftable. The shiftyness of a swimsuit is usually moveable. The shifting revealed cover areas of a swimsuit is usually a {upper torso area}.

A bodysuit is a kind of garment.
The indefinite article is usually "a".
The specification of bodysuit is "A bodysuit is a special form of indecent underwear that covers most of a person, only leaving the hands and head/face uncovered."
A bodysuit is usually underwear.
The cloth decency of a bodysuit is usually indecent.
The cover areas of a bodysuit is usually {shoulder area, arm area, upper torso area, upper back area, lower torso area, lower back area, crotch area, thigh area, leg area, feet area}.

A mask is a kind of garment.
The indefinite article is usually "a".
The specification of mask is "A mask covers a persons face and head, and is usually immodest. This is a piece of garment that should be used with care, as it will block access to a person's mouth."
A mask is usually underwear.
The cloth decency of a mask is usually immodest.
The cover areas of a mask is usually {face area, head area}.

Chapter 5.1.2b - Normalwear

[Normalwear is clothing that go on the "normal" layer, above underwear but under overwear. Because pantyhose needs to go over underwear and be on the same layer as socks, socks also sort here.]

A pair of socks is a kind of garment.
They are usually plural-named. The indefinite article is usually "a". The plural of socks is pairs of socks.
The specification of pair of socks is "Socks cover the feet, and is usually formal and normalwear (in order to match stockings and pantyhose)."
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
The indefinite article is usually "a".
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
The indefinite article is usually "a".
The specification of a dress is "A dress covers the entire torso (front and back), as well as the arms/shoulders and thighs/legs. It is usually formal and outerwear. This means a shirt under it, but not a sweater can be worn over it. Making it normalwear would also make for some interesting interactions with pantyhose and trousers. By default a dress can be unbuttoned to access the upper torso; to change this to make it raisable to access the crotch see the definition of minidress (you might also want to change default cover blocking).
Note; Dresses go under boots, which might cause some issues if boots are modified to cover legs/thighs."
A dress is usually overwear.
The cloth decency of dress is usually casual.
The cover areas of a dress is usually {shoulder area, arm area, upper torso area, lower torso area, upper back area, lower back area, crotch area, thigh area, leg area}.
A dress is usually default cover blocking.
A dress is usually shiftable. The shiftyness of a dress is usually buttonable. The shifting revealed cover areas of a dress is usually {shoulder area, upper torso area, lower torso area}.

A minidress is a kind of garment.
The indefinite article is usually "a".
The specification of a minidress is "A minidress is a short dress that doesn't cover the legs; see dress for more details. It's usually casual and normalwear. It's can usually be raised to gain access to the crotch."
A minidress is usually overwear.
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
The indefinite article is usually "a".
The specification of skirt is "A skirt is usually a casual overwear that covers the crotch and thighs, and can easily be made longer by changing the default cover areas. It's usually liftable to expose everything."
A skirt is usually overwear.
The cloth decency of skirt is usually casual.
The cover areas of a skirt is usually {thigh area, crotch area}.
A skirt is usually shiftable. The shiftyness of a skirt is usually raisable. The shifting revealed cover areas of a skirt is usually a {thigh area, crotch area}.

A sweater is a kind of garment.
The indefinite article is usually "a".
The specification of a sweater is "A sweater is a casual overwear that covers the entire upper body and arms. It can be pulled up to expose the upper and lower torso."
A sweater is usually overwear.
The cloth decency of sweater is usually casual.
The cover areas of a sweater is usually {shoulder area, arm area, upper torso area, lower torso area, upper back area, lower back area}.
A sweater is usually default cover blocking.
A sweater is usually shiftable. The shiftyness of a sweater is usually raisable. The shifting revealed cover areas of a sweater is usually a {upper torso area, lower torso area}.

A suit is a kind of garment.
The indefinite article is usually "a".
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
The indefinite article is usually "a".
The specification of hat is "A hat goes on the head, and is usually formal outerwear. Because a hat covers the head area, it will block direct view of hair."
A hat is usually outerwear.
The cloth decency of a hat is usually formal.
The cover areas of a hat is usually {head area}.

A jacket is a kind of garment.
The indefinite article is usually "a".
The specification of jacket is "A jacket is usually formal outerwear that is worn over the torso. It can be unbuttoned to expose the front."
The cover areas of a jacket is usually {arm area, shoulder area, upper torso area, lower torso area, upper back area, lower back area}.
A jacket is usually outerwear.
The cloth decency of jacket is usually formal.
A jacket is usually default cover blocking.
A jacket is usually shiftable. The shiftyness of a jacket is usually buttonable. The shifting revealed cover areas of a jacket is usually {upper torso area, lower torso area}.

A coat is a kind of garment.
The indefinite article is usually "a".
The specification of coat is "A coat a longer version of a jacket, that also covers the thighs and crotch. It can be unbuttoned to expose the front and thighs/crotch."
The cover areas of a coat is usually {arm area, shoulder area, upper torso area, lower torso area, upper back area, lower back area, crotch area, thigh area}.
A coat is usually outerwear.
The cloth decency of coat is usually formal.
A coat is usually default cover blocking.
A coat is usually shiftable. The shiftyness of a coat is usually buttonable. The shifting revealed cover areas of a coat is usually {shoulder area, upper torso area, lower torso area, crotch area, thigh area}.

A pair of gloves is a kind of garment.
The indefinite article is usually "a".
They are usually plural-named. The indefinite article is usually "a". The plural of gloves is pairs of gloves.
The specification of pair of gloves is "Gloves are formal outerwear that go over the hands."
A pair of gloves is usually outerwear.
The cloth decency of pair of gloves is usually formal.
The cover areas of a pair of gloves is usually {hand area}.

Part 5.1.3 - Toy Box

Chapter 5.1.3 - Sex Toy

A sex toy is a kind of thing.
The indefinite article is usually "a".
The specification of a sex toy is "A sex toy is a thing that is intended for use with the fucking it with action, and therefore supports the adjectives penetrating and orificial. It is usually penetrating but not orificial."
A sex toy can be penetrating. A sex toy is usually penetrating.
A sex toy can be orificial. A sex toy is usually not orificial.

Chapter 5.1.4 - Strap-On

A strap-on is a kind of garment.
The indefinite article is usually "a".
The specification of a strap-on is "A strap-on is a special garment that is intended for use with the fucking it with action, and therefore also supports the adjective penetrating (which it usually is). It is indecent and outerwear, so it can be worn over pants and dresses if needed."
A strap-on is usually outerwear.
The cloth decency of a strap-on is usually indecent.
A strap-on is usually allow touching through.
The cover areas of a strap-on is usually {crotch area}.
A strap-on can be penetrating. A strap-on is usually penetrating.

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
		If first person is a person and first person is not listed in the love interests of the actor:
			Say the uninterested response of the actor;
			Deny consent;
		If second person is a person and second person is not listed in the love interests of the actor:
			Say the uninterested response of the actor;
			Deny consent;
	[Check love interests for first person]
	If first person is a person and first person is not the player:
		If actor is not listed in the love interests of the first person:
			Say the uninterested response of the first person;
			Deny consent;
		If second person is a person and second person is not listed in the love interests of the first person:
			Say the uninterested response of the first person;
			Deny consent;
	[Check love interests for second person]
	If second person is a person and second person is not the player:
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
	If the noun is a garment (called G) and G is worn by someone:
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

