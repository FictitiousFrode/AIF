Version 2/170401 of Erotic Storytelling by Fictitious Frode begins here.
"An extension focused on writing Adult Interactive Fiction (AIF) in Inform.
The main features are a layered clothing with body parts and erotic actions with system for obtaining consent on actions involving others characters.
Also includes an optional customizable ready-to-use Discrete-Arousal-based Consent and Stimulation systems, semi-automatic improved description generation, and templates for NPC agency and optional story contents."

[We use the pause function from Basic Screen Effects.]
Include Basic Screen Effects by Emily Short.
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

Book 1.1 - Concepts

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

A body part is a kind of thing. The indefinite article of a body part is usually "a".
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

A garment is a kind of thing. The indefinite article is usually "a".
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

[Status: Complete, minimal implementation
Can re-use reactive crowds and table-based descriptions from outfits extension.]

Chapter 1.1.3a - Definition

An outfit is a kind of garment.
The specification of outfit is "An outfit is a special kind of garment, designed to be an alternative to individual garment pieces the player can interact with. It therefore cover almost all the body areas of a person, except hands and head/face."

The cover areas of an outfit is usually {shoulder area, arm area, upper torso area, upper back area, lower torso area, lower back area, crotch area, thigh area, leg area, feet area}.
The clothing layer of an outfit is usually skinwear.

Chapter 1.1.3b - Wearing Incomptibility

[Ensure that a person wearing an outfit can't also be wearing a garment.]
Check an actor wearing something (this is the outfit incompatibility rule):
	If the noun is a garment and the actor is wearing an outfit (called blocker):
		If the player is the actor:
			Say "[We] [can't] wear [noun], [we] [are] already wearing [blocker]." (A);
		Else if the player can see the actor and the action is not silent:
			Say "[The actor] [can't] wear [noun], [they] [are] already wearing [blocker]." (B);
		Stop the action;
	If the noun is an outfit and the actor is wearing a garment (called blocker):
		If the player is the actor:
			Say "[We] [can't] wear [noun], [we] [are] already wearing [blocker]." (C);
		Else if the player can see the actor and the action is not silent:
			Say "[The actor] [can't] wear [noun], [they] [are] already wearing [blocker]." (D);
		Stop the action;

Book 1.2 - Functionality

Chapter 1.2.0a - Startup Procedures

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
	[Calculate the decency for any undefined persons:]
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
		Let considered be the exposed by area on P;
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

To decide which list of garments is preventing access to (P - a body part):
	Let preventers be a list of garments;
	Let clothing be the list of garments worn by the holder of P;
	Sort clothing in reverse clothing layer order;
	Repeat with A running through the cover locations of P:
		Repeat with cloth running through clothing:
			If A is listed in the modified cover areas of cloth:
				Add cloth to preventers, if absent;
	Decide on preventers;

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
			If clothing layer of cloth >= clothing layer of G:
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
			If clothing layer of cloth >= clothing layer of G:
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
We use the standard wearing action, but add some checks and replace the carry out rule.]

Chapter 1.3.1a - Check

Check an actor wearing something (This is the check wearing garments rule):
	If the noun is a garment (called G):
		[Check that G and the person have atleast one area of overlap]
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

Check an actor wearing something (This is the wearing decency rule):
	Let L be the location of the actor;
	If noun is a garment (called G):
		If the decency threshold of L is greater than the cloth decency of G:
			If the player is the actor:
				Say "It [are] too public for [us] to wear [the noun] here." (A);
			Else if the player can see the actor:
				Say "It [are] too public for [the actor] to wear [the noun] here." (B);
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
Part 1.3.3 deals with an actor taking someone elses clothes.]

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

Check an actor taking off something (This is the taking off garments requires consent rule):
	If the noun is a garment and the noun is worn by someone:
		Follow the consent rules;
		Unless the outcome of the rulebook is the give consent outcome:
			Stop the action;

Chapter 1.3.2b - Carry Out

The standard taking off rule is not listed in any rulebook.
[The modified taking off rule substitutes for the standard taking off rule.]
Carry out an actor taking off (this is the modified taking off rule):
	Let wearer be the holder of the noun;
	Now the actor carries the noun;
	If actor is not keep clothes after undress, silently try the actor dropping the noun;
	If the noun is a garment (called G):
		If G is shifted, now G is unshifted;
		Update decency for the wearer;

Part 1.3.3 - Taking Off Others

[Status: Complete
By default, taking clothing that others are wearing is blocked. This is something that should be allowed in certain situations, so we need to make some changes to the standard rules.]

Chapter 1.3.3a - Removing Existing Blocks

