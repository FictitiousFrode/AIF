"Story" by Author

Volume 0 - Setup

Use American dialect, full-length room descriptions, and the serial comma.
Use unabbreviated object names.
Use scoring.
Use consensual persuasion. [Defer persuasion to consent for the actions that require consent.]
[Use DACS. - Enable Discrete Arousal-based Consent and Stimulation.]

Include Erotic Storytelling by Fictitious Frode.
[Include Simple Conversations by Fictitious Frode.]
[Include Posturing by Fictitious Frode.]
Include Directionality by Fictitious Frode.

Book 0.1 - Titlepage

Part 0.1.1 - Metadata

The story creation year is 2017.
The story genre is "Erotica".
The story headline is "The byline printed when the story begins."
The story description is "A short introduction giving the premise of the story. Will be used in the out-of-game titlecard." 
The release number is 0.

Part 0.1.2 - Contents

[Heterosexuality is a story content.]
[Bondage is a disabled story content.]

Part 0.1.3 - Dramatis Personae

[Defining the actors taking part in the story.]

Part 0.1.4 - Conversation Subjects

[Defining the general conversation subjects relevant to the story.]

Part 0.2 - General Declarations

Book 0.2.1 - Body Part Creation

A head is a part of every person. Understand "face" as head.
Some hair is a part of every person.
Some eyes are a part of every person.
A mouth is a part of every person.
Some feet are a part of every person.
Some legs are a part of every person. Understand "thighs" as legs.
Some hands are a part of every person. Understand "arms" as hands.
An ass is a part of every person.

A vagina is a part of every woman.
Some breasts are a part of every woman.

A chest is a part of every man.
A penis is a part of every man.

Book 0.2.2 - Custom Properties

[Any story-wide custom properties should go here.]

[A body part can be spermed. A body part is usually not spermed.]
[A person can be proper-named. A person is usually not proper-named.]

Book 0.3 - A Helping Hand

Book 0.3.1 - Text Substitutions

To say i -- beginning say_i -- running on: (- style underline; -).
To say /i -- ending say_i -- running on: (- style roman; -). 
To say b -- beginning say_b -- running on: (- style bold; -). 
To say /b -- ending say_b -- running on: (- style roman; -). 

Book 0.3.2 - Math

To decide if (X - A number) is between (low - a number) and (high - a number):
	If X >= low and X <= high, decide yes;
	Decide no;

Book 0.3.3 - Movement

[Make exit mean go outside.]
Instead of exiting when the player is not in something:
	Try going outside instead;

Volume 1 - Act I

[Divide the game into Acts, one volume for each]

Book 1.1 - Geology

[The locations related to Act I, divided into parts for regions with chapters for each room.]

Part 1.1.1 - Region

Chapter 1.1.1a - Room

Book 1.2 - Inhabitants

[The actors related to Act I, one part for each.]

Part 1.2.1 - Person

Chapter 1.2.1a - Agency

ACTOR is agency-enabled.
The priority of ACTOR is 10.
Idleness for ACTOR:
	If a random chance of 1 in 3 succeeds, say "[one of]TEXT[or]TEXT[completely at random]".

Chapter 1.2.1b - Body Parts

The description of ACTOR's head is "ACTOR has [short description of ACTOR's hair], [short description of ACTOR's eyes], and [short description of ACTOR's mouth]."
The short description of ACTOR's head is "TEXT".
Description notability for ACTOR's head: unnotable.

The description of ACTOR's hair is "ACTOR has [short description], EXTRA DETAILS."
The short description of ACTOR's hair is "FORM COLOUR hair".
Description notability for ACTOR's hair: distinct.

The description of ACTOR's eyes is "ACTOR has [short description], EXTRA DETAILS."
The short description of ACTOR's eyes is "COLOUR eyes".
Description notability for ACTOR's eyes: grouped.

The description of ACTOR's mouth is "ACTOR has [short description], EXTRA DETAILS."
The short description of ACTOR's mouth is "DETAILS mouth".
Description notability for ACTOR's mouth: grouped.

The description of ACTOR's feet is "ACTOR has [short description], EXTRA DETAILS."
The short description of ACTOR's feet is "DETAILS feet".
Description notability for ACTOR's feet: unnotable.

The description of ACTOR's legs is "ACTOR has [short description], EXTRA DETAILS."
The short description of ACTOR's legs is "DETAILS legs".
Description notability for ACTOR's legs: grouped.

The description of ACTOR's hands is "ACTOR has [short description], EXTRA DETAILS."
The short description of ACTOR's hands is "DETAILS hands".
Description notability for ACTOR's hands: unnotable.

The covered description of ACTOR's ass is "ACTOR has [short description], covered by [the concealing vision of ACTOR's ass]."
The uncovered description of ACTOR's ass is "ACTOR has [short description], NAKED DETAILS."
The short description of ACTOR's ass is "DETAILS ass".
Description notability for ACTOR's ass: Unless ACTOR's ass can be seen, Hidden; Distinct.

[If female:
The covered description of ACTOR's vagina is "ACTOR has [short description], covered by [the concealing vision of ACTOR's vagina]."
The uncovered description of ACTOR's vagina is "ACTOR has [short description], NAKED DETAILS."
The short description of ACTOR's vagina is "DETAILS vagina".
Description notability for ACTOR's vagina: Unless ACTOR's vagina can be seen, Hidden; Distinct.

The covered description of ACTOR's breasts is "ACTOR has [short description], covered by [the concealing vision of ACTOR's breasts]."
The uncovered description of ACTOR's breasts is "ACTOR has [short description], NAKED DETAILS."
The short description of ACTOR's breasts is "DETAILS breasts".
Description notability for ACTOR's breasts: Unless ACTOR's breasts can be seen, Hidden; Distinct.
]

[If male:
The covered description of your penis is "My [short description] is safely tucked away under [the concealing vision of your penis]."
The uncovered description of your penis is "My penis is [if player is aroused or more]standing prudly at attention[else]hanging flaccidly[end if]."
The short description of your penis is "[if player is aroused or more]erect[else]limp[end if] penis".
Description notability for your penis: Unless your penis can be seen, Hidden; Distinct.

The covered description of your chest is "My [short description] is hidden away under [the concealing vision of your chest]."
The uncovered description of your chest is "My [short description] is displayed proudly."
The short description of your chest is "muscular chest".
Description notability for your chest: Unless your chest can be seen, Hidden; grouped.
]

Chapter 1.2.1c - Clothing

A GARMENT is a TYPE worn by ACTOR.
Description notability for GARMENT: Unless GARMENT can be seen, Hidden; Distinct/Grouped/Unnotable/Hidden.
It is transparent. It is allow touching through.
It is rippable. It is shiftable. The shiftyness of GARMENT is moveable/buttonable/zipable/fastenable/raisable/lowerable.
The short description is "SHORTDESCRIPTION".
The unworn description is "A [short description] DETAILS."
The worn description is "The [short description] is slightly transparent, allowing you to see that [the holder of GARMENT] is wearing [revealed by shifting/taking off GARMENT] underneath."
The shifted description is "The [short description] is SHIFTED, revealing [revealed by shifting GARMENT] underneath."
The ripped description is  "The [short description] is RIPPED, revealing [revealed by ripping GARMENT] underneath."


Chapter 1.2.1d - Dialogue

The dialogue of ACTOR is the Table of ACTOR's Dialogue.

Table of ACTOR's Dialogue
subject (a thing)	availability (a truth state)	cue (a text)	turn stamp (a number)	dialogue (some text)
--	--	--	--	--

After talking to ACTOR about SUBJECT:
	If SUBJECT has been talked about to ACTOR:
		Deactivate SUBJECT for PERSON;
	Activate SUBJECT for PERSON;
	Clear the cue of SUBJECT for ACTOR;
	Update the cue of SUBJECT for ACTOR to "TEXT";
	Clear the dialogue of SUBJECT for ACTOR;
	Update the dialogue of SUBJECT for ACTOR to "TEXT";


Book 1.3 - Mechanics

[Any mechanics pertaining to the act, one part for each main feature.]

Book 1.4 - Chronology

[Break the act into scenes]

Part X.4.Y - PROLOGUE

PROLOGUE is a scene.
PROLOGUE begins when play begins.
PROLOGUE ends when CONDITION.

Chapter X.4.Ya - Setup

When PROLOGUE begins (this is the PROLOGUE quotation rule):
	[display the boxed quotation;]
	Say "QUOTATION[paragraph break]";
	Say "—SOURCE[paragraph break]";
	[show the current quotation;]
	Say "(-continue-)[paragraph break]";
	Wait for any key;
	Clear the screen;

When PROLOGUE begins (this is the PROLOGUE introduction rule):
	Say "INTRODUCTION TEXT";
	
When PROLOGUE begins (this is the PROLOGUE stage-setting rule):
	[Place the things that are relvant for the prologue]
	Now the THING is in LOCATION;
	[Place and dress ACTOR]
	Now ACTOR is in LOCATION;
	Now ACTOR is agency-enabled;
	Now the agency state description of ACTOR is "ACTOR STATE";
	Now the uninterested response of ACTOR is "ACTOR DENIAL";
	Now the preferred clothing of ACTOR is {GARMENT, GARMENT};
	Force dress ACTOR in the preferred clothing of ACTOR;