The can't remove from people rule is not listed in any rulebook.
[The revised can't remove from people rule substitutes for the can't remove from people rule.]
Check an actor removing something from (this is the revised can't remove from people rule):
	Let the owner be the holder of the noun;
	If the owner is a person:
		If the owner is the actor, convert to the taking off action on the noun;
		If the noun is a worn garment, try the actor taking the noun instead;
		If the actor is the player:
			Say "[regarding the noun][Those] [seem] to belong to [the owner]." (A);
		Stop the action.

The can't take people's possessions rule is not listed in any rulebook.
[The revised can't take people's possessions rule substitutes for the can't take people's possessions rule.]
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

Chapter 1.3.3b - Implementing Taking

Check an actor taking a garment (this is the can't take covered items rule):
	Abide by the can't take off covered items rule;
	Abide by the can't take off in public rule;

Check an actor taking something (This is the taking garments requires consent rule):
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

Stripping is an action applying to one touchable thing.
The specification of the stripping action is "Stripping is the act of removing all clothing worn. To accomplish this all garments are undressed in descending order of layer."

Implicit stripping is an action applying to nothing.

Chapter 1.3.5a - Understanding

Understand "strip [something]", "undress [something]" as stripping.
Understand "strip", "undress", "get undressed", "disrobe" as implicit stripping.

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

Carry out an actor implicit stripping (this is the implicit stripping redirect rule):
	Try the actor stripping the actor instead;

Carry out an actor stripping (this is the default stripping rule):
	Let clothing be the list of garments worn by noun;
	Sort clothing in reverse clothing layer order;
	Let stoppage be false;
	Repeat with garment running through clothing:
		If the actor is the noun:
			If stoppage is false, silently try the actor taking off garment;
		Else:
			If stoppage is false, silently try the actor taking garment;
		If the noun is wearing garment:
			If the actor is not the player, say "[The actor] [are] unable to take off [the garment]." (A);
			Let stoppage be true;

Chapter 1.3.5d - Report

Report an actor stripping (this is the report stripping rule):
	If the noun is not wearing any garments:
		If the player is the actor:
			Say "[We] [take] off all [their] clothes and [are] now completely naked." (A);
		Else if the player can see the actor and the actor is the noun:
			Say "[The actor] [take] off all [their] clothes and [are] now completely naked." (B);
		Else if the player can see the noun:
			If the player can see the actor:
				Say "[The noun] has all of [their] clothes removed by [the actor], and [are] now completely naked." (C);
			Else:
				Say "[The noun] has all of [their] clothes removed, and [are] now completely naked." (D);
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

Check an actor shifting something (This is the shifting garments requires consent rule):
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

Check an actor unshifting something (This is the unshifting garments requires consent rule):
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

Chapter 1.4.3a - Understanding

Understand "rip open/off/up/-- [garment]" as ripping.
Understand "tear open/off/up/-- [garment]" as ripping.

Chapter 1.4.3b - Check

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

Check an actor ripping something (This is the ripping garments requires consent rule):
	If the noun is a garment and the noun is worn by someone:
		Follow the consent rules;
		Unless the outcome of the rulebook is the give consent outcome:
			Stop the action;

Chapter 1.4.3c - Carry Out

Carry out an actor ripping (this is the standard ripping rule):
	If the noun provides the property ripped, now the noun is ripped;
	Update decency for the holder of noun;

Carry out an actor ripping (this is the ripping replaces shifting rule):
	If the noun provides the property shifted and the noun is shifted, now the noun is unshifted;

Chapter 1.4.3d - Report

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
The third book is an attempt at an improved conversation system - Excised into its own extension.
The last book deals with posturing - Excised into its own extension.]

Book 2.1 - Agency

[A person can have three levels of agency:
Idleness: Messages that are printed when the person is not actively engaged in something. These are only processed if the player can see the person.
Planned: Actions that the person seeks to perform, but which will be postponed if they are engaged with someone.
Urgent: Actions that the person urgently seek to perform, even if engaged with someone.]

Part 2.1.1 - Concepts

[Status: Complete
This part deals with the underlying concepts needed to make agency processing possible]

Chapter 2.1.1a - Occupied Flag

[We need a way to stop people from doing several agency actions in a turn, so we set a flag.
This is also used to suppress planned agency when the player interacts with that person, and can also be used to allow NPCs to interact with each other without acting twice.
It can also be set manually as needed to delay agency for a turn, but if longer term stopping is needed, use the next property instead.]

A person can be occupied or unoccupied. A person is usually unoccupied.

Before asking someone (called P) to try doing something (this is the mark instruced person as occupied rule):
	Now P is occupied;
	Continue the action;

Before doing something to someone (called P) (this is the mark person as occupied rule):
	Now P is occupied;
	Continue the action;

Before doing something to a body part (called B) (this is the mark body part holder as occupied rule):
	If B is part of a person (called P):
		Now P is occupied;
	Continue the action;

Before doing something to a garment (called G) (this is the mark clothing wearer as occupied rule):
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
			Let cloth-status be "";
			If cloth provides the property ripped and the cloth is ripped, let cloth-status be " (ripped)";
			If cloth provides the property shifted and the cloth is shifted, let cloth-status be " ([describe shifted of the shiftyness of cloth])";
			If cloth provides the property short description and the short description of the cloth is not the default value of text:
				Add "[indefinite article of cloth] [short description of cloth][cloth-status]" to the notable clothing descriptions;
			Else:
				Add "[a cloth][cloth-status]" to the notable clothing descriptions;
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
			Let cloth-status be "";
			If cloth provides the property ripped and the cloth is ripped, let cloth-status be " (ripped)";
			If cloth provides the property shifted and the cloth is shifted, let cloth-status be " ([describe shifted of the shiftyness of cloth])";
			Add "[a cloth][cloth-status]" to the grouped clothing descriptions;
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

[The purpose of this rule is to give a snapshot of their agency state.]
A default description generation rule for a person (called P) (this is the generate script description rule):
	If P provides the property agency state description and the agency state description is not the default value of text:
		Say the agency state description of P;

Volume 3 - Erotic Actions

Book 3.1 - Concepts

Part 3.1.1 - Stimulation

Chapter 3.1.1a - Stimulation Rulebook

[Stimulation is a rulebook that deals with altering the arousal of participants in erotic actions.
We create a new rulebook, with outcomes stimulated and unstimulated, and defaulting to being stimulated. Because of the default value, rules will not fall though to the next case unless explicitly told to make no decision. This allows us to populate the rulebook with default rules.]

The stimulation rules is a rulebook.
The stimulation rules have outcomes stimulated (success - the default) and unstimulated (failure).

[This default stimulation rule is as generic as possible, and will be executed last.
It's main purpose is to stop the execution of any rule defined to be after it.]
The default stimulation rule is listed last in the stimulation rules.
A stimulation rule (this is the default stimulation rule):
	Unstimulated;

Part 3.1.2 - Consent

Chapter 3.1.2a - Consent Rulebook

[We use a rulebook to gain consent for actions.]
The consent rules is a rulebook.
The consent rules have outcomes give consent (success) and deny consent (failure - the default).

[This default consent rule is as generic as possible, and will be executed last.]
The default consent rule is listed last in the consent rules.
A consent rule (this is the default consent rule):
	[Check consent for the actor first; we assume that the player always consent.]
	If the actor is not the player:
		Say the uninterested response of the actor;
[		Say "[The actor] [aren't] consenting to that ([current action])." (A);]
		Deny consent;
	[Check consent for the noun directly]
	If the noun is a person:
		If the noun is not the player:
			Say the uninterested response of the noun;
[			Say "[The noun] [aren't] consenting to that ([current action])." (B);]
			Deny consent;
	Else if the noun is a body part:
		Let P be the holder of the noun;
		If P is not the player:
			Say the uninterested response of P;
[			Say "[The P] [aren't] consenting to that ([current action])." (C);]
			Deny consent;
	Else if the noun is a garment worn by someone (called P):
		If P is not the player:
			Say the uninterested response of P;
[			Say "[The P] [aren't] consenting to that ([current action])." (C);]
			Deny consent;
	Give consent;

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

Book 3.2 - Body Part Actions

[These are the actions that target body parts; attempts to target a player are either redirected or blocked.]

Part 3.2.1 - Touching

[Status: Complete
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

[Status: Complete
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

[Status: Complete
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

Part 3.2.4 - Spanking

[Status: Complete
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

[Status: Complete
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

[Status: Complete
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

[Status: Complete
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

[Status: Complete
Kissing is already covered in the Standard Rules, but it's disabled by default.
We replace the blocks with our own checks, taking into account that only other people can be kissed, decency and consent/arousal, and handle action reporting.]

The specification of the kissing action is "Possibly because Inform was originally written by an Englishman, attempts at kissing another person are normally blocked as being unrealistic or not seriously meant. So the Standard Rules simply block attempts to kiss people, but the action exists for rules to make exceptions.
Erotic Storytelling replaces the existing checks that block kissing, replacing them with checks to see that only other people can be kissed, and attempts to kiss body parts are redirected to licking that part."

The kissing decency is initially casual.

Chapter 3.3.1a - Understanding

Understand "kiss [something]" as kissing.

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

[Status: Complete
Hugging is a new action. It takes into account that only other people can be hugged, decency and consent/arousal, and handle reporting.]

Hugging is an action applying to one touchable thing.
The specification of the hugging action is "Shows affection to another person by giving them a hug. Only other people can be hugged, hugging a body part redirects to touching."

The hugging decency is initially formal.

Chapter 3.3.2a - Understanding

Understand the command "hug" as something new.
Understand "hug [something]" as hugging.
Understand the command "embrace" as something new.
Understand "embrace [something]" as hugging.

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

[Status: Complete
Dancing with is a new action. It takes into account that only other people can be danced with, decency and consent/arousal, and handle action reporting.]

The dancing decency is initially formal.

Dancing is an action applying to one touchable thing.
The specification of the dancing action is "Dancing with is the act of dancing with a someone, including dancing with yourself."
Implicit dancing is an action applying to nothing.

Chapter 3.3.3a - Understanding

Understand "dance with [something]" as dancing.
Understand "dance" as implicit dancing.
Understand "dance for me" as implicit dancing.

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

Carry out an actor implicit dancing (this is the implicit dancing redirect rule):
	Try the actor dancing the actor instead;

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
	[Case 1: The target is an orifice, and we need to find a suitable penetrator]
	If the noun provides the property orificial and the noun is orificial:
		If the actor is enclosing a penis (called P):
			Try the actor fucking the noun with P instead;
		If the actor is enclosing a penetrating body part (called P):
			Try the actor fucking the noun with P instead;
		If the actor is wearing a penetrating garment (called P):
			Try the actor fucking the noun with P instead;
		If the actor is carrying a penetrating thing (called P):
			Try the actor fucking the noun with P instead;
	[Case 2: The target is a penetrator, and we need to find a suitable orifice and reverse]
	If the noun provides the property penetrating and the noun is penetrating:
		If actor is enclosing a vagina (called V):
			Try the actor fucking V with the noun instead;
		If actor is enclosing an ass (called A):
			Try the actor fucking A with the noun instead;
		If actor is enclosing an orificial body part (called O):
			Try the actor fucking O with the noun instead;
	[Case 3: The target is a person, and we try to first find the penetrator then the orifice.]
	If the noun is a person:
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
Does the player mean titfucking a person enclosing some breasts: It is likely.
Does the player mean titfucking some breasts: It is likely.

Chapter 3.4.3b - Redirecting

Check an actor titfucking (This is the titfucking redirect rule):
	If the noun is a some breasts:
		Try the actor fucking the noun instead;
	Else if the noun is a person enclosing some breasts (called B):
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

Book 3.6 - Default Persuasion

[Ideally we would find a way to use the consent rules to grant persuasion. 
Unfortunately the action of asking another person to do something is not easily converted to the person doing the action. Instead we grant default persuasion success for the actions that require consent, and let the consent rules stop the action instead.
Because this is a rather big change, we make it an optional toggle.]

Use consensual persuasion translates as (- Constant IMPLIED_PERSUASION; -). 

Part 3.6.1 - Clothing Actions

Chapter 3.6.1a - Wearing Garments

Persuasion for asking someone to try wearing a garment (this is the consensual wearing persuasion rule): If consensual persuasion option is active, persuasion succeeds.
Unsuccessful attempt by someone wearing something when the reason the action failed is the wearing requires consent rule: Rule succeeds;

Chapter 3.6.1b - Taking Off Garments

Persuasion for asking someone to try taking off a garment (this is the consensual taking garments persuasion rule): If consensual persuasion option is active, persuasion succeeds.
Unsuccessful attempt by someone taking off something when the reason the action failed is the taking off garments requires consent rule: Rule succeeds;

Chapter 3.6.1c - Taking Garments Off Others

Persuasion for asking someone to try taking a garment (this is the consensual taking off garments persuasion rule): If consensual persuasion option is active, persuasion succeeds.
Unsuccessful attempt by someone taking a garment when the reason the action failed is the taking garments requires consent rule: Rule succeeds;

Chapter 3.6.1d - Shifting Garments

Persuasion for asking someone to try shifting a garment (this is the consensual shifting garments persuasion rule): If consensual persuasion option is active, persuasion succeeds.
Unsuccessful attempt by someone shifting something when the reason the action failed is the shifting garments requires consent rule: Rule succeeds;

Chapter 3.6.1e - Unshifting Garments

Persuasion for asking someone to try unshifting a garment (this is the consensual unshifting garments persuasion rule): If consensual persuasion option is active, persuasion succeeds.
Unsuccessful attempt by someone unshifting something when the reason the action failed is the unshifting garments requires consent rule: Rule succeeds;

Chapter 3.6.1f - Ripping Garments

Persuasion for asking someone to try ripping a garment (this is the consensual ripping garments persuasion rule): If consensual persuasion option is active, persuasion succeeds.
Unsuccessful attempt by someone ripping something when the reason the action failed is the ripping garments requires consent rule: Rule succeeds;

Chapter 3.6.1g - Dressing

Persuasion for asking someone to try dressing (this is the consensual dressing persuasion rule): If consensual persuasion option is active, persuasion succeeds.

Chapter 3.6.1h - Stripping

Persuasion for asking someone to try stripping (this is the consensual stripping persuasion rule): If consensual persuasion option is active, persuasion succeeds.
Persuasion for asking someone to try implicit stripping (this is the consensual implicit stripping persuasion rule): If consensual persuasion option is active, persuasion succeeds.

Part 3.6.2 - Body Part Actions

Chapter 3.6.2a - Touching

Persuasion for asking someone to try touching a person (this is the consensual touching people persuasion rule): If consensual persuasion option is active, persuasion succeeds.
Persuasion for asking someone to try touching something enclosed by a person (this is the consensual touching persuasion rule): If consensual persuasion option is active, persuasion succeeds.
Unsuccessful attempt by someone touching something when the reason the action failed is the seek consent for touching rule: Rule succeeds;

Chapter 3.6.2b - Rubbing

Persuasion for asking someone to try rubbing a person (this is the consensual rubbing people persuasion rule): If consensual persuasion option is active, persuasion succeeds.
Persuasion for asking someone to try rubbing something enclosed by a person (this is the consensual rubbing persuasion rule): If consensual persuasion option is active, persuasion succeeds.
Unsuccessful attempt by someone rubbing something when the reason the action failed is the seek consent for rubbing rule: Rule succeeds;

Chapter 3.6.2c - Tickling

Persuasion for asking someone to try tickling a person (this is the consensual tickling people persuasion rule): If consensual persuasion option is active, persuasion succeeds.
Persuasion for asking someone to try tickling something enclosed by a person (this is the consensual tickling persuasion rule): If consensual persuasion option is active, persuasion succeeds.
Unsuccessful attempt by someone tickling something when the reason the action failed is the seek consent for tickling rule: Rule succeeds;

Chapter 3.6.2d - Spanking

Persuasion for asking someone to try spanking a person (this is the consensual spanking people persuasion rule): If consensual persuasion option is active, persuasion succeeds.
Persuasion for asking someone to try spanking something enclosed by a person (this is the consensual spanking persuasion rule): If consensual persuasion option is active, persuasion succeeds.
Unsuccessful attempt by someone spanking something when the reason the action failed is the seek consent for spanking rule: Rule succeeds;

Chapter 3.6.2e - Pinching

Persuasion for asking someone to try pinching a person (this is the consensual pinching people persuasion rule): If consensual persuasion option is active, persuasion succeeds.
Persuasion for asking someone to try pinching something enclosed by a person (this is the consensual pinching persuasion rule): If consensual persuasion option is active, persuasion succeeds.
Unsuccessful attempt by someone pinching something when the reason the action failed is the seek consent for pinching rule: Rule succeeds;

Chapter 3.6.2f - Licking

Persuasion for asking someone to try licking a person (this is the consensual licking people persuasion rule): If consensual persuasion option is active, persuasion succeeds.
Persuasion for asking someone to try licking something enclosed by a person (this is the consensual licking persuasion rule): If consensual persuasion option is active, persuasion succeeds.
Unsuccessful attempt by someone licking something when the reason the action failed is the seek consent for licking rule: Rule succeeds;

Chapter 3.6.2g - Biting

Persuasion for asking someone to try biting a person (this is the consensual biting people persuasion rule): If consensual persuasion option is active, persuasion succeeds.
Persuasion for asking someone to try biting something enclosed by a person (this is the consensual biting persuasion rule): If consensual persuasion option is active, persuasion succeeds.
Unsuccessful attempt by someone biting something when the reason the action failed is the seek consent for biting rule: Rule succeeds;

Chapter 3.6.2h - Fucking It With

Persuasion for asking someone to try fucking something with something (this is the consensual fucking persuasion rule): If consensual persuasion option is active, persuasion succeeds.
Unsuccessful attempt by someone fucking something with when the reason the action failed is the seek consent for fucking rule: Rule succeeds;

Part 3.6.3 - Person Actions

Chapter 3.6.3a - Kissing

Persuasion for asking someone to try kissing a person (this is the consensual kissing people persuasion rule): If consensual persuasion option is active, persuasion succeeds.
Persuasion for asking someone to try kissing something enclosed by a person (this is the consensual kissing persuasion rule): If consensual persuasion option is active, persuasion succeeds.
Unsuccessful attempt by someone kissing something when the reason the action failed is the seek consent for kissing rule: Rule succeeds;

Chapter 3.6.3b - Hugging

Persuasion for asking someone to try hugging a person (this is the consensual hugging people persuasion rule): If consensual persuasion option is active, persuasion succeeds.
Persuasion for asking someone to try hugging something enclosed by a person (this is the consensual hugging persuasion rule): If consensual persuasion option is active, persuasion succeeds.
Unsuccessful attempt by someone hugging something when the reason the action failed is the seek consent for hugging rule: Rule succeeds;

Chapter 3.6.3c - Dancing

Persuasion for asking someone to try implicit dancing (this is the consensual implicit dancing persuasion rule): If consensual persuasion option is active, persuasion succeeds.
Persuasion for asking someone to try dancing a person (this is the consensual dancing people persuasion rule): If consensual persuasion option is active, persuasion succeeds.
Persuasion for asking someone to try dancing something enclosed by a person (this is the consensual dancing persuasion rule): If consensual persuasion option is active, persuasion succeeds.
Unsuccessful attempt by someone dancing something when the reason the action failed is the seek consent for dancing rule: Rule succeeds;

Part 3.6.4 - Redirect Actions

Chapter 3.6.4a - Fucking

Persuasion for asking someone to try fucking something (this is the consensual implicit fucking persuasion rule): If consensual persuasion option is active, persuasion succeeds.

Chapter 3.6.4b - Assfucking

Persuasion for asking someone to try assfucking something (this is the consensual implicit assfucking persuasion rule): If consensual persuasion option is active, persuasion succeeds.

Chapter 3.6.4c - Titfucking

Persuasion for asking someone to try titfucking something (this is the consensual implicit titfucking persuasion rule): If consensual persuasion option is active, persuasion succeeds.

Volume 4 - Support Systems

[This volume deals with out-of-game support systems to improve the experience for both the player and the author.]

Book 4.1 - Debug Functions - Not for release

Part 4.1.1 - Debug Examine (DEX)

[Status: Partially implemented
This is intended to display all the information that SHOWME doesn't.]

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

Carry out debug examining something (this is the debug examine people rule):
	If noun is a person:
		Now debug text printed is true;
		Repeat with area running through the body areas of the noun:
			Let considered be the exposed by area on the noun;
			Say "[Area] - [considered][line break]";

Book 4.2 - Story Contents

[Status: In development/Stable-Unfinished
A system for the story author to announce to the player which types of content the story contains, with the possibility of some types being optional based on the player's preferences.]

Part 4.2.1 - Concepts

[Status: Complete
This part deals with the concepts of story contents and their properties.]

Chapter 4.2.1a - Types

A story content is a kind.
A story content has some text called the description.
A story content can be enabled or disabled. [Controls if the content type is currently enabled for the story.]
A story content can be mandatory or optional. [Controls if the content type can be toggled by the player.]

Chapter 4.2.1b - Inferences

A story content is usually enabled.
A story content is usually mandatory.
A disabled story content is usually optional.

Part 4.2.2 - Manipulation

[Status: In development/Stable-Unfinished
This part deals with the player's interaction of the story contents, including viewing which content is included and toggling anything that's optional.]

Chapter 4.2.2a - Displaying Contents

[List out the contents included in the story, categorized by mandatory/optional]
To display story contents:
	Let contents be the list of story contents;
	If contents is not empty:
		Let mandatory be the list of mandatory enabled story contents;
		Let options be the list of optional story contents;
		Say "This story includes the following types of content:[paragraph break]";
		If mandatory is not empty:
			Say "[bold type]Mandatory[roman type]:[line break]";
			Let size be the number of entries in mandatory;
			Let counter be 0;
			Repeat with content running through mandatory:
				Increase counter by 1;
				Say "[fixed letter spacing](*) [roman type][content]";
				If size is counter, say paragraph break;
				Else say line break;
		If options is not empty:
			Say "[bold type]Optional[roman type]:[line break]";
			Let size be the number of entries in options;
			Let counter be 0;
			Repeat with content running through options:
				Increase counter by 1;
				Say "[fixed letter spacing][if content is enabled](*)[else]( )[end if] [roman type][content]";
				If size is counter, say paragraph break;
				Else say line break;

Chapter 4.2.2b - Verifying Contents

[Give the player the opportunity to verify which optional content types they want to experience]
To verify story contents:
	Let options be the list of optional story contents;
	If options is not empty:
		Say "Please make a choice on which of the following optional content types you would like to experience:";
		Say paragraph break;
		Repeat with content running through options:
			Say "Would you like to experience [content] (currently [if content is enabled]enabled[else]disabled[end if])?[run paragraph on]";
			If the description of content is not the default value of text:
				Say paragraph break;
				Say description of content;
			Say line break;
			Say "(Y/N)";
			If player consents:
				Now content is enabled;
			Else:
				Now content is disabled;
	Else:
		Say "There is no optional content to choose from in this story.";
		Say paragraph break;

Chapter 4.2.2c - Info/Warning Screen

[At the start of play, warn the player of the contents of the story.]
The adult introduction rule is listed before the start in the correct scenes rule in the startup rulebook.
This is the adult introduction rule:
	Say "[bold type]WARNING[roman type][paragraph break]";
	Say "This is a game of [bold type]Adult[roman type] Interactive Fiction. It contains scenes and imagery of an explicit sexual nature intended for a mature audience. If you are underaged, easily offended or not interested in this kind of material, [bold type]please quit now[roman type].[paragraph break]";
	Say "(-more-)[paragraph break]";
	Wait for any key;
	Let contents be the list of story contents;
	If contents is not empty:
		Let repeating be true;
		Let optional be the list of optional story contents;
		While repeating is true:
			Display story contents;
			If optional is not empty:
				Say "Would you like to modify which of the optional content types to experience? (Y/N)";
				If player consents:
					Say paragraph break;
					Verify story contents;
				Else:
					Now repeating is false;
					Say paragraph break;
			Else:
				Now repeating is false;
	Say "The story makes use of concepts and actions related to the adult nature of the story in addition to the usual Interactive Fiction commands.";
	Say "Type '[bold type]HELP[roman type]' to access the built-in help system for details on how the erotic actions, cloth and body parts functions.[paragraph break]";
	Say "(-more-)[paragraph break]";
	Wait for any key;
	Clear the screen;

Book 4.3 - Help System

[Status: TODO
We want to provide help topics for Basic IF, Adult IF, Clothing, Body Parts]

Book 4.4 - Commentary System

Part 4.4.1 - Inspirational Amusement

[Status: TODO/Not implemented
We create a method for entering amusing anectdotes that can be displayed to a victorious player.
This is inspired by Example 383: Jamaica 1688.]

Book 4.5 - Completion Tracking

[Status: TODO/Not implemented]
	
Volume 5 - Templates

[This volume provides ready-to-use templates that can be used in a story.]

Book 5.1 - Ready-to-Use Kinds

Part 5.1.1 - Anatomy

Chapter 5.1.1a - Head

A head is a kind of body part.
The cover locations of a head is usually {the head area}.

Some hair is a kind of body part.
It is usually ambiguously plural. The indefinite article is usually "some".
The cover locations of hair is usually {the head area}.

A face is a kind of body part.
The cover locations of face is usually {the face area}.

A mouth is a kind of body part.
The cover locations of mouth is usually {the face area}.
Understand "lip", "lips" as mouth.

Some eyes is a kind of body part.
It is usually ambiguously plural. The indefinite article is usually "some". The plural of some eyes is pairs of eyes.
The cover locations of some eyes is usually {the face area}.

Chapter 5.1.1b - Limbs

Section - Legs

Some thighs is a kind of body part.
It is usually ambiguously plural. The indefinite article is usually "some". The plural of some thighs is pairs of thighs.
The cover locations of some thighs is usually {the thigh area}. 
Some thighs is usually touchable. Some thighs is usually rubbable.

Some legs is a kind of body part.
It is usually ambiguously plural. The indefinite article is usually "some". The plural of some legs is pairs of legs.
The cover locations of some legs is usually {the leg area}.
Some legs is usually touchable. Some legs is usually rubbable.

Some ankles is a kind of body part.
It is usually ambiguously plural. The indefinite article is usually "some". The plural of some ankles is pairs of ankles.
The cover locations of some ankles is usually {the feet area, the leg area}.

Some feet is a kind of body part.
It is usually ambiguously plural. The indefinite article is usually "some". The plural of some feet is pairs of feet.
The cover locations of some feet is usually {the feet area}.
Some feet is usually touchable. Some feet is usually rubbable. Some feet is usually tickleable. Some feet is usually lickable. Some feet is usually biteable.

Section - Arms

Some arms is a kind of body part.
It is usually ambiguously plural. The indefinite article is usually "some". The plural of some arms is pairs of arms.
The cover locations of some arms is usually {the arm area}.
Some arms is usually touchable. Some arms is usually rubbable.

Some wrists is a kind of body part.
It is usually ambiguously plural. The indefinite article is usually "some". The plural of some wrists is pairs of wrists.
The cover locations of some wrists is usually {the hand area, the arm area}.

Some hands is a kind of body part.
The cover locations of some hands is usually {the hand area}.
It is usually ambiguously plural. The indefinite article is usually "some". The plural of some hands is pairs of hands.
Some hands is usually touchable. Some hands is usually rubbable.

Chapter 5.1.1c - Torso

A neck is a kind of body part.
The cover locations of a neck is usually {the shoulder area}.
A neck is usually lickable. A neck is usually biteable.

Some shoulders is a kind of body part.
It is usually ambiguously plural. The indefinite article is usually "some". The plural of some shoulders is pairs of shoulders.
The cover locations of some shoulders is usually {the shoulder area}.
Some shoulders is usually rubbable. 

A chest is a kind of body part.
The cover locations of a chest is usually {the upper torso area}.
A chest is usually touchable. A chest is usually rubbable. A chest is usually tickleable. A chest is usually lickable. A chest is usually biteable.

Some breasts is a kind of body part.
It is usually ambiguously plural. The indefinite article is usually "some". The plural of some breasts is pairs of breasts. 
The cover locations of some breasts is usually {the upper torso area}. 
Understand "tit", "tits", "breast", "boob", "boobs", "tittie", "titties" and "juggs" as some breasts.
Some breasts is usually touchable. Some breasts is usually rubbable. Some breasts is usually tickleable. Some breasts is usually lickable. Some breasts is usually biteable. Some breasts is usually pinchable.

An abdomen is a kind of body part.
The indefinite article is usually "an".
The cover locations of an abdomen is usually {the lower torso area}.
Understand "stomach", "tummy", "belly", "midriff" as abdomen.
An abdomen is usually touchable. An abdomen is usually rubbable. An abdomen is usually tickleable. An abdomen is usually lickable.

A waist is a kind of body part.
The cover locations of a waist is usually {the lower torso area, the lower back area}.

A backside is a kind of body part.
The cover locations of a backside is usually {the upper back area, the lower back area}.

Chapter 5.1.1d - Crotch

An ass is a kind of body part.
The indefinite article is usually "an".
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

Some panties is a kind of garment.
It is usually ambiguously plural. The indefinite article is usually "some". The plural of some panties is pairs of panties.
Understand "underwear", "undie", "undies" as some panties.
The specification of some panties is "Panties (for both sexes, despite the name) cover the crotch. They can be moved aside and ripped apart, and are usually indecent normalwear."
Some panties is usually underwear.
The cloth decency of some panties is usually indecent.
Some panties is usually allow touching through.
The cover areas of some panties is usually {crotch area}.
Some panties is usually shiftable. The shiftyness of some panties is usually moveable. The shifting revealed cover areas of some panties is usually {crotch area}.
Some panties is usually rippable. The ripping revealed cover areas of some panties is usually {crotch area}.

A bra is a kind of garment.
The specification of bra is "Bras are usually indecent underwear, and go on the upper torso/back."
A bra is usually underwear.
The cloth decency of a bra is usually indecent.
A bra is usually allow touching through.
The cover areas of a bra is usually {upper torso area, upper back area}.

An undershirt is a kind of garment.
The indefinite article is usually "an".
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

A mask is a kind of garment.
The specification of mask is "A mask covers a persons face and head, and is usually immodest. This is a piece of garment that should be used with care, as it will block access to a person's mouth."
A mask is usually underwear.
The cloth decency of a mask is usually immodest.
The cover areas of a mask is usually {face area, head area}.

Chapter 5.1.2b - Normalwear

[Normalwear is clothing that go on the "normal" layer, above underwear but under overwear. Because pantyhose needs to go over underwear and be on the same layer as socks, socks also sort here.]

Some socks is a kind of garment.
It is usually ambiguously plural. The indefinite article is usually "some". The plural of some is pairs of socks.
The specification of some socks is "Socks cover the feet, and is usually formal and normalwear (in order to match stockings and pantyhose)."
Some socks is usually normalwear.
The cloth decency of some socks is usually formal.
Some socks is usually allow touching through.
The cover areas of some socks is usually {feet area}.

Some stockings is a kind of garment.
It is usually ambiguously plural. The indefinite article is usually "some". The plural of some stockings is pairs of stockings.
The specification of some stockings is "Stockings covers feet, legs and thighs, and does not fit over anything. It is not compatible with pantyhose (which also covers the crotch). They are usually formal."
Some stockings is usually normalwear.
The cloth decency of some stockings is usually formal.
Some stockings is usually allow touching through.
The cover areas of some stockings is usually {feet area, leg area, thigh area}.
Some stockings is usually rippable. The ripping revealed cover areas of some stockings is usually {thigh area}.

Some pantyhose is a kind of garment.
It is usually ambiguously plural. The indefinite article is usually "some". The plural of some pantyhose is pairs of pantyhose.
The specification of some pantyhose is "Pantyhose is similar to stockings, but also covers the crotch, which means they both have to be normalwear to fit over panties. It is usually formal, and can be ripped to expose the crotch."
Some pantyhose is usually normalwear.
The cloth decency of a some pantyhose is usually formal.
Some pantyhose is usually allow touching through.
The cover areas of some pantyhose is usually {feet area, leg area, thigh area, crotch area}.
Some pantyhose is usually rippable. The ripping revealed cover areas of some pantyhose is usually {crotch area}.

A shirt is a kind of garment.
The specification of shirt is "Shirt covers the entire back and torso, as well as shoulders and arms. It is usually casual and normalwear."
A shirt is usually normalwear.
The cloth decency of shirt is usually casual.
The cover areas of a shirt is usually {shoulder area, arm area, upper torso area, lower torso area, upper back area, lower back area}.
A shirt is usually default cover blocking.
A shirt is usually shiftable. The shiftyness of a shirt is usually buttonable. The shifting revealed cover areas of a shirt is usually {shoulder area, upper torso area, lower torso area}.
A shirt is usually rippable. The ripping revealed cover areas of a shirt is usually {shoulder area, upper torso area, lower torso area}.

Some glasses is a kind of garment.
It is usually ambiguously plural. The indefinite article is usually "some". The plural of some glasses is pairs of glasses.
Understand "goggles", "eyewear" as some glasses.
The specification of some glasses is "Glasses go on the face, and are usually formal normalwear. Because of this, they will block direct access and view to face parts (such as the mouth); this is usually not a problem as kissing redirects to the person."
Some glasses is usually normalwear.
The cloth decency of some glasses is usually formal.
The cover areas of some glasses is usually {face area}.

A minidress is a kind of garment.
The specification of a minidress is "A minidress is a short dress that doesn't cover the legs; see dress for more details. It's usually casual and normalwear. It's can usually be raised to gain access to the crotch."
A minidress is usually normalwear.
The cloth decency of minidress is usually immodest.
The cover areas of a minidress is usually {shoulder area, arm area, upper torso area, lower torso area, upper back area, lower back area, crotch area, thigh area}.
A minidress is usually shiftable. The shiftyness of a minidress is usually raisable. The shifting revealed cover areas of a minidress is usually {crotch area, thigh area}.

Chapter 5.1.2c - Overwear

[Overwear is the outer layer of clothing, and is only covered by outerwear (clothing that is meant for outside use).]

A dress is a kind of garment.
The specification of a dress is "A dress covers the entire torso (front and back), as well as the arms/shoulders and thighs/legs. It is usually formal and outerwear. This means a shirt under it, but not a sweater can be worn over it. Making it normalwear would also make for some interesting interactions with pantyhose and trousers. By default a dress can be unbuttoned to access the upper torso; to change this to make it raisable to access the crotch see the definition of minidress (you might also want to change default cover blocking).
Note; Dresses go under boots, which might cause some issues if boots are modified to cover legs/thighs."
A dress is usually overwear.
The cloth decency of dress is usually casual.
The cover areas of a dress is usually {shoulder area, arm area, upper torso area, lower torso area, upper back area, lower back area, crotch area, thigh area, leg area}.
A dress is usually default cover blocking.
A dress is usually shiftable. The shiftyness of a dress is usually buttonable. The shifting revealed cover areas of a dress is usually {shoulder area, upper torso area, lower torso area}.

Some trousers is a kind of garment.
It is usually ambiguously plural. The indefinite article is usually "some". The plural of some trousers is pairs of trousers.
Understand "pants", "jeans", "pair of pants/jeans" as some trousers.
The specification of some trousers is "Trousers (or pants/jeans) are casual clothes worn over the legs/thighs and crotch. They can usually be unzipped to allow access to the crotch."
Some trousers is usually overwear.
The cloth decency of some trousers is usually casual.
The cover areas of some trousers is usually {leg area, thigh area, crotch area}.
Some trousers is usually default cover blocking.
Some trousers is usually shiftable. The shiftyness of some trousers is usually zipable. The shifting revealed cover areas of some trousers is usually {crotch area}.

Some shorts is a kind of garment.
It is usually ambiguously plural. The indefinite article is usually "some". The plural of some shorts is pairs of shorts.
The specification of some shorts is "Shorts are (as the name implies) short pants that don't cover the legs. As such they are casual overwear that cover the thighs and crotch. They can usually be unzipped to allow access to the crotch."
Some shorts is usually overwear.
The cloth decency of some shorts is usually casual.
The cover areas of some shorts is usually {thigh area, crotch area}.
Some shorts is usually default cover blocking.
Some shorts is usually shiftable. The shiftyness of some shorts is usually zipable. The shifting revealed cover areas of some shorts is usually {crotch area}.

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

Some shoes is a kind of garment.
It is usually ambiguously plural. The indefinite article is usually "some". The plural of some shoes is pairs of shoes.
The specification of some shoes is "Shoes are formal outerwear worn on the feet."
Some shoes is usually outerwear.
The cloth decency of some shoes is usually formal.
The cover areas of some shoes is usually {feet area}.

Some boots is a kind of garment.
It is usually ambiguously plural. The indefinite article is usually "some". The plural of some boots is pairs of boots.
The specification of some boots is "Boots are formal outerwear like shoes, but are higher and cover both feet and legs. 
Note; take care to use boots with dresses, as they technically go on the outside of a long dress."
Some boots is usually outerwear.
The cloth decency of some boots is usually formal.
The cover areas of some boots is usually {feet area, leg area}.

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

Some gloves is a kind of garment.
It is usually ambiguously plural. The indefinite article is usually "some". The plural of some gloves is pairs of gloves.
The specification of some gloves is "Gloves are formal outerwear that go over the hands."
Some gloves is usually outerwear.
The cloth decency of some gloves is usually formal.
The cover areas of some gloves is usually {hand area}.

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

Book 5.2 - Discrete Arousal-based Consent and Stimulation

[Status: Complete
This books deals with integrating the discrete arousals into the stimulation and consent framework of the actions, to create a basis system that grants consent based on arousal. It's separated into it's own part in order to make it easier to excise it if needed, like if the author wants to use a numerical arousal system.
The underlying parts deals with responses of the actors, action integration and custom values for the templated body parts.]

[We create a use-mode for enabling DACS:]
Use DACS translates as (- Constant ENABLE_DACS; -). 

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

[Love interests should only be checked by the DACS rules.]
The love interest consent rule is listed after the default consent rule in the consent rules.
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

The dressing consent rule is listed after the default consent rule in the consent rules.
A consent rule (this is the dressing consent rule):
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

[We can skip abide by the love interest consent rule because only the actor will be wearing clothes]
A consent rule for an actor wearing something (this is the dressing default consent rule):
	Unless DACS option is active, make no decision;
	Abide by the dressing consent rule;

Section - Worn Garments

The worn garment consent rule is listed after the default consent rule in the consent rules.
A consent rule (this is the worn garment consent rule):
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

A consent rule for an actor taking off something (this is the undressing default consent rule):
	Unless DACS option is active, make no decision;
	Abide by the love interest consent rule;
	Abide by the worn garment consent rule;
A consent rule for an actor taking a garment (this is the taking off default consent rule):
	Unless DACS option is active, make no decision;
	Abide by the love interest consent rule;
	Abide by the worn garment consent rule;
A consent rule for an actor ripping a garment (this is the ripping default consent rule):
	Unless DACS option is active, make no decision;
	Abide by the love interest consent rule;
	Abide by the worn garment consent rule;
A consent rule for an actor shifting a garment (this is the shifting default consent rule):
	Unless DACS option is active, make no decision;
	Abide by the love interest consent rule;
	Abide by the worn garment consent rule;
A consent rule for an actor unshifting a garment (this is the unshifting default consent rule):
	Unless DACS option is active, make no decision;
	Abide by the love interest consent rule;
	Abide by the worn garment consent rule;

Chapter 5.2.2c - Soft-play

[This part deals with the "soft" touching actions, which share the same thresholds by default.]

[Soft-play threshold is the minimum arousal at which a person or it's body part will engage in the soft-play actions.]
A person has an arousal called the soft-play threshold. The soft-play threshold of a person is usually unaroused.
A body part has an arousal called the soft-play threshold. The soft-play threshold of a body part is usually slightly aroused.

[Active/passive soft-play arousal is the arousal attainable by soft-play actions, as the active and passive participant.]
A person has an arousal called the soft-play performer limit. The soft-play performer limit of a person is usually slightly aroused.
A person has an arousal called the soft-play recipient limit. The soft-play recipient limit of a person is usually slightly aroused.
A body part has an arousal called the soft-play performer limit. The soft-play performer limit of a body part is usually aroused.
A body part has an arousal called the soft-play recipient limit. The soft-play recipient limit of a body part is usually aroused.

[Create a default soft-playing consent rule]
The soft-playing consent rule is listed after the default consent rule in the consent rules.
A consent rule (this is the soft-playing consent rule):
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

A consent rule for an actor touching (this is the default touching consent rule):
	Unless DACS option is active, make no decision;
	Abide by the love interest consent rule;
	Abide by the soft-playing consent rule;
A consent rule for an actor rubbing (this is the default rubbing consent rule):
	Unless DACS option is active, make no decision;
	Abide by the love interest consent rule;
	Abide by the soft-playing consent rule;
A consent rule for an actor tickling (this is the default tickling consent rule):
	Unless DACS option is active, make no decision;
	Abide by the love interest consent rule;
	Abide by the soft-playing consent rule;
A consent rule for an actor kissing (this is the default kissing consent rule):
	Unless DACS option is active, make no decision;
	Abide by the love interest consent rule;
	Abide by the soft-playing consent rule;
A consent rule for an actor hugging (this is the default hugging consent rule):
	Unless DACS option is active, make no decision;
	Abide by the love interest consent rule;
	Abide by the soft-playing consent rule;
A consent rule for an actor dancing (this is the default dancing consent rule):
	Unless DACS option is active, make no decision;
	Abide by the love interest consent rule;
	Abide by the soft-playing consent rule;

[Create a default stimulation rule]
The soft-playing stimulation rule is listed after the default stimulation rule in the stimulation rules.
A stimulation rule (this is the soft-playing stimulation rule):
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

A stimulation rule for an actor touching (this is the default touching stimulation rule):
	Unless DACS option is active, make no decision;
	Abide by the soft-playing stimulation rule;
A stimulation rule for an actor rubbing (this is the default rubbing stimulation rule):
	Unless DACS option is active, make no decision;
	Abide by the soft-playing stimulation rule;
A stimulation rule for an actor tickling (this is the default tickling stimulation rule):
	Unless DACS option is active, make no decision;
	Abide by the soft-playing stimulation rule;
A stimulation rule for an actor kissing (this is the default kissing stimulation rule):
	Unless DACS option is active, make no decision;
	Abide by the soft-playing stimulation rule;
A stimulation rule for an actor hugging (this is the default hugging stimulation rule):
	Unless DACS option is active, make no decision;
	Abide by the soft-playing stimulation rule;
A stimulation rule for an actor dancing (this is the default dancing stimulation rule):
	Unless DACS option is active, make no decision;
	Abide by the soft-playing stimulation rule;

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
The rough-playing consent rule is listed after the default consent rule in the consent rules.
A consent rule (this is the rough-playing consent rule):
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

A consent rule for an actor spanking (this is the default spanking consent rule):
	Unless DACS option is active, make no decision;
	Abide by the love interest consent rule;
	Abide by the rough-playing consent rule;
A consent rule for an actor pinching (this is the default pinching consent rule):
	Unless DACS option is active, make no decision;
	Abide by the love interest consent rule;
	Abide by the rough-playing consent rule;
A consent rule for an actor biting (this is the default biting consent rule):
	Unless DACS option is active, make no decision;
	Abide by the love interest consent rule;
	Abide by the rough-playing consent rule;

[Create a default stimulation rule]
The rough-playing stimulation rule is listed after the default stimulation rule in the stimulation rules.
A stimulation rule (this is the rough-playing stimulation rule):
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

A stimulation rule for an actor spanking (this is the default spanking stimulation rule):
	Unless DACS option is active, make no decision;
	Abide by the rough-playing stimulation rule;
A stimulation rule for an actor pinching (this is the default pinching stimulation rule):
	Unless DACS option is active, make no decision;
	Abide by the rough-playing stimulation rule;
A stimulation rule for an actor biting (this is the default biting stimulation rule):
	Unless DACS option is active, make no decision;
	Abide by the rough-playing stimulation rule;

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
The oral-playing consent rule is listed after the default consent rule in the consent rules.
A consent rule (this is the oral-playing consent rule):
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

A consent rule for an actor licking (this is the default licking consent rule):
	Unless DACS option is active, make no decision;
	Abide by the love interest consent rule;
	Abide by the oral-playing consent rule;

[Create a default stimulation rule]
The oral-playing stimulation rule is listed after the default stimulation rule in the stimulation rules.
A stimulation rule (this is the oral-playing stimulation rule):
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

A stimulation rule for an actor licking (this is the default licking stimulation rule):
	Unless DACS option is active, make no decision;
	Abide by the oral-playing stimulation rule;

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
The fuck-playing consent rule is listed after the default consent rule in the consent rules.
A consent rule (this is the fuck-playing consent rule):
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

A consent rule for an actor fucking something with (this is the default fucking consent rule):
	Unless DACS option is active, make no decision;
	Abide by the love interest consent rule;
	Abide by the fuck-playing consent rule;

[Create a default stimulation rule:
Due to prior checks, we assume that the actor is enclosing one of the nouns, so we don't stimulate the actor directly.
We do need to make sure we don't stimulate a self-pleasuring actor twice.]
The fuck-playing stimulation rule is listed after the default stimulation rule in the stimulation rules.
A stimulation rule (this is the fuck-playing stimulation rule):
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

A stimulation rule for an actor fucking something with (this is the default fucking stimulation rule):
	Unless DACS option is active, make no decision;
	Abide by the fuck-playing stimulation rule;

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

The soft-play threshold of some breasts is usually aroused.
The soft-play performer limit of some breasts is usually very aroused.
The soft-play recipient limit of some breasts is usually very aroused.

[No Change: The rough-play threshold of some breasts is usually very aroused.]
[No Change: The rough-play performer limit of some breasts is usually very aroused.]
[No Change: The rough-play recipient limit of some breasts is usually very aroused.]

[No Change: The oral-play threshold of some breasts is usually aroused.]
[No Change: The oral-play performer limit of some breasts is usually very aroused.]
[No Change: The oral-play recipient limit of some breasts is usually very aroused.]

The fuck-play threshold of some breasts is usually aroused.
[No Change: The fuck-play performer limit of some breasts is usually very aroused.]
[No Change: The fuck-play recipient limit of some breasts is usually very aroused.]

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
	Include Erotic Storytelling by Fictitious Frode.

By including this extension, you will enable most of what's necessary to write erotic stories.
Most of the content is not automatically available out-of-the-box, but has to be specifically included by the author for the player to notice.
Only the expanded actions (listed in the action overview below) are available by default, but these don't do anything without proper targets such as the templated garments and body parts.
There is also an introductory warning/information screen at the start of the story in the form of the 'adult introduction' rule.
This rule will also inform the player about the contents that can be expected from the story if these are defined (Section 6.1 explains how this can be used).

The sections of this chapter introduces the various concepts available within the extension, and subsequent chapters will go into further detail.
Towards the end of the documentation you will find a fully fleshed out tutorial and sample adventure, and a complete technical reference.
All kinds and actions are also documented inside the Inform IDE.

Note; Inform can behave slightly odd regarding the naming (and creation) of things which are part of the character, this is described in chapter 4.15 of 'Writing with Inform'.
As long as the player is declared after the creation of the body part, then the body part will be named after what the character was named instead of 'your part'.
Any gender-specific creations might not occur if the gender of the player was undetermined at that point.
Likewise, changing the identity of the player during play might give unexpected results.

In short, declare the persons (i.e. characters), especially the player character, with gender before invoking body part creation.

Section 1.1 - Documentation Overview

As this is a large and complex, a proper overview of what can be found in the documentation is in order.

	Chapter 1: An overview of the included concepts, necessary reading for using the extension.
	Chapter 2: A deeper look at the actions available, and how to make them work.
	Chapter 3: In-depth explanation of how the layered clothing system works.
	Chapter 4: Guidelines on how to write better descriptions, using both the hooks in the extension and Inform's standard rules.
	Chapter 5: Techniques for writing better Non-Player Characters (NPCs) using the extension.
	Chapter 6: The various out-of-world functions, such as completion tracking, hint system and debugging.
	Chapter 7: A tutorial on how to write Erotic Stories in Inform.
	Chapter 8: A complete technical reference for everything added or changed with this extension.

The following examples are included:

	A: Templates: Factory Mould - Using the provided templates to flesh out actors.
	B: DACS - Not yet written.
	C: Agency: Intelligent Agency - Not yet written.
	D: Customization: A Furry Tale - How to create custom body parts.
	E: Scenes - Not yet written.

Section 1.2 - Responses and Descriptions

Reduced to its most basic components, an interactive fiction story (adult or not) can be seen as the printing of responses to the player's actions.
It follows that an extension should focus on making it easier for the story author to write these responses by taking care of the details such as checking if actions are valid.
This allows the author to focus on the creative work, like the plot, characters, and stylistic writing.

Inform offers several ways of altering responses for specific actions.
Inform's standard documentation 'Writing with Inform' has several examples on how to vary text, and chapter 12.2 ("How actions are processed") goes into some detail on how action responses are chosen.
What follows is a quick overview of how to best utilize this extension to generate responses and description:

After: As the name implies, these rules are processed after the action has taken place, in place of the default action report rules.
This is where most custom responses would go.
[Comment:
RalphWiggumPhD: A somewhat generic example could be useful here.
FictitiousFrode: Added an example.]

Before/Instead: As the name implies, these rules are processed before the action takes place.
The difference (also implied by the naming) is that "instead" rules will stop the action from taking place (unless explicitly told to allow it to continue), while "before" rules are the opposite.
"Instead" rules are great for writing custom "errors" to the player, while "before" rules are often used to flesh out some of the standard actions.

The differences between these three rulebooks can be illustrated by the following small example.
To truly appreciate the different results you should try to alter the type of each of the three rules.
If we were to use "instead" and not "after" for eating the apple, that rule would be processed regardless of whether the apple held by the player or the apple was even edible.

*:
	Garden is a room.
	An apple is an edible thing in Garden. "An apple is growing here."
	Instead of going down in Garden, say "You have nothing to dig with."
	Before taking the apple, say "You gently pick the apple."
	After eating the apple, end the story saying "You take a chunk of the apple, which lodges in your esophagus choking you to death."
	Test me with "down / eat apple"

Descriptions: Descriptions are a special form of response, issued by the "x/examine" action.
All things in Inform can have the description property, which is printed when the thing is examined.
Two of the new kinds in this extension, garments and body parts, also have some special description properties which are printed under certain circumstances, while persons get an entire rulebook dedicated to generating descriptions.
See the later chapter "Descriptions in Detail" for more on this.

Persuasion/Consent: Persuasion is a built-in rulebook, and is invoked when the player asks another person to do something.
This can be a common occurrence in AIFs, so it's important to include (or at least provide better rules to govern failed persuasion attempts).
Chapter 12.4 of 'Writing with Inform' covers the use of persuasion.
Consent is a new rulebook for this extension, and works in a similar way to make it possible for persons to object to the player's actions if they are directly involved.
To avoid having to write both consent and persuasion rules for the same action, persuasion for the actions included can be granted from the consent rules.
Note that it is also possible to take advantage of the bundled Discrete-Arousal-based Consent and Stimulation (DACS) system.
Both consent in general and DACS are covered in more detail in chapter 5.

Inform is quite smart about processing rulebooks, allowing you to write a mixture of general and specific rules.
Generally speaking, Inform will always pick the most specific rule to process when faced with a conflict.
In general, the more specific the parameters are, the higher priority the rule gets.
(E.g., a named person beats a generic person, and a templated body part beats the generic body part.)
Handily, if a scene is listed (with the "during" keyword), it is considered more specific than without.
This makes it very easy to give different responses for the same action but at different times (scenes) in the story.
For reference, the exact rules used to sort rulebooks are described in 19.16 of 'Writing with Inform'.

Section 1.3 - Action Overview

The extension provides or modifies a few actions, listed in the table below.
These are detailed both in the IDE, and covered in Chapter 2 of this documentation.
[Comment:
RalphWiggumPhD: I wish there were a better way to format this table...
FictitiousFrode: Tables are auto-formated when viewed inside Inform.]

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

There are also some actions for support functions, described in chapter 6.

Section 1.4 - Layering and Templates

A common feature to promote realism in AIFs is clothing which can be examined and removed one piece at a time.
The most common technical implementation of this in libraries is called layered clothing.
In order to facilitate layered clothing, this extension uses "cover areas" to link people, body parts, and garments. 
The technical specifics of this are covered in chapter 3, but the extension provides templates for garments and body parts which cover most normal situations.
Example A shows a simple setup with templated body parts and garments.
One notable difference between garments and body parts relates to knowledge and visiblitity.
Garments that are not visible are considered to be concealed and un-interactive for the player, while body parts are always known regardless of visibility and can thus be refered to by the player.
For example, a player may not know whether a person is wearing a bra, but the player does know that that person has breasts.

While you're free to create your own body parts as you please, this extension comes with a variety of ready-made template parts you can use.
Below is an overview of the body part templates, with the most pertinent properties controlling which actions are possible (see section 2.1) and the default decency (as implied by their cover locations):

	Abdomen (Immodest): touchable, rubbable, lickable, tickleable
	Ass (Indecent): touchable, rubbable, spankable, pinchable, lickable, orificial.
	Ankles (Immodest): plural; 
	Arms (Casual): plural; touchable, rubbable
	Backside (Immodest): rubbable, spankable
	Breasts (Indecent): plural; touchable, rubbable, lickable, biteable, tickleable, pinchable
	Chest (Indecent): touchable, rubbable, lickable, biteable, tickleable
	Eyes (Formal): plural
	Face (Formal): 
	Feet (Immodest): plural; touchable, rubbable, lickable, biteable, tickleable
	Hair (Formal): plural (ambigously)
	Hands (Formal): plural; touchable, rubbable
	Head (Formal): 
	Legs (Casual): plural; touchable, rubbable
	Mouth (Formal):
	Neck (Casual): lickable, biteable
	Penis (Indecent): touchable, rubbable, pinchable, lickable, biteable, penetrating.
	Shoulders (Casual): plural; rubbable
	Thighs (Immodest): plural; touchable, rubbable
	Vagina (Indecent): touchable, rubbable, lickable, orificial.
	Waist (Immodest): 
	Wrists (Casual): plural;
	
[Comment:
FictitiousFrode: The following clarification isn't needed, as orificial and penetrating are properties detailed in 2.1, just like the others.
Rewrote the table introduction instead.
Note that "orificial" is a term referring to that body part's use in certain actions.]

Similar to body parts, garments can also be created from the base kind, but the extension has most normal clothing available for use.
Below is an overview of the properties for the default garments; note that all of this can be customized for specific garments.
There is also more information available in the kind listing in the IDE.

	Bodysuit (Indecent Underwear): Covers shoulder area, arm area, upper torso area, upper back area, lower torso area, lower back area, crotch area, thigh area, leg area and feet area (Or, everything except hands, head and face).
	Bra (Indecent Underwear): Covers upper torso/back; allow touching through.
	Mask (Immodest Underwear): Covers face and head.
	Panties (Indecent Underwear): Covers crotch, but can be moved or ripped to reveal crotch; allow touching through; plural.
	Swimsuit (Immodest Underwear): Covers upper/lower torso, lower back/crotch, but can be moved aside to reveal upper torso area; allow touching through.
	Undershirt (Immodest Underwear): Covers upper/lower torso/back, but can be ripped to reveal upper torso; allow touching through.
	
	Glasses (Formal Normalwear): Covers the face; plural.
	Pantyhose (Formal Normalwear): Covers feet, leg, thigh and crotch, but can be ripped to expose crotch; allow touching through; plural.
	Shirt (Casual Normalwear): Covers upper/lower torso/back, arm and shoulder, but can be unbuttoned or ripped to reveal shoulder and upper/lower torso.
	Socks (Formal Normalwear): Covers feet; allow touching through; plural.
	Stockings (Formal Normalwear): Covers feet, leg and thigh, but can be ripped to expose thigh; allow touching through; plural.
	
	Dress (Casual Overwear): Covers upper/lower torso/back, shoulder, crotch, thigh and leg, but can be unbuttoned to reveal the shoulder and upper/lower torso (without altering full access).
	Minidress (Immodest Overwear): Covers upper/lower torso/back, shoulder, crotch, and thigh, but can be pulled up to reveal crotch and thigh.
	Shorts (Casual Overwear): Covers thigh and crotch, but can be unzipped to reveal crotch; plural.
	Skirt (Casual Overwear): Covers thigh and crotch, but can be lifted up to reveal both.
	Suit (Casual Overwear): Combination of trousers and jacket, it covers upper/lower torso/back, shoulder, arm, crotch, thigh and leg. Can be unzipped to reveal crotch.
	Sweater (Casual Overwear): Covers upper/lower torso/back, shoulder and arm. Can be raised up to reveal the upper/lower torso.
	Trousers (Casual Overwear): Covers leg, thigh and crotch, but can be unzipped to reveal crotch; plural.

	Boots (Formal Outerwear): Covers feet and leg; plural.
	Coat (Formal Outerwear): Covers upper/lower torso/back, arm, shoulder, crotch and thigh. Can be unbuttoned to reveal upper/lower torso, crotch, thigh and shoulder.
	Gloves (Formal Outerwear): Covers hand; plural.
	Hat (Formal Outerwear): Covers head.
	Jacket (Formal Outerwear): Covers upper/lower torso/back, arm, shoulder. Can be unbuttoned to reveal upper/lower torso.
	Shoes (Formal Outerwear): Covers feet; plural.

Additionally, there are outfits, a special kind of garment designed to be an alternative to individual garment pieces.
Outfits cover almost all the body areas of a person, except hands and head/face.

Section 1.5 - Discrete Arousal-based Consent and Stimulation

Ever since the early days of AIF there has been a need to limit which actions an NPC is willing to let the player do, and two patterns quickly emerged.
ADRIFT games usually had a puzzle to solve to 'unlock the girl', after which all possible actions were fair game.
TADS, with it's more traditional programming language, allowed more complex solutions.
Ever since Moist(*) used 'excitement' with thresholds to control the flow of sex scenes, arousal-like mechanics have been a staple of TADS games.
The downside of using arousal thresholds is that sex scenes quickly turn into guess-which-action-works (**), and then repeating that action until you think a new action has been unlocked. 

Regardless of our feelings over arousal-based systems, there needs to be a mechanism in place to control which actions are permissible.
To accomplish this in Inform, this extension has settled on using 'Consent' as a new rulebook which works in a similar way to the existing rules for persuasion (which governs what happens when the player asks an NPC to do something).
This approach allows authors to write aribitrarily complex control mechanisms.

Not every author is technically inclined to write such a system though, so we also provide an optional system to grant consent based on the current arousal of the involved parties.
This is a similar approach to how the TADS libraries work.
First we have to decide how we want arousal represented; in traditional TADS, arousal was always represented as finite numbers with thresholds.
This extension has opted to use Inform's support for enumerated values to provide a discrete set of arousals.
This has several benefits; the code is easier to read, and fewer discrete values makes it easier to model both for the author and the player exploring it.
Second, such a system isn't much use if the current arousal of a person is fixed, or left to the author to update manually for each action.
This led to the stimulation rules, which together with some default consent rules form the Discrete Arousal-based Consent and Stimulation-system (DACS for short).
In order to avoid unplanned sex-scenes, DACS must be manually enabled:

	1: Include the phrase "Use DACS." in your story setup.
	2: Update the "love interest" list property of the involved persons to include each other; this can be done dynamically during play.

Example B shows a simple DACS setup with some customizations, and the system is explained in more detail in section 5.4.

(*): I believe Moist was the first game to implement arousal, but feel free to correct me if you know of an earlier example than 1996.

(**): See 'Anatomy of a Sex Scene', by ExLibris. http://overanalysingaif.blogspot.com/2010/12/anatomy-of-sex-scene.html

Section 1.6 - Character Agency

A recurring difficulty in person-oriented IF is how to make people seem lifelike.
This problem manifests in several ways, from the simple task of writing 'idle'-messages when the actor is not doing anything, to actors who roam around the map either randomly or in a goal-oriented manner.
The standard approach to this in Inform is to write 'every turn' rules, which work very well for goal-oriented actors.
The problem arises when you have actors who are active only under certain conditions and otherwise can be idle.
Speaking as a player, it is also very frustrating to have a randomly loitering NPC wander away from you in the middle of an interaction.

"Agency" is a term from philosophy which relates to an actor's capacity to act in any given environment, and is a fitting name for both our problem and our solution.
We can infer that a NPC has three different modes of agency, idle, planned , and urgent, each of which requires different handling:
At the most basic stage, a NPC without a goal might want to print a randomized text message ('idle') to show that they aren't just static scenery.
For NPCs with a goal, we want to distinguish between planned agency and urgent agency, with the difference being that 'normal' planned agency will be delayed by player interactions while urgent agency should be executed regardless of player interaction.
To facilitate this, the extension introduces a new stage in the turn sequence rules, called the agency stage, where we consult the urgent, planned and idle agency rules for agency-enabled persons.

The later chapter on NPCs covers this topic in detail, and Example C shows some sample interactive actors.

Section 1.7 - Version History

2016-12-23: Beta-1 (Release 1)

	Remake of the old AIF framework, reworking the previous extensions body parts, garments, outfits, erotic story actions and consent into one.
	* Layered clothing system is completed, with templates for garments and body parts.
	* Erotic Actions are completed, but might contain some bugs still.
	* DACS is functional but untested.
	* Some out-of-world actions are not yet implemented.

Release 2 (In Development)

	* Midriff renamed to abdomen
	* Bug fixes on mini dress and clothing layer (courtesy of allisonedwards via GitHub)
	* Updated documentation

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
	RalphWiggumPhD; for proofreading and commentary on parts of the documentation.
	AnotherWannabe; whose AIF Library is a worthy alternative to this extension, with different priorities.
	ABomire and Dudeman; whose early work on AIF in I7 inspired me to start this journey.

A hearty round of applause to anyone who has contributed criticism, feedback, discussion, bug reports and the like during the development.

Chapter 2 - Player Actions

For most players, the most visible part of the extension is the erotic actions.
Understanding of how these actions work is therefore necessary in order to meet their expectations.
Section 1.3 gave a brief overview of the actions, grouped into three broad categories:
Those targeting either persons or body parts, and those that are clothing-related.
Each of these three categories will be explored below, after an introduction to the limiting factors that apply to varying degrees to all of them.

Section 2.1 - Limiting Factors

It's unrealistic (and rather boring) to expect that every erotic action would succeed in every occasion.
The actions go through a similar set of checks (with some exceptions) to verify that the action is feasible:

	Ensure that the body part isn't part of the actor, with some exceptions: touching/rubbing/spanking/dancing. Fucking is also a special case.
	Applied to the correct kind of noun (person/body part); some action tries to redirect to a noun of the correct type.
	Action support for the noun, defined through the adjectives listed below.
	Curent clothing state of of the relevant person allows access to the noun.
	Decency threshold of the current location allows the action to take place.
	Consent for the action is granted.

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
	Pinchable: Ass, Breasts, Chest, Feet, Abdomen, Neck, Penis, Vagina
	Rubbable: Arms, Ass, Backside, Breasts, Chest, Feet, Hands, Legs, Abdomen, Penis, Shoulders, Thighs, Vagina
	Spankable: Ass, Backside
	Tickleable: Breasts, Chest, Feet, Abdomen
	Touchable: Arms, Ass, Breasts, Chest, Feet, Hands, Legs, Abdomen, Penis, Thighs, Vagina

To control what behavior is proper in a given location we introduce Decency as a new kind of value, which is explained in more detail in section 3.2.
By default decency has the four possible values indecent, immodest, casual and formal, as well as the undefined decency to serve as an unset/null-value.
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
If no consent rules are written (and the DACS system is not enabled) the default consent rule will deny consent and state the uninterested response for the person.
The optional Discrete Arousal-based Consent and Stimulation system (DACS), described in Section 5.4, can be used in lieu of writing your own consent rules.

As mentioned earlier, the actions are split into those who expects a person as the noun, and those that expect a body part.
The other checks are written to not assume that this check has been performed, in order for them to be reworked to allow more targets.
For instance, clothing coverage checks are only applied for body parts and garments, as those are the only two kinds for which clothing coverage rules apply.
This should make it possible to rework these limitations, but if you do choose to so take good care that the results are what you would expect.

Section 2.2 - Clothing-related

To provide layered clothing with garments we need to modify some existing actions and define some that didn't exist before.
All of these actions also require the consent of the (potential) wearer of the garment.
The standard actions dealing with wearing and taking off clothing obviously needed to be updated, but wWe also want to allow undressing by other parties than the wearer which necessitates some alterations to the standard taking action.
These actions (along with the new actions) are covered in this section, while chapter 3 will describe howthe system for layered clothing coverage works in more detail.

When wearing a garment, we check that the current clothing coverage state allows the garment to be put on.
To allow garments to only fit a defined subset of people, we also check that the clothing size of the garment matches the wearer.
By default all people and garments have the same clothing size, so this check only interferes when the author has altered the standard values.

For removing garments, we check that current clothing coverage state allows sufficient access to take off the garment, and that the decency revealed by taking it off doesn't conflict with the location's decency threshold.
In order to allow the taking action to remove worn garments from others, we had to make a small exception in the can't take people's possessions rule, to not block worn garments.
Lastly, a person taking off garments usually keeps them afterwards, but this behavior can be changed to dropping the clothes by stating that they are 'not keep clothes after undress'.

There is also two helper actions for wholesale changing of clothes.
Stripping is as the name implies the act of taking off every worn garment, in the correct order.
There are no special checks done for stripping, instead relying on each garment being taken off in turn.
Similarly, dressing makes the person try to put on the garments listed in their preferred clothing property.
Note that these actions are intended for players; in order to support changing clothes "behind the scenes" you can use the 'force dress' and 'force strip' methods.
These force methods will ignore all rules to make sure that the person is wearing either nothing or the specificed list of garments.

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
Note that the breasts template does not have the orificial keyword by default, which will stop titfucking from taking place.
The titfucking command is provided regardless as an option for authors, and provide proper error messages for players.
It is then up to the story author to define which pairs of breasts should be orificial to allow the action to take place.

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
By using cover area to link body parts with garments and defining a depth/clothing level for garments, it's possible to calculate coverage based on what is worn without costly everyone-to-everything relations.
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
Depending on the status of the garment, this list can be modified by either the shifting revealed cover areas or ripping revealed cover areas, and the MODIFIED COVER AREAS OF (garment) phrase selects the correct list of cover areas based on the garment's status.
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

Access to garments and body parts is a very important part of a layered clothing system, and this extension divides this access into three general levels: vision, touching and accessible (manipulation).
This section will focus on the differences between them and how to use them while writing your story.
The exact phrases to use for determining access are described in section 8.9 - Phrases for Deciding on Values, and should be mostly self-explanatory.
For simplicity sake we'll refer to something as 'covered' if the related person is wearing atleast one garment whose modified cover areas match the compared items' and the clothling level is higher on the worn item.

The visibility checks require that atleast one cover area is not covered by any garments that are opaque.
Transparent garments will allow visibility even through multiple layers of garments.
Touching is similarly calculated if atleast one cover area is not covered by any garments that are not allow touching through.
Accesibility however is used for 'major' actions such as taking off garments and sexual contact with body parts, and therefore it requires that all the cover areas are not covered and touching through is not considered.

Visibility is further enhanced by the 'decency' value which we briefly introduced in section 2.1 on limiting factors for actions.
Each person has a property called 'current decency' which stores the calculated value of which decency their current clothing level represents.
While it's possible to manually set this property, this is not recommended as it will be re-calculated on all actions that change clothing.
Similarly if you change clothing manually it's important to re-calculate this value using the 'UPDATE DECENCY FOR person' phrasing.
This calculation uses cover areas instead of body parts as the foundation in order to ensure uniform results regardless of which body parts are un-implemented for a person.
Section 1.4 contains an overview of the default decency of the included body part templates.

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

	Panties: crotch
	Pantyhose: crotch
	Shirt: shoulder, upper/lower torso
	Stockings: thigh
	Undershirt: upper torso

The following templates are shiftable in a given way and will reveal:

	Coat (Unbutton): shoulder, upper/lower torso, crotch, thigh
	Dress (Unbutton): shoulder, upper/lower torso
	Jacket (Unbutton): upper/lower torso
	Minidress (Raise): crotch, thigh
	Panties (Move): crotch
	Shirt (Unbutton): shoulder, upper/lower torso
	Shorts (Unzip): Crotch
	Skirt (Raise): crotch, thigh
	Suit (Unzip): crotch
	Sweater (Raise): upper/lower torso
	Swimsuit (move): upper torso
	Trousers (Unzip): Crotch

Section 3.4 - Customization

If a story has a need that's not covered by the templates, it's easy to create new garments, body parts or even cover areas.
This customization is shown in example D, which includes creating a custom cover area, body part and garment to add support for tails.

Body parts and garments are the easiest to customize, and you have the option of adapting one of the templates or using the base kind as a reference.
For one-off items you can just create a new thing of the base kind, but most times it's best to create a new template kind.
Once the thing or template is defined, the real work lies in setting the needed properties on it.
The most important of these is the relevant cover areas, stored in cover locations for body parts and cover areas for garments.
Garments also should have decency and a clothing level, which requires some work to fit in with other garments.
As mentioned in the previous section garments can also be manipulated, governed by the rippable and shiftable (with shiftability) properties.
For a custom body parts to be involved in a sexual action it needs one or more of the limiting properties, as defined in section 2.1.
The complete set of properties available for these kinds are listed in chapter 8.

It's slightly more complex to create new cover areas.
These are defined in the Table of Coverage containing the columns Cover Area and Uncovered Decency (decency), where cover area is the name of the new value and decency is the decency of any visibile body parts in that area.
Creating a new cover area doesn't do much on it's own though, and it has to be added to the body areas property of the relevant persons.
This can be done by either adding it to the list when play begins (or dynamically during play), or typing out the entire set of cover areas for a person.

Chapter 4 - Descriptions in Detail

While it's possible to use multimedia resources in interactive fiction, the main medium is still the written word.
Inform 7 has a good built-in support for varying textual descriptions, with several chapters of 'Writing with Inform' devoted to variations.
The depiction of persons in traditional interactive fiction is usually more focused on conversation than clothing and body parts.
This extension tries to make it easier to write good descriptions of persons, their parts and clothing based on their current state.

Several of the examples include descriptions, but example D shows this very effectively despite focusing on customization.

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
Lastly we give a snapshot of the person's agency state, stored in the agency state description.

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
Ther are literally chapters in 'Writing with Inform' devoted to this, so instead this section will focus on tips, tricks and recreating TADS library features.

One common feature in good AIF is action responses that vary when the action is repeated.
Inform 7 supports this functionality natively through the 'for the Xth time' or 'for x turns' clauses to response rules.
Both take into account repeating actions, but 'times' is the total number of times, while 'turns' is the number of times/turns in a row.
Creating text responses that vary are also very simple, using the 'one of' text substitutions described in chapter 5.7 of 'Writing with Inform'.
The following short example highlights some of the these tricks:

*:
	A Boring Room is a room.
	After waiting, say "[first time]This will only be printed the first time. [only]You [one of]wait[or]linger[or]sulk[or]skulk[then at random]."
	After waiting the second time, say "This is getting boring."
	After waiting for four turns, say "You sneeze. Whoops."
	After waiting for more than six times, say "Get on with it!"
	Test me with "z / z / z / z / z / z / z"

One feature of Inform that often gets overlooked is scenes, which allow you to tightly group together the narrative and it's consequences.
One immediate application in AIF is controling the sex scenes, which when implemented as scenes allows for easily defining the start and end conditions.
You can then bind the action responses as well as any consent and persuasion rules to only apply during that scene.
The real benefit comes when a person is involved in several sex scenes; by tying responses to the individual scenes you can be certain to avoid printing responses for the wrong scene.

The story author is entirely free to decide how and when orgasms occur.
One optional feature of the extension is a mechanism to check for orgasms that make each successive orgasm harder to achieve.
The algorithm used is the attempt number of of the given orgasm divided by the orgasm number.
This makes the first orgasm 'free' (a 1 in 1 chance), while the second orgasm has a 1 in 2 chance (and then a 2 in 2 chance if the first attempt failed), and so on.
The phrase to use to invoke this check is 'person ORGASMS', and the example below shows how this can be implemented.
When writing responses for actions with multiple actors to check for simultaneous orgams it's important to remember that each successive call will update the underlying variables.

*:
	After rubbing a vagina enclosed by a person (called owner):
		If the owner orgasms: [This runs the calculation, including updates.]
			Say "The orgamic response for the action should go here.";
		Else:
			Say "The normal response for the action should go here.";
	
	After fucking a a vagina enclosed by a person (called recipient) with a penis enclosed by a person (called penetrator):
		Let recipient-orgasm be false;
		Let penetrator-orgasm be false;
		If recipient orgasms, let recipient-orgasm be true;
		If penetrator orgasms, let penetrator-orgasm be true;
		If recipient-orgasm is true and penetrator-orgasm is true:
			Say "The response for simultaneous orgasm should go here.";
		Else if recipient-orgasm is true:
			Say "The response for when recipient orgasms should go here.";
		Else if penetrator-orgasm is true:
			Say "The response for when penetrator orgasms should go here.";
		Else:
			Say "The normal response for the action should go here.";

Chapter 5 - Improving Non-Player Characters

Let's be blunt: Non-Player Characters are hard to get right in Interactive Fiction.
The common approach (as described at SibylMoon *) is to limit the player's interaction with NPCs to as little as you can get away with. 
Unfortunately that approach doesn't work well for AIF where NPCs can be said to be the main goal of the experience.
Instead we have to be more careful in the design of our NPCs to make them appear more advanced than they really are.
SibylMoon (**) list four qualities that increase the illusion of intelligent NPCs: Active, reactive, goal-oriented and randomized.

All NPCs need not be given the same attention however, it is OK to use the aforementioned methods to avoid interactions for characters that are not the main focus.
It's also important to take the tone of the story into account, simplistic NPCs can be forgiven (and perhaps are even expected) in a romp-style story where the player's goal is to rack up as many notches as possible.
For characters that deserve more attention, I offer the following qualities to strive for:

	1: Purpose - Give the character a reason for existing beyond being the player's plaything, which should be reflected in the latter suggestions.
	2: Goal-Seeking - The character should actively seek out their goal, even if it's just cleaning up and re-dressing after the scene.
	3: Choices - Not every character should be 'attainable' in every playthrough, the player's action should lead to meaningful choices.
	4: Memorable - Let every character have something that the player distinguish and remember them by.

These points flow into each other somewhat, but each still encompasses a core truth about the player's experience for a character.
More than anything else the player's experience is what should be guiding the design, and as stated above the player's expectations vary widely by genre.
The solution for these suggestions lies more in story design than technicalities, but the extension tries to be accomodating where possible.
A character's purpose is embodied through their persuasion and consent rules while the agency rules handles their active goal-seeking.
The description system (detailed in chapter 4) tries to highlight the memorable physical features of each person, while the chosen conversation system can be used to create meaningful choices.

Some final thoughts on memorable characters: 
If one takes too drastic measures to make every character stand out as memorable, the net effect is usually that all the characters drown each other out.
Instead one should focus on the player's experience, which is more focused on some way of telling the characters apart from each other.
My personal preference is to avoid names that start on the same letter or otherwise sound similar, unless it's for the effect of making two characters linked.
Don't be afraid to assign labels to your characters that the player can use as a reference, just try to avoid sterotyping too much.

(*) http://www.sibylmoon.com/writing-graceful-parser-npcs/

(**) http://www.sibylmoon.com/realistic-parser-npcs/

Section 5.1 - Consent and Persusasion

Asking other characters to perform actions is well supported by Inform 7, and any writer of AIF should be well acquainted with Chapter 12 of 'Writing with Inform' that deal with Advanced Actions.
While chapters 12.3 to 12.5 cover persuasion in detail, a quick recap is called for.
Whenever the player asks another character to do something in the form of MARY, KISS ME, Inform consults the persuasion rules to see if the action should be attempted.
The author is then free to devise arbitrarily complex rules for determining if the actor should attempt the given action.

The approach works well for when the actor is the main participant in an action, but it doesn't really handle interactions with multiple parties.
Taking kissing as an example, what is really the difference between MARY, KISS ME and KISS MARY?
The first would be governed by the persuasion rules but the second would succeed unless the author intervened with an instead rule.
To make it easier for the author to control when a character consents to being a part of such actions the consent rules are processed in a similar fashion as the persuasion rules.
When asking a person to perform an action that's governed by the consent rules, both rulebooks will be consulted.
If you want to avoid having to write both types of rules, the extension has an option for granting persuasion to all actions that are also governed by the consent rules:

*:
	Use consensual persuasion.

Another option is to use the included Discrete-Arousal-based Consent and Stimulation (DACS) system to grant consent based on the current arousal of the character.
Using DACS to handle consent is explained in more detail in section 5.4.

All of the actions in this extension goes through the consent rulebook, including the single actor actions such as wearing and taking off garments.
Writing consent rules are done in a similar way as for persuasion, but instead of the outcomes 'persuasion succeeds' or 'persuasion fails' we have 'give consent' and 'deny consent'.
The default outcome of a rule is to deny consent, but it's also possible to 'make no decision' to give control back to the rulebook for further processing.
If no consent rules are written and the DACS system is not enabled, the default consent rule will deny consent and state the uninterested response for the person.
When writing consent and persuasion rules it's very important to include the actor in the description of the action; if it's omitted then inform assumes that the player is the actor.
Other values are 'someone' which means 'someone other than the player', and 'an actor' which means 'any actor'.
The example below partly illustrates this.

We previously mentioned (in Section 4.4 - Responses) that the scene function of Inform should be to control sex scenes.
It's also possible to split one sex scene into several scenes, to allow consent for various new actions as the sex scene progresses.
We can then use the 'during' clause when writing rules to tie them to that scene, which allows for the consent rule itself to be very broad.
Below is a minimal example that illustrates how consent can be tied to a scene.
Note that any attempts to ask Beatrice to do something will not work as we haven't defined any persuasion or consent rules for this.

*:
	Include Erotic Storytelling by Fictitious Frode.
	Use consensual persuasion.

	Bedroom is a room. The decency threshold of Bedroom is indecent.
	Adam is a man in Bedroom. The player is Adam.
	Beatrice is a woman in Bedroom.
	A penis is a part of every man.
	A vagina is a part of every woman.

	Beatrice's Encounter is a scene. Beatrice's Encounter begins when the player is in Bedroom for the fifth turn. [* This is to account for a bug in 6M62 that makes the scene trigger a turn early]
	When Beatrice's Encounter begins, say "'Oh, all right then, let's get this over with,' Beatrice sighs."

	Consent rule for doing something to Beatrice during Beatrice's Encounter: Give consent.
	Consent rule for doing something to something enclosed by Beatrice during Beatrice's Encounter: Give consent.
	Consent rule for someone doing something to Adam during Beatrice's Encounter: Give consent.
	Consent rule for someone doing something to something enclosed by Adam during Beatrice's Encounter: Give consent.
	Consent rule for an actor fucking something enclosed by Beatrice with something during Beatrice's Encounter: Give consent.
	
	Test me with "kiss Beatrice / lick Beatrice / fuck Beatrice / z / kiss Beatrice / lick Beatrice / fuck Beatrice / Beatrice, rub cock".

Section 5.2 - Character Agency

One of the most important ways to distinguish characters is to give them the agency to act on their own.
While characters in traditional AIF is mainly stationary, it's easy to use Inform's every turn rules to make them act on their own.
The mechanisms for providing agency in this extension is based on the every turn rules with some extra scaffolding to make it easier to control interactions between multiple actors and the player.
Agency is implemented as a new stage in the turn sequence rules, similar to how the player's action and the every turn rules are processed.
We divide an actors agency into three categories that must be treated differently, each of which get their own rulebook that the agency stage rule will process as appropriate.

Each person get some new properties to help control agency which the author can use.
Most important of these is the 'agency-enabled' (neg: agency-disabled) property, which switches agency processing on for a given person.
By implementing this as a property we make it easy for the author to dynamically switch on/off the agency for a person as needed.
Some execution efficiency is gained by not processing agency rules for people that don't have any.
To allow the author to control the order in which agency is performed we can use the 'priority' property, with people with a higher number being processed first.
In order to communicate back to the player what a person is doing we can use the 'agency state description' which is printed when the player examines a person, but one should also update the initial appearance of the person.

Of special importance is the 'occupied' (neg: unoccupied) flag which indicates if a person has been involved in activity this turn and is used to decide which agency rules are applicable for that person.
This flag is automatically set (by using the before rules) when the player the player orders a person around or interacts with a person, their body parts or their garments.
The author is free (and encouraged) to set this flag manually when an agency rule (or action response) implicates that another person is also involved in the action taking place.
This should make it easier to write sex-scenes with several actors, where the unoccupied actors can seek out actions with each other.
Lastly, the turn sequence processing will clear the flag after the every turn stage, making it available for use in the very turn rules.

To account for varying degrees of urgency in a character's agency, we define three levels that are processed differently but all have the same outcomes:
The default outcome is 'agency performed' which stops processing with success, while 'agency postponed' can be used to decide on no outcome to allow other rules to be consulted and 'agency cancelled' will stop the processing of a given rulebook in failure.

'Urgent agency' is for agency that's time-sensitive and shouldn't be interrupted by the player's interactions.
These rules therefore ignore the occupied flag and are processed regardless, and if the rule succeeded the person is flagged as occupied.
'Planned agency' should be the main rules implementing a character's active behavior.
Similar to urgent agency, the person is flagged as occupied if the rule succeeded.
'Idleness' on the other hand is mainly for saying messages that indicate what the person is doing rather than performing actions.
These rules are therefore only processed if the player can see that person when they are still unoccupied.

Example D shows how agency can be implemented, and the tutorial contains a section on how multiple sex partners may be implemented.

Section 5.3 - Conversations

Conversations are usually an important part of character-driven IF, but it's also one of the hardest parts to get right.
As the player is free to converse about anything that strikes their fancy, a good conversation system must both understand what topic the player is referring to and have a proper response for it.
Inform 7 provides various extensions, available in the built-in extension library, to handle conversation.
Regardless of how the author choose to approach conversations, great care and thought should go into the implementation.
Inform's included 'Recipe Book' covers the topic of conversation in quite detail, starting from chapter 7.6.

Most of the time we also need to keep track of which topics are available, depending on many factors such the knowledge of both the player and the characters.
This extension doesn't lock the author to a particular conversation model, instead providing the separate Simple Conversations extension as an option.
The aim of Simple Conversations is to provide a model that is simple to use for both player and author, while still retaining robustness and flexibility.
For further details see the documentation of the extension itself.

Section 5.4 - Discrete Arousal-based Consent and Stimulation

*:
	Include Erotic Storytelling by Fictitious Frode.

	Bedroom is a room. The decency threshold of Bedroom is indecent.
	Adam is a man in Bedroom. The player is Adam.
	Beatrice is a woman in Bedroom.
	A penis is a part of every man.
	A vagina is a part of every woman.

	Beatrice's Encounter is a scene. Beatrice's Encounter begins when the player is in Bedroom for the fifth turn. [* This is to account for a bug in 6M62 that makes the scene trigger a turn early]
	When Beatrice's Encounter begins:
		Say "'Oh, all right then, let's get this over with,' Beatrice sighs."
		Add Adam to the love interests of Beatrice.
	
	Test me with "kiss Beatrice / lick Beatrice / fuck Beatrice / z / kiss Beatrice / lick Beatrice / fuck Beatrice".
[TODO: Add more actions do move up the arousal levels]

Section 5.5 - Optional Posture Integration

Another method for adding immersion and detail to your story is to allow for various postures.
The bundled extension Postures provides some of the most common postures along with basic functionality for changing and checking for postures.

In order for postures to be a positive addition to your story it's necessary to integrate them with the relevant actions and descriptions.
Body part descriptions can be tailored to hide or highlight details depending on posture, while the description generation rules can be used to highlight the current posture.

*:
	A status description generation rule for a person (called P) (this is the posture status rule):
		If P is enclosed by a supporter (called location):
			Say "[P] [are] [describe posturing of current posture of P] on [location].";
		Else if P is enclosed by a container (called location):
			Say "[P] [are] [describe posturing of current posture of P] in [location].";
		Else:
			Say "[P] [are] [describe posturing of current posture of P] nearby.";

AS each story might have it's own very different requirements on how postures should affect the actions in this extension, no attempt is made to make rules that cover all eventualities.
Instead you can use the sample code below to tailor posture limitations to your own story.

	Before doing something to a body part (called part):
		If part is enclosed by a person (called part-owner) and part-owner is enclosed by something (called owner-location):
			Let blocked be false;
			If part-owner is posturing prone or part:
				If part is an abdomen or part is some breasts or part is a chest or part is a penis or part is a vagina, now blocked is true;
			If part-owner is posturing supine or part-owner is posturing sitting:
				If part is a backside or part is an ass, now blocked is true;
			If blocked is true:
				Say "[We] [cannot] do that to [part] when [owner-location] is in the way."
				Stop the action;

Chapter 6 - Support Functions

[TODO: Introduction to support functions]

Section 6.1 - Story Content

It would be rather boring if every adult story contained the same elements, as not every player has the same appreciation for the various types of content.
In order to alert players to the type of content they can expect from a story, this extension allows the author to specify the 'content types' included.
The 'adult introduction rule' is processed before the story starts to warn the player, and all the content types that are defined for the story are listed.
If any of these content types are optiontal, the player is then given a choice of enabling them.

Taking advantage of this options is as easy as defining content types; none are provided by default allowing the author free reign.
Their behavior is controlled by the two properties enabled/disabled and mandatory/optional; the default behavior is that they are enabled and mandatory but a disabled content defaults to being optional.
It's possible to set a content type to disabled and mandatory, which in effect hides it from the player.
Content types also have a description which is printed when the player chooses which optional content types to experience.
Below is a short example of how content types can be used:

*:
	Include Erotic Storytelling by Fictitious Frode.
	
	Male Heterosexuality is a content type.
	Female Heterosexuality is a content type.
	Voyeurism is a disabled content type.
	
	Security Office is a room. "This state-of-the-art Security Office contains row upon row of monitors for the security cameras which are deployed to protect the hotel's guests."
	
	Some security monitors is backdrop in Security Office.
	The description is "You scan over the familiar images of people going about their business in the privacy of their hotel rooms[if Voyeurism is enabled], catching a glimpse of a couple engaged in some early-afternoon sex[else]."

	test me with "x monitors".

Chapter 7 - Expanded Tutorial

A complete tutorial on using Inform 7 to write AIF games is a rather ambitious project.
There are several good tutorials available for writing in I7, and the bundled 'Writing with Inform' documentation is a good starting point.
However the only tutorials that deal with both AIF and I7 have become rather aged and don't take full advantage of recent advances.
It's also good form for an extension such as this to showcase how it might be used in practice.
But first, some pointers to other readings on I7 that are worthwhile:

Ron Newcomb has a guide at http://www.plover.net/~pscion/inform7.html that explains I7 from a tradional programmer's perspective.
It's still the best summary of classic programming techniques in I7 despite being based on a rather outdated version of I7.

Jim Aikin has a handbook available at http://www.musicwords.net/if/i7hb.htm which is an alternative to Writing with Inform.
It tackles the same topics in a different fashion and order, and it's aimed at students.
It's not yet updataded for the very last version of I7 but it should be current enough for most purposes.

Inside Erin was a magazine dedicated to AIF, and in it's time contained several articles on the topic of writing AIF.
The Inside Erin newsletter at http://newsletter.aifcommunity.org/index.php?id=writing.html contains a topical overview of these articles.
It's highly suggested to read through the generic articles; the I7 tutorials are outdated on the technical topics but are still worth reading.

Brass Lantern has several articles available http://www.brasslantern.org/writers/ which deal with both general IF-theory, game design and some Inform tutorials.

Finally, this tutorial is also available at https://informedaif.wordpress.com/tutorial/ for access outside Inform.

Section 7.1 - Getting Started

The first part of writing a new story is coming up with something to write about.
Inspirations for stories come from multiple sources; you might have an idea of an intriguing character to explore, or a physical location or setting to (literally) explore.

A good source of inspiration for settings is writing fan-fiction stories for established fandom.
There is a well established precedent for this, the AIF community has a long and proud history of fan-fiction, evolving out of a newsgroup devoted to adult Star Trek fan-fiction.
This approach has some advantages in that the player is hopefully familiar with both the setting and characters, but it's easy to break immersion if the characters are not portrayed correctly.
An established setting also gives some directions for which puzzles and events that might be encountered.

Perhaps the most important thing to note here is that over-ambition is the real project-killer: 
Don't start with a concept you can't finish.
For your first story you should try to keep it small, especially in the amount of characters the player should be allowed to interact with.
A good guideline is the rules for the mini-comp which limits the story to one interactive character and a maximum of three locations.

Another large project killer is scope-creep; during writing one often finds inspiration for other concepts that can fit in.
It's often better write down these ideas in a separate document, it might be better to let these grow into their own story or incorporate into another story.
Similarly an idea that doesn't work out as a story on it's own might still be usable in another story.
It' best to initially focus on descriptions of people and locations rather than implementations of mechanics, as these can be re-used in other settings and engines more easily.
It's good to get into the habit of spending a little time each day just writing short descriptions that you find relevant to the story.
Two or three sentences are enough for most responses, more text might actually be a hindrance for the player.
Save the long steamy descriptions for what's important in your story, which for the most part will be the sex scenes.

So far in this tutorial we haven't actually touched on anything directly related to Inform.
Perhaps the most striking (and talked about) feature of Inform is the choice of using natural language as a programming language.
This has led to claims that Inform is not 'programmer friendly' because it isn't object-oriented, but is instead being based on predicate logic.
While it's true that I7 isn't a classic object-oriented language, it still retains many of the features such as strong typing, properties and inheritance.
Perhaps the biggest difference is that instead of methods we have rulebooks and phrases which are more static in design.
In practice though this works rather well, as the pragma is built around modelling and manipulating a world state which is the premise of interactive fiction.
The end result is code that is extremely readable and to a certain degree self documenting, leading to greater maintainability and understanding.

We'll come back to the more technical aspects of Inform later on, but next up is a look at actually writing some code in Inform.

Section 7.2 - Geography

Upon starting Inform for the first time, you're prompted to create your first project by entering a title and author for your story as well as a place to store it.
The title and author is used to create the title line of your new story, which is one half of Inform's absolute minimum for a story.
Every story needs somewhere to take place and a player to experience it, Inform is happy to supply you with a default player but you need to define atleast one room.
Thankfully, due to Inform's natural language syntax this is as simple as writing a declaration that something is a room, such as stating that 'Library is a room.'
Unless informed otherwise, Inform assumes that the first room created is the starting location for the story.
While this will compile (try copying the text over to your story, and press F5 to run), it makes for perhaps the most boring story ever written.
The only description present is the title of the room, and while Inform has a built-in understanding of quite a few verbs, they won't do anything interesting.

Before we start making the world more interesting, it's time to introduce some of the basic properties in Inform.
We've actually already seen two of them in action despite only writing the single statement 'Library is a room.' 
This statement creates the object name which we use to refer to the object in the source code, and is also used as the default value of the 'printed name' property which is printed to the player.
By default Inform allows the author to use abbreviated object names, but can be forced to only accept fully qualified names through the 'Use unabbreviated object names' phrase.
Going one step further, the object's name is also what the parser tries to match the player's input to.
This can be altered in two ways; either by using the 'understand' phrase to assign synonyms for the player or by declaring the object to be privately-named to prevent the player from referring to it by object name.
This latter purpose is an advanced effect mostly for objects that have complicated names that would otherwise confuse Inform.

There are two other properties which are similar but different, and are very important: Description and initial appearance.
Initial appearance is how the item is presented to the player during the story, and for a room this is actually the description.
Similarly to declaring objects properties values are set by statements that simply state what they are, like 'The initial appearance of Library is "Seemingly endless rows of bookshelves fill the room."'
Writing the initial appearance of a room is such a common occurrence that Inform has a special syntax for it:
Text enclosed in double-quotes just after the object declaration is interpreted as the initial appearance property.

Writing good descriptions for the locations in a story is not an easy task, even trying to define what is a good description is tricky as not every location has the same requirements.
A lot can be written about descriptions, and Stephen Granade has written an excellent article on the subject. (*)
Long descriptions aren't necessarily better than short, it's usually better to focus on what you intend the story to tell the player and how to draw attention to the correct objects.
It's also important to keep a consistent level of detail, or atleast only deviate from the default level with a conscious decision.
Another issue to consider is that while Library's appearance implies the existence of bookshelves, the player can't interact with them in any way because they aren't defined in any way.
Defining new things is once again as simple as stating where they are, anything that isn't given a kind is implied to be a thing.
With this in mind we can create a slightly more interesting library (Click the icon to copy the text below into your story):

*:
	Library is a room. "Seemingly endless rows of bookshelves fill the room."
	Some bookshelves are in Library.

Testing this short story will show that we can indeed interact with the bookshelves, but there are two problems:
Firstly, the bookshelves are also listed both in the room's appearance and independently afterwards.
Although we refered to the bookshelves in the appearance, we did so in a way that was only humanly readable, and Inform lists any unmentioned objects that are present in the room separately.
In order to let Inform know that the object has been mentioned, we can use what's called text substitution:
By making Inform print the name of the object that object will be flagged as mentioned so there's no need for a second mention.
Text substitutions are made by writing the substitution inside square brackets inside the text string, and writing the object name will substitute in the printed name.
I find it a good practice to write in these substitutions while writing the initial appearance of the room as a reminder to create the mentioned objects.

The second problem is less immediately apparent, as all things are by default portable, the player can pick up the bookshelves.
This is easily remedied by setting the already mentioned 'portable' property and it's opposite 'fixed in place', but there is another solution.
For things that are intended to decorate a room, we have the aptly named 'scenery' which defaults to being fixed in place.
More importantly though, a scenery is usually omitted from the listing of unmentioned things in a room and thus is an alternative solution to the duplicate mentions we discussed above.
If we need a scenery to be in multiple places at once (such as the sky or the ground, or the vision of something far away) we can use backdrop instead of scenery.

For all of what we've written so far we still only have the one room, albeit with some scenery.
Unsurprisingly we can add new rooms in relation to existing rooms by stating where they are in relation, and because only rooms can be related to each other by directions we don't even have to state that they are room.
By default Inform is aware of the eight cardinal directions, as well as up/down and inside/outside.
Inform also assumes that directions are two-way, and automatically creates the reverse for you unless told otherwise.
It's possible to create twisting, secret or one-way passages as well, but this is an advanced topic we're leaving for another time.

Settling on the correct amount of locations for a story is a hard challenge.
When mapping out a 'known' location such as a house, there are certain locations the player would expect to find but that serve no real purpose.
Another challenge is 'connection' rooms whose main purpose is to link together the more interesting locations.
By clever use of room descriptions and the 'before' and 'instead' rulebooks it's possible to give the player the impression of a larger world than what is implemented.

*:
	Include Erotic Storytelling by Fictitious Frode.
	
	Living Room is a room.
	"At the heart of your house is your living room, with its large flatscreen TV and soft couch. Refreshments can be had in the kitchen to the north, and a small hallway leads east towards the bedroom. A small bathroom lies to the west, and the front door is to the south."
	
	Before going east in Living Room, say "You pass through the hallway and enter your bedroom."
	Instead of going west in Living Room, say "You don't have a pressing need to go visit the bathroom."
	
	The front door is a closed door. It is south of Living Room.
	Instead of opening front door, say "You'd rather stay home tonight."
	
	Kitchen is north of Living Room.
	"Your kitchen is small but functional, containing cupboards, an oven and a stocked fridge. As you consume most of your meals in the living room to the south, you've never seen the need for a kitchen table."
	
	Bedroom is east of Living Room. The decency threshold is indecent.
	"This is where you sleep, and the mess in the room makes it hard to do anything else in here."
	Before going west in Bedroom, say "You pass through the hall on your way back to the living room."
	
	The player is wearing an outfit called your clothes.

This example illustrates another small complication introduced by this extension, as it contains the notion of decency.
In order to stop the player from running around in an inappropriate state of dress, each room has a decency threshold which defaults to 'casual' but the naked player is 'indecent'.
This can make testing the game a small annoyance at first, but one that can be easily remedied by giving the player an outfit to wear.

(*) http://www.brasslantern.org/writers/iftheory/descriptions.html

Section 7.3 - Technicalities

Your regular programming will resume shortly, but first a short interlude on some of the technicalities and peculiarities of Inform 7.
Inform's IDE has some handy shortcuts (on Windows atleast): F5 will compile and launch your story, while F9 will compile and replay the last game: Excellent for debugging.
F7 on the other hand will just compile and rebuild the built-in index tab which is a great resource while developing.
It's a good habit to compile often as it can be daunting to debug larger code changes even if the compiler is good at pointing out what went wrong.

As we've seen earlier, source code in Inform is written in natural language, but that doesn't mean it actually understands English.
Just like any other programming language Inform has a rather strict syntax to follow, it's just that Inform's syntax is easy to read.
Anything Inform should recognize as text should be written inside double-quotes, and single quotes inside a text is converted to double-quotes when bordering whitespace.
Anything written inside square brackets in a text is considered to be substitutions, while square brackets elsewhere is considered to be comments.

Unlike many other programming languages (such as TADS, other C-like derivations, and even Inform 6), Inform 7 is limited to only one source file.
In lieu of dividing the source into several files, I7 uses five 'header' types for organizing your code into modules.
In decreasing order of magnitude, these headers are Volume - Book - Part - Chapter - Section, or in a easy-to-remember mnemonic: Very Bad People Choose Satan.
Exactly how to divide your code with these headings is largely up to each author, but a template project setup based on my personal preferences is included herein.
My personal preference is to use 'chapter' as the main holder of sourcecode, divided into sections as needed and using 'volume/book/part' for hierarchical organization.

Structuring the source code with these headers has three main effects, the first of which should be pretty obvious.
By building a hierarchy of headings it's easy to place related content near each other, using the interface's overview to jump around.
The second effect is less obvious, and related to a feature we briefly covered before:  the 'Use unabbreviated object names' phrase.
When this use option is not enabled we're allowed to refer to objects in our source by abbreviated names, such as referencing the 'kitchen table' by just 'table'.
If an abbreviated name could be taken to refer to multiple objects (for instance a 'coffee table' as well), Inform uses the hierarchy of headings to select the closest match.
My personal preference is using unabbreviated object names, which avoids mishaps when re-arranging code.
Lastly, Inform also uses these header to tell you where a compile error was detected.

To help debugging your story Inform supplies a variety of testing commands as well as the option of easily creating test cases and special actions that are removed from the final release.
The default testing actions included in Inform is:

	ACTIONS on/off: Toggles the printing of exactly which actions are processed, as well as printing the name of any failed rules without swamping the output.
	RULES on/off: Toggles the printing of all rules being consulted for a very detailed and verbose feedback only recommended for ferreting out tricky bugs.
	SHOWME object: Lists out all of the properties for the given object as they appear at the current runtime state.
	PURLOIN object: Moves the object from anywhere in the world model into the player's inventory.
	GONEAR object: Moved the player as close as possible to the given object anywhere in the world model.
	SCOPE: Lists out all of the objects that are currently in scope for the player to interact with.
	RELATIONS: Lists out all the various kinds of relations that are in use in the game.
	SHOW RELATION relationship: Lists out the details of a specific relations, as detailed in 13.7 of 'Writing with Inform'.

This extension also provides a 'debug examine' action (shortened to 'DEX') to provide detailed information on the kinds most relevant to AIF: garments, body parts and persons.
It's also possible to write both test cases and special commands only available during testing, which can be used to artificially set story progression variables.
Test cases can be written by the phrase 'TEST testname WITH "actions / separated / by / slashes".', allowing you to write 'TEST testname' during play to execute the given actions in order.
To create commands only available for testing you can mark one of the source headers as 'Not For Release', which is described in chapter 2.9 of 'Writing with Inform'.

It's very important to take the time to explore your world and experience it as a player would.
One of the harder parts to test is when connections between room differs from the room description.
To help test this you could use the included extension 'Directionality' which auto-generates a description of the available exits in a room.

Before moving on to some more programming in Inform, I would recommend exploring various tabs in the IDE, especially 'Index' which gives a helpful overview of your story world.

Section 7.4 - Assorted Things

In the previous discussion on geography we briefly talked about the items that populate a story world.
It's possible to broadly divide these in two main categories: things that exist to describe the story world and things that exist as part of puzzles for the player to solve.
Hopefully the distinction between these categories should not always be apparent for the player, who would use 'ordinary world' items to solve the challenges presented by the story.
While it's easy to determine how many puzzle items to include (answer: whatever you feel is necessary), it's much harder to settle on a correct amount of 'normal world' items.
We briefly covered this when speaking about rooms, but it's important enough to bear repeating.
My personal preference is that every item that's notable enough to get mentioned in the room description should have a corresponding item.
The detail level in that item's description should be tailored to how important and relevant it is; it's even ok to have a bland 'That's not very important' description for items that are obvious fluff.

Another consideration is the players behavior: It's hard to anticipate all the crazy stuff your players will try, which is why feedback from testers is very important.
At the bare minimum you should consider that most players will pick up anything that isn't nailed down, and some will actively try to pry out the nails.
In other words, make sure that you either account for the player moving stuff around or ensure there is a reason why they can't move it.
Adult stories have some extra considerations here, namely clothing and body parts.
Most of the intricacies here are handled by using this extension, and a later chapter dealing with actors will go into more detail on how to implement them.
For now you should focus mainly on which body parts and garments you want included and how to describe them.

The rest of this tutorial installment goes into rather deep technical detail for Inform 7.
Most of the subjects brought up here will make more sense later on, but it's still important to be introduced to them in order to recognize the concepts later on.
Not every thing in a story should be treated the same, and the primary form of differentiation is 'kinds' which closely resemble classes of other languages.
Besides rooms, the most important kind in Inform is 'thing', and most everything you use will be a kind of thing (with the notable expection of rooms and directions).
Inform has a concept of the following default kinds:

	persons - including the player
	containers - can contain other things inside
	supporters - can support other things on top
	devices - has a state that can be switched on/off
	doors - room connector that can impede travel
	backdrop - distant things that shouldn't be interacted with

These kinds have various properties assigned to them to suit their purpose.
Not all properties are available for all kinds though, the 'openable' and 'open/closed' properties for instance are only available for containers and doors (by default).
The following is a short overview of the most important properties and what they apply to, focusing on the properties available in standard Inform7.
For a full overview of properties you should look at the 'kinds' part of the Index tab.

	Edible: Defined for all things and governs if the thing can be eaten, implemented by the 'eat' action (removing it from play).
	Portable/fixed in place: Defined for all things and governs if the player can carry the thing in question, as implemented by the 'take' action. Defaults to portable except for doors, scenery, supports and people.
	Scenery: Defined for all things to mark that which the player is not likely to interact directly with.
	Wearable: Defined for all things and governs if the thing can be worn, as implemented by the 'wear' and 'take off' actions.
	Transparent/Opaque: Defined for containers and governs whether the contents of the container is visible even when closed. Also used by this extension to govern if a garment blocks vision to underlying garments.
	Enterable: Defined for containers and supporters and governs whether a person can use the 'enter' action to be inside of them.
	Openable: Defined for doors and containers and governs whether the item is a valid target for the 'open' and 'close' actions. Doors default to openable while contains do not, unless it defined as open.
	Open/closed: A state variable related to 'openable'.
	Lockable: Defined for doors and containers and governs whether the item is a valid target for the 'lock' and 'unlock with' actions. Defaults to lockable if the item is locked.
	Locked/unlocked: A state variable related top 'lockable'. 
	Matching Key: A reference to the item which acts as a key and can be used to unlock.

One feature of many object oriented languages is the ability to inherit properties from from multiple parents, where this ancestry would be a kind of property onto itself.
Instead of allowing multiple inheritance, Inform treats properties which share the name to be the same property regardless of the kind it is defined for.
This can be confusing for a programmer who is used to having a thing inherit the 'openable' interface to flag it for the correct actions and inherit the open/closed state.
In the natural language style it's more intuitive to state that a thing is open and then infer that it must also be able to be opened.
Actions in Inform (such as 'opening' and 'locking') makes use of properties, with the effect that they work on any thing which provides the correct properties (such as doors and containers).

Inform uses references between compontents called 'relation' to build and maintain its world model, which a story author will mainly used for defining or checking where something is.
Chapter 13 of 'Writing with Inform' is devoted to relations, and for the most part the names makes them easy to understand, but section 13.3 has a good overview of the most commonly used.
A person can 'have' a thing, which is actually they union of the two relations 'carry' and 'wear'.
With containers and supporters things can also be in 'in' or 'on' something else, with 'contained by' as the combined relation that covers both.
We can also have assemblies where something is 'part of' something else (in which case it is 'enclosed by' that part), of which body parts is the most pertinent example at hand.
Inform will assume that you're speaking about the player if you give no reference to which person, so the condition 'if the hat is worn' actually reads 'if the hat is worn by the player'.

Section 7.5 - Storycrafting

This tutorial has so far been mostly focused on the technical aspects of how to implement a story in Inform through locations with inventory.
This will continue in the next installment which will deal with how Inform uses rules to implement logic programming.
First we'll take a look at how to get started with writing the actual story.
There are some questions you should ask yourself when starting out:

	What is your setting, and what mood and level of detail fits?
	How should the player's interest and focus be maintained during the story?
	How should I start writing the story?

Let's start with the last question first, as it's perhaps the easiest to understand and it lays the foundation for your workflow.
Every author has their own workflow so you need to find what works for you, but there are some general approaches.
Implementation is the process of converting your ideas into code, and Emily Short has written a good article (*) covering some strategies for implementing interactive fiction.
I recommend you take the time to read the article, as although this text is inspired by it we're not going to cover it in detail.

(*) Available at https://emshort.blog/2009/08/23/idea-to-implementation/

The most basic strategy (which Emily calls 'Implement first! Design later!') is just to start at the beginning, implementing the ideas as they come to you.
This can be a great process for learning how to work with your tools, but as a storycrafting workflow it has some issues.
Maintaining forward momentum in the story is hard without a properly defined flow to the story, and it's easy to get lost in all the alternative story branches you can see.
The easy fix is to decide on the ending and start working backwards, but it can still be challenging to make it back to the start.
Another issue that's common to both all linear workflows regardless of direction is that the first parts written usually have greater descriptive detail but less mechanical detail, while the opposite is true for the latter stages.
This is a result of your skills improving with experience, leading to more satisfying mechanics.
At the same time your focus shifts to 'what else can I add' to 'getting it done'.
It's therefore important to return to the early parts later on to ensure some consistency in details across the story.

At the other end is writing out the entire transcript for your story; what should the player type to progress and what are the responses?
The major benefit of this approach is that you always have a clear idea of what the player *should* be doing to progress at any stage, but it's easy to overlook what the player *could* be doing.
The downside is that you're basically writing the entire story before you know what mechanics you're capable of implementing.

In practice your process would probably lie somewhere in between these two extremes, but some form of planning is essential.
Personally I prefer to start by writing the walkthrough for the game, InvisiClues-style (**).
This helps me focus on the player's experience; what are the obstacles to overcome and how should the solution be hinted at, while still leaving room for misdirects and optional sub-plots.
It also naturally breaks down the story into manageable chunks and puts some distance between your intentions and the implementing mechanics.
This last point is important as you're not wasting energy writing descriptions for actions you're unable to implement or change your mind about.

(**) A form of walkthrough focused on giving hints instead of a step-by-step solution.
See http://www.ifarchive.org/indexes/if-archiveXinfocomXhintsXinvisiclues.html for some examples.

If you've come this far into the tutorial you most likely have some ideas about the story you want to write.
Before starting implementation it's important to know what you want to achieve and what's fitting for the story.
This could be either specific characters (real or fictional) or entire settings (fan-fiction or your own), or even more abstract concepts you want to explore.

The mood of the story is one of the easier considerations which has far reaching consequences.
A realistic story has to employ different techniques and effects to appear serious than a comedic story which can afford to be more loose.
Regardless of the mood it's still important for the logic to stay consistent within the context of the story.
Related to this is finding the correct level of detail for your story.
There are no simple and correct answers to what is correct, both in regards to rooms and contents.

Lastly we'll try to answer the important but difficult question of how to maintain the player's interest.
Unfortunately there is no single answer as every player is different, but it's still very important to keep the player's motivation in mind.
While some freeform exploration can be interesting, the player should always have an idea of what they are trying to achieve as well as what's keeping that from happening.
Searching for the solution to puzzles can be frustrating enough without first having to find out what the puzzle is.
A good approach is to consider both what is a good puzzle with a solution that makes sense in the context of the story, as well as how the player should be clued in to discovering the solution.

Chapter 8 - Technical Reference

Contained in this chapter is a technical description of all the new and altered mechanics for the extension, divided by type.
It's intended as a companion to the other chapters, although an experienced author could glean much of the previous information from this chapter alone.

Some parts of the extension are manually toggled by the 'use' phrase:

	Use consensual persuasion: Grants persusasion for all actions that are also covered by consent rules.
	Use DACS: Enable the built-in Discrete Arousal-based Consent and Stimulation system.

Section 8.1 - New Kinds of Value

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

Section 8.2 - New Kind: Body Part

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

Section 8.3 - New Kind: Garment

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

Section 8.4 - New Properties for Existing Kinds

Besides defining new Kinds and Kinds of Value, the extension also adds some properties to existing Kinds: Room and Person.

Rooms get a minimal change:

	Decency Threshold (Defaults to casual): Defines the decency that is allowed in the room, taking into account both the clothing of a person and certain actions (See global Variables below).

Persons get more changes, see also decency above.

	Agency-enabled (Defaults to agency-disabled): Used by the agency rules to enable or disable the rules for a person.
	Agency State Description: Used by the agency and description generation rules to convey the current state of the person, if defined.
	Body Areas (List of cover areas): The cover areas that a person incorporates. See Cover Area above.
	Clothing Size (Defaults to 0): Defines what garments a person can wear, see the same property on garments.
	Current Arousal (Defaults to unaroused): The current discrete arousal level of the person. See Arousal above.
	Current Decency: A stored value (calculated by UPDATE DECENCY FOR) that indicates the decency of visible garments and body parts for a person.
	Keep Clothes after Undress (default): Decides if the person shold keep or drop clothes when undressing.
	Love Interests (List of persons): The list of people that they are willing to engage in erotic actions with, used by the DACS templates.
	Occupied (Defaults and resets to Unoccupied): Used by the agency rules to stop a person from more than one agency action per turn.
	Orgasm Reset Arousal (Default to aroused): The discrete arousal level the person is reset to after the ORGASMS phrases succeeds.
	Orgasms: The number of times the person has orgasmed, as defined by the number of times the ORGASMS phrase has succeeded. Used to calculate the success rate for ORGASMS.
	Orgasmic Attemps: The number of times the ORGASMS phrase has been called since the last orgasm. Used to calculate the success rate for ORGASMS.
	Priority: Used by the agency rules to determine the acting order.
	Unaroused Response: Issued by the DACS templates when the person is not interested in the action, due to the current arousal of the person not being high enough. Defaults to "'Not yet,' [printed name] says softly."
	Uninterested Response: Issued by the the consent rules when the default consent rule denies consent. Also used by the DACS templates and issued when the person is not interested in the action, either due to unattainable arousal threshold or lack of love interest. Defaults to "'That's not going to happen,' [printed name] says cooly."

Persons also have quite a few arousals for use with DACS; How these work are described in more detail earlier in the arousal section, but the default values are listed here:

	Clothing threshold: Slightly Aroused.
	Soft-play:
		Threshold: Unaroused.
		Performer Limit: Slightly Aroused.
		Recipient Limit: Slightly Aroused.
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

Section 8.5 - Global Variables

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

Section 8.6 - Adjectives

The extension provides some adjectives for the story author to take advantage of:

	A (person) is TOPLESS: If the upper torso cover area of the person is visible. 
	A (person) is BOTTOMLESS: If the crotch cover area of the person is visible.
	A (person) is NEARLY NUDE: If the person is both topless and bottomless. Other body parts can be covered, however.
	A (person) is NUDE: If the person is not wearing any garments. Other wearable things can be worn, however.

The extension itself never uses these.

Section 8.7 - Phrases for Saying

These phrases are provided to simplify using the properties of shiftyness, which are mainly used as say-able values.

	DESCRIBE SHIFTING OF (shiftyness): Describe how the shiftyness is applied, as defined by the describe shifting entry in the Table of Shift.
	DESCRIBE UNSHIFTING OF (shiftyness): Describe how the shiftyness is reversed, as defined by the describe unshifting entry in the Table of Shift.
	DESCRIBE SHIFTED OF (shiftyness): Describe the shifted appearance, as defined by the describe shifted entry in the Table of Shift.
	DESCRIBE UNSHIFTED OF (shiftyness): Describe the un-shifted appearance, as defined by the describe unshifted entry in the Table of Shift.

Section 8.8 - Phrases for Updating Values

The extension contains some phrases which are used to update the world model.
The phrases for forcing clothing are most applicable to a story author, and are intended to simplify set-changing.
They bypass all action checks on wearing garments, and will allow for a person to wear incompatible clothing that can cause problems later on.

	UPDATE PRONOUN FOR (garment): Sets the pronoun property for a garment, which allows the player to refer to garments by using "my/his/her/their".
	UPDATE DECENCY FOR (person): Sets the current decency for a person, based on visible garments and cover areas.
	FORCE STRIP (person): Forcibly removes all worn items from a person, bypassing all restrictions. Use with caution!
	FORCE DRESS (person) in (list of garments): Forcibly replaces the currently worn items of a person with the list of garments, bypassing all restrictions. Use with caution!

Section 8.9 - Phrases for Deciding on Values

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

Example: ** Factory Mould - Using the provided templates to flesh out actors.

When experiencing an adult story most players expect to be able to refer to clothing and individual body parts, and enabling this experience is one of the key features of this extension.
A set of templates for common body parts and garments are provided to avoid authors having to re-implement these in every game.
The templates are ready for use with relevant properties (such as action keywords) defined.
Inform has two main methods for using these templates, and this example will detail how both methods work and when to use them.

In order to properly apply the creation rules, it's imperative to create the actors of the story early on with all relevant information.
We also create a property to differentiate between major and minor players in the story so we can treat them differently.

	*: "Factory Mould"

	Include Erotic Storytelling by Fictitious Frode.
	Use unabbreviated object names.
	
	A person can be major or minor. A person is usually major.
	Adam is a man. The player is Adam.
	Bob is a minor man.
	Carrie is a woman.
	Denise is a minor woman.

Every story also needs to take place somewhere.

	Factory Floor is a room. "The factory floor is bustling with machines."
	Bob is in Factory Floor. "Bob is bustling to and fro, carrying boxes."

	Office is up from Factory Floor.
	Denise is in Office. "Denise is at her desk."
	
	Operator Booth is inside from Office. "The Operator Booth contains the control machinery for the factory floor it overlooks. It's boxed in, providing some privacy."
	The decency threshold of Operator Booth is indecent.
	Carrie is in Operator Booth. "Carrie is here, operating the factory machinery."

While it's possible to create body parts individually, most people will have the same features based on their traits.
We can then use these traits to selectively create body parts: every man should have the same parts, which is slightly different from the parts a woman should have.
As we don't implement all the templates, we can add some synonyms (through the 'understand' phrase) to cover their absence.

	A head is a part of every person. Understand "face", "mouth", "eye/eyes" and "hair" as head.
	Some legs is a part of every person. Understand "feet" and "thighs" as legs.
	Some hands is a part of every person. Understand "arms" as hands.
	An ass is a part of every person.

	A vagina is a part of every woman.
	Some breasts is a part of every woman.

	A penis is a part of every man.

These parts are now available for the player to examine, but for now they don't have any descriptions.
When we use the "part of every" construct the parts will be named after the person they are attached to, except the player's parts which are called yours.

	The description of your head is "As one would expect, your head has the usual fixtures: two eyes and ears, a mouth and tussled black hair."
	The description of your legs is "Good to have for walking."
	The description of your hands is "Strong and firm from lifting heavy crates."
	The description of your ass is "Nice and taut."
	The covered description of your penis is "You're packing some junk in your trousers."
	The uncovered description of your penis is "Isn't it nice?"
	
	The description of Carrie's head is "Carrie has long blonde hair, lucious red lips and deep blue eyes."
	The description of Carrie's legs is "Her legs are long and slim."
	The description of Carrie's hands is "As a machine operator, her delicate hands are unsullied by hard labor."
	The description of Carrie's ass is "Her backside is nice and firm."
	The covered description of Carrie's breasts is "Her breasts might be small, but they do fill out her clothes nicely."
	The uncovered description of Carrie's breasts is "Carrie's showing off her maginificent breasts."
	The covered description of Carrie's vagina is "You can only dream of what it looks like."
	The uncovered description of Carrie's vagina is "Her vagina is nice and smooth."

It's also possible to use a person's traits to create mass descriptions for unimportant parts:

	Definition: A body part is nondescript if it is part of a minor person.
	Instead of doing something to a nondescript body part, say "That's not important to the story."

While we created body parts en masse, clothing is something that one would usually create piece by piece.

	Some sandals is shoes worn by Carrie.
	A grey dress is a dress worn by Carrie.
	A lacy red bra is a bra worn by Carrie.
	A lacy red thong is some panties worn by Carrie. It is singular-named.

	Some heavy boots is shoes worn by Adam.
	Some black pants is trousers worn by Adam.
	A white blouse is a shirt worn by Adam.

To avoid spending too much time detailing the clothing of minor characters we let them wear an outfit.
This can then be customized with description and synonyms.

	An oily grey cover-all is an outfit worn by Bob.
	The description is "Bob is wearing a grey cover-all, stained with oil and other unnameable substances."

	A navy blue pantsuit is an outfit worn by Denise.
	The description of Denise's outfit is "Denise is wearing a [printed name]."

We allow Carrie to take off clothes to iillustrate how this works in practice.

	Persuasion for asking carrie to try taking off something: Persuasion succeeds. [TODO: Remove this when we get consent based persuasion to work]
	Consent for Carrie taking off something:
		Say "Carrie dutifully obeys.";
		Give consent;

	Test me with "x bob / x cover-all / up / x Denise / x pantsuit / in / x Carrie / x dress / x bra / Carrie, take of dress / x Carrie".

Example: ** DACS

Defining rules for consent is a very important part of writing a successful AIF story.
For authors that don't have the interest in writing their own rules, the Discrete Arousal-based Consent and Stimulation System can be used to provide consent based on the current stimulation of the related actors.
This examples shows how this can be set up as well as tailored to fit specific needs.

Example: *** A-maze-ing Temple - Showcasing character agency and path-finding

The agency rules are an easy but powerful tool to make characters act on their own.
For this example we'll show how a native guide can help the player navigate a not-too-difficult maze.
First we have to set the stage.

	*: "A-maze-ing Temple"

	Include Erotic Storytelling by Fictitious Frode.
	Include Simple Conversations by Fictitious Frode.
	Use unabbreviated object names.
	
	When play begins, say "After a long trek alongside your trusty native guide, you finally hack through the final vines to arrive at an opening in the dense jungle."

	Jungle Clearing is a room. "The dense jungle opens up in a circular clearing, centered around a [small mound]. You can make out an entrance in the mound leading inside and down."
	A small mound is a door. It is inside from Jungle Clearing.
	Instead of going down in Jungle Clearing, try going down.

	Harry is a man in Jungle Clearing. The player is Harry.
	Your adventuring clothes is an outfit worn by Harry. 
	The description is "These is your trusty khaki adventuring outfit; tan trousers and long-sleeved shirt with heavy boots."
	
	A native guide is a woman in Jungle Clearing.
	An skimpy attire is an outfit worn by native guide. The description is "Her clothing offers considerably less protection than yours, consisting of sandals, a short skirt and a loose-fitting blouse."
	A flaming torch is carried by the native guide. It is lit.

With the stage set we can focus on the guide's agency, which we'll make planned instead of urgent so the doesn't guide run away in the middle of an interaction.
In order to make it more adaptable we store the guide's target destination as a variable instead of hard-coding it.

	The native guide has a room called target location.

	Planned agency for native guide:
		If native guide can see Harry:
			Let the way be the best route from the location of native guide to the target location of native guide, using doors;
			If the way is a direction:
				If the player can see native guide, say "'Follow me mister Harry!'";
				Try the native guide going the way;
		Else:
			If target location of native guide is not the location of native guide:
				Let the way be the best route from the location of native guide to Harry, using doors;
				If the way is a direction:
					Try the native guide going the way;
					If the native guide can see the player, say "'There you are mister Harry! I thought I'd lost you.";

We also need a small maze to be guided through, and to make things interesting we randomize the location of the treasure chamber.

	Entrance Chamber is inside from small mound. "This small chamber lies just inside the [small mound]. A beam of light comes through the opening to the south, illuminating a corridor leading north."
	Instead of going south in Entrance Chamber, try going outside.
	Instead of going up in Entrance Chamber, try going outside.
	
	Dark Intersection is north of Entrance Chamber. It is dark. "The underground corridor from the entrance to the south splits into two branches going east and west."

	Treasure Chamber is a room. "Sadly this chamber doesn't live up to it's name. Broken caskets and chests lie scattered around the room."
	Every turn, if Harry is in Treasure Chamber, end the story finally saying "It might not have contained the treasures you were looking for, but you did find a nice girl."
	
	Endless Pit is a room. "Just as you feel the corridor walls around you open up, the floor before you also give way to nothingness."
	Every turn, if Harry is in Endless Pit, end the story saying "You stumble over the edge, hurtling down through the darkness before making a messy spot at the bottom."
	
	When play begins:
		If a random chance of 1 in 2 succeeds:
			Change east exit of Dark Intersection to Endless Pit;
			Change west exit of Dark Intersection to Treasure Chamber;
		Else:
			Change west exit of Dark Intersection to Endless Pit;
			Change east exit of Dark Intersection to Treasure Chamber;

Even though the agency code is in place, our guide won't do anything before she's agency-enabled.
While it's possible to have this enabled from the start, it's often best to have it triggered by the player's actions.
For our purpose, asking the guide about treasure seems like a reasonable trigger.

	Some treasure is a subject. Understand "gold", "gems" and "secrets" as treasure.
	The dialogue of the native guide is the Table of Guide's Dialogue.
	
	Table of Guide's Dialogue
	subject (a thing)	availability (a truth state)	cue (a text)	turn stamp (a number)	dialogue (some text)
	treasure	true	"treasure"	--	"'Yes mister Harry, I know where the treasure is hidden. Follow me and try to keep up!'"
	
	After talking to native guide about treasure for the first time:
		Now the target location of native guide is Treasure Chamber;
		Now the native guide is agency-enabled;

	Test me with "talk to guide about treasure / z / enter mound / n".

Example: *** A Furry Tale - How to create custom body parts.

The provided templates covers the need of most stories, but it's impossible to cover every eventuality.
This example shows how a new type of body part requiring it's own cover area can be implemented.

	*: "A Furry Tale"
	
	Include Erotic Storytelling by Fictitious Frode.
	Use consensual persuasion.

It's best to define the actors (including the player) with gender as early as possible.
We also need a location with a decency threshold low enough to allow experimentation.

	Lounge is a room. "Despite the name, the lounge is rather boring and devoid of any furniture. It seems as though it serves no real purpose."
	Kitsune is a woman in Lounge.
	Adam is a man in Lounge. The player is Adam.
	The decency threshold of Lounge is indecent.

The first part is expanding the Table of Coverage to define the new cover area.

	Table of Coverage(continued)
	Cover Area	Uncovered Decency (decency)
	The tail area	immodest

For creating the body part, we have two options: create a new template kind or a new generic body part.
Both approaches need all properties set; the most important is the cover locations but any understand phrases or action control adjectives should also be defined.
If we expect to create multiples of the new part it's best to create a new template so all this is only done once.
	
	A tail is a kind of body part.
	The cover locations of a tail is usually {tail area}.
	A tail is usually touchable. A tail is usually rubbable.

Because the tail uses a new cover area, we need to add that cover area to any persons that have a tail.
This can be done by either declaring the contents of the body area property, or we can dynamically alter the list during start up or play.
The body part must also be declared to be part of the relevant persons.

	When play begins, add tail area to the body areas of Kitsune.
	
	Kitsune's tail is a tail that is part of Kitsune.
	The covered description of Kitsune's tail is "You've heard the rumours about her [short description], but you can't see it."
	The uncovered description of Kitsune's tail is "She has a [short description], wagging playfully from side to side."
	The short description of Kitsune's tail is "long furry tail".
	Description notability for Kitsune's tail: If Kitsune's tail can be seen, distinct.

The second part is adapting existing garments to take this new cover area into consideration.
Without this modification the tail would not be covered by the dress, which might be what was wanted (if it had a tail-hole, for instance).
We also change the dress to be raisable instead of buttonable

	A pink dress is a dress worn by Kitsune.
	The short description is "pink frilly dress".
	The unworn description is "It's a [short description]."
	The worn description is "She's wearing a [short description] that covers most of her body."
	The shifted description is "Her [short description] is raised to reveal her legs and [short description of Kitsune's tail]."
	
	The cover areas of pink dress is usually {shoulder area, arm area, upper torso area, lower torso area, upper back area, lower back area, crotch area, thigh area, leg area, tail area}.
	A pink dress is not default cover blocking.
	The shiftyness of a pink dress is raisable. The shifting revealed cover areas of a dress is usually {crotch area, thigh area, leg area, tail area}.	

We can also create new garments for just this body part.
We make it transparent because we don't want it to block vision.
Note that because this only covers the tail, a person without a tail will be unable to wear it.

	A ribbon is a garment worn by Kitsune.
	It is transparent. It is allow touching through.
	The cover areas is {tail area}.
	The worn description is "A pink ribbon is tied around the tail."
	The unworn description is "A pink strip of fabric that can be tied into a ribbon."
	Understand "pink", "strip of/--", "fabric" as ribbon.

We grant consent for some actions so the player can test the differences.

	Consent for an actor shifting a garment worn by Kitsune: Give consent.
	Consent for an taking ribbon: Give consent.
	
	Test me with "x kitsune / x tail / x ribbon / lift dress / x kitsune / x tail / x ribbon / take ribbon / wear ribbon"