Chapter X.4.Yb - Teardown

When PROLOGUE ends (this is the PROLOGUE ending rule):
	Say "(-continue-)[paragraph break]";
	Wait for any key;
	Clear the screen;

When PROLOGUE ends (this is the PROLOGUE achievements rule):
	If CONDITION, award the ACHIEVEMENT;

When PROLOGUE ends (this is the PROLOGUE stage-cleaning rule):
	[Ensure a consistent end-state for the world]
	
Chapter X.4.Yc - Agency

Planned agency for ACTOR during PROLOGUE:
	Unless ACTOR can see player:
		Let the way be the best route from the location of ACTOR to location of player, using doors;
		If the way is a direction:
			Try ACTOR going the way;

Planned agency for ACTOR during PROLOGUE:
	Let the way be the best route from the location of ACTOR to DESTINATION, using doors;
	If the way is a direction:
		Try ACTOR going the way;

Chapter X.4.Yd - Consent
	
Consent for doing something to ACTOR during PROLOGUE: If CONDITION, give consent; Make no decision.
Consent for doing something to a body part enclosed by ACTOR during PROLOGUE: If CONDITION, give consent; Make no decision.
Consent for doing something to a garment enclosed by ACTOR during PROLOGUE: If CONDITION, give consent; Make no decision.

Consent for ACTOR doing something during PROLOGUE: If CONDITION, give consent; Make no decision.

Chapter X.4.Yd - Erotica

After kissing ACTOR during PROLOGUE, say "RESPONSE."
After hugging ACTOR during PROLOGUE, say "RESPONSE."
After dancing ACTOR during PROLOGUE, say "RESPONSE."

After touching ACTOR's feet during PROLOGUE, say "RESPONSE."
After rubbing ACTOR's feet during PROLOGUE, say "RESPONSE."
After tickling ACTOR's feet during PROLOGUE, say "RESPONSE."
After licking ACTOR's feet during PROLOGUE, say "RESPONSE."
After biting ACTOR's feet during PROLOGUE, say "RESPONSE."

After touching ACTOR's legs during PROLOGUE, say "RESPONSE."
After rubbing ACTOR's legs during PROLOGUE, say "RESPONSE."

After touching ACTOR's hands during PROLOGUE, say "RESPONSE."
After rubbing ACTOR's hands during PROLOGUE, say "RESPONSE."

After touching ACTOR's ass during PROLOGUE, say "RESPONSE."
After rubbing ACTOR's ass during PROLOGUE, say "RESPONSE."
After spanking ACTOR's ass during PROLOGUE, say "RESPONSE."
After pinching ACTOR's ass during PROLOGUE, say "RESPONSE."
After licking ACTOR's ass during PROLOGUE, say "RESPONSE."

After touching ACTOR's breasts during PROLOGUE, say "RESPONSE."
After rubbing ACTOR's breasts during PROLOGUE, say "RESPONSE."
After tickling ACTOR's breasts during PROLOGUE, say "RESPONSE."
After licking ACTOR's breasts during PROLOGUE, say "RESPONSE."
After biting ACTOR's breasts during PROLOGUE, say "RESPONSE."
After pinching ACTOR's breasts during PROLOGUE, say "RESPONSE."

After touching ACTOR's vagina during PROLOGUE, say "RESPONSE."
After rubbing ACTOR's vagina during PROLOGUE, say "RESPONSE."
After touching ACTOR's vagina during PROLOGUE, say "RESPONSE."

After touching ACTOR's chest during PROLOGUE, say "RESPONSE."
After rubbing ACTOR's chest during PROLOGUE, say "RESPONSE."
After tickling ACTOR's chest during PROLOGUE, say "RESPONSE."
After licking ACTOR's chest during PROLOGUE, say "RESPONSE."
After biting ACTOR's chest during PROLOGUE, say "RESPONSE."

After touching ACTOR's penis during PROLOGUE, say "RESPONSE."
After rubbing ACTOR's penis during PROLOGUE, say "RESPONSE."
After pinching ACTOR's penis during PROLOGUE, say "RESPONSE."
After licking ACTOR's penis during PROLOGUE, say "RESPONSE."
After biting ACTOR's penis during PROLOGUE, say "RESPONSE."

After fucking ACTOR's ass with SOMETHING during PROLOGUE: say "RESPONSE."
After fucking ACTOR's vagina with SOMETHING during PROLOGUE, say "RESPONSE."
After fucking SOMETHING with ACTOR's penis during PROLOGUE, say "RESPONSE."