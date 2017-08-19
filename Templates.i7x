Version 1/170820 of Erotic Storytelling Templates by Fictitious Frode begins here.
"A documentation extension providing fill-in-the-blanks templates for easier writing of Adult Interactive Fiction (AIF) in Inform."

Include Erotic Storytelling by Fictitious Frode.

Erotic Storytelling Templates ends here.

---- DOCUMENTATION ----

Chapter 1 - Using this Extension

This Extension provides no functionality on it's own, instead providing easy access to various templates for use with the Erotic Storytelling extension.
To use that framework, you need to download and install it (which you probably have if you're reading this) and include it in your story:

*:
	Include Erotic Storytelling by Fictitious Frode.

Section 1.1 - Documentation Overview

Each chapter in this documentation will provide templates for different concepts.

	Chapter 1: Story Fundamentals such as use options, standard imports and body part creation.
	Chapter 2: Actors with agency, body parts, clothing and dialogue.
	Chapter 3: Scenes with setup and teardown as well erotic integration.

The enclosed Template.ni file contains one way of structuring a story.


Section 1.2 - Version History

2017-08-20: Beta-1 (Release 1)

	Initial release, with templates for:
	Story Fundamentals: Useful imports and options; Creation of body parts.
	Actors: Agency, body parts, clothing and dialogue.
	Scenes: Scene setup and teardown with erotic integration.

Section 1.3 - Contact Info

The author of this extension can be reached in the following ways:

	Mail: fictitious.frode@gmail.com
	Blog: https://informedaif.wordpress.com/ is a blog dedicated to writing AIF with Inform 7, and is the official host of the extension. It contains both dicussions around AIF and tutorials on both Inform in general and this extension in particular.
	Reddit: https://www.reddit.com/r/AIFCentral/ is the subreddit for the AIF community, and the author checks this regularly.
	GitHub: https://github.com/FictitiousFrode/AIF Contains the latest version of the extension, possibly including functionality that hasn't been released yet.

Feedback of all varieties is welcome, but constructive criticism and discussion is the most appreciated, along with reports of bugs and other issues.
For support I would appreciate using public communication, so that other may learn from the request as well.

Chapter 1 - Story Fundamentals

This chapter lists some of the most common options applying to the story in general.
These templates are also included in the sample story structure file template.ni.

Section 1.1 - Options

These are some of the use options defined in Inform that the author finds most useful.
Chapter 2.12 of 'Writing with Inform' has more information on most of these options.

Signalling that the game is written in US rather than UK dialect changes some response texts in the core rules and extensions:

*:
	Use American dialect.

Traditionally interactive fiction has three levels of verbosity that the player controls, but these use options allows us to set a default for the story.
Full-length is the current default for Inform and prints the entire room description every time the player visits.
Brief prints the full description on the first visit but only the room title thereafter, while superbrief always prints just the room title.

*:
	Use full-length room descriptions.
	Use brief room descriptions.
	Use superbrief room descriptions.

The serial comma, also known as the Oxford comma, is a comma placed after the penultimate item in a list of three or more items:

*:
	Use serial comma.

To force Inform to only recognize full object names instead of the default behavior of trying to understand partial object references:

*:
	Use unabbreviated object names.

Scoring is by default disabled (see 9.2 of 'Writing with Inform' for more details).

*:
	Use scoring.

The persuasion rules (for when the player issues commands to other actors) has some overlap with the consent rules introduced in Erotic Storytelling, so we have an option to use consent rules for persuasion:

*:
	Use consensual persuasion.

The Discrete Arousal-based Consent and Stimulation system is an optional emulation of TADS-style arousal systems:

*:
	Use DACS.

Section 1.2 - Imports

To include the full range of extensions in the framework:

*:
	Include Erotic Storytelling by Fictitious Frode.
	Include Simple Conversations by Fictitious Frode.
	Include Posturing by Fictitious Frode.
	Include Directionality by Fictitious Frode.

Some other extensions worth mentioning:

*:
	Include Mood Variations by Emily Short.
	Include Locksmith by Emily Short.

Section 1.3 - Default Body Parts

The following body parts should be sufficient for most stories:

*:
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

For completeness, these are the rest of the templated body parts:

*:
	A face is a part of every person.
	Some thighs are a part of every person.
	Some ankles are a part of every person.
	Some arms are a part of every person.
	Some wrists are a part of every person.
	A neck is a part of every person.
	Some shoulders are a part of every person.
	An abdomen is a part of every person.
	A waist is a part of every person.
	A backside is a part of every person.

Section 1.4 - Custom Body Parts

The template below contains the main code for creating custom body parts and cover areas, see the 'A Furry Tale' example for complete details.

*:
	Table of Coverage(continued)
	Cover Area	Uncovered Decency (decency)
	The tail area	immodest

	A tail is a kind of body part.
	The cover locations of a tail is usually {tail area}.
	A tail is usually touchable. A tail is usually rubbable.

	When play begins, add tail area to the body areas of ACTOR.

Note that clothing would also have to be tailed to accomodate new cover areas.

Chapter 2 - Actors

Tailoing actors to your story is an exercise in descriptions.
The chapter has templates for easily getting descriptions (and properties) right for body parts and clothing, as well as skeletons for dialogue and agency.

Section 2.1 - Agency

Agency has to be enabled for each relevant actor, and should also include a state description for the default description generation.
It's often more useful to link these to scenes rather than have them always running.

*:
	ACTOR is agency-enabled.
	The priority of ACTOR is 10.
	The agency state description of ACTOR is "ACTOR STATE."

Idle message that only displays randomly:

*:
	Idleness for ACTOR during SCENE:
		If a random chance of 1 in 3 succeeds, say "[one of]TEXT[or]TEXT[completely at random]".

Planned agency for following the player or moving towards a given room:

*:
	Planned agency for ACTOR during SCENE:
		Unless ACTOR can see player:
			Let the way be the best route from the location of ACTOR to location of player, using doors;
			If the way is a direction:
				Try ACTOR going the way;

	Planned agency for ACTOR during SCENE:
		Let the way be the best route from the location of ACTOR to DESTINATION, using doors;
		If the way is a direction:
			Try ACTOR going the way;

Section 2.2 - Body Parts

Description notability determines which parts are listed when examining the actor, using the short description property.
The covered and uncovered descriptions are available for every body part, but the template only uses them for the intimate parts.
The template below contains a suggested notability for each part, but this should be changed to one of distinct/grouped/unnotable/hidden as needed.

*:
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

	The covered description of ACTOR's vagina is "ACTOR has [short description], covered by [the concealing vision of ACTOR's vagina]."
	The uncovered description of ACTOR's vagina is "ACTOR has [short description], NAKED DETAILS."
	The short description of ACTOR's vagina is "DETAILS vagina".
	Description notability for ACTOR's vagina: Unless ACTOR's vagina can be seen, Hidden; Distinct.

	The covered description of ACTOR's breasts is "ACTOR has [short description], covered by [the concealing vision of ACTOR's breasts]."
	The uncovered description of ACTOR's breasts is "ACTOR has [short description], NAKED DETAILS."
	The short description of ACTOR's breasts is "DETAILS breasts".
	Description notability for ACTOR's breasts: Unless ACTOR's breasts can be seen, Hidden; Distinct.

For the male body parts, we assume them to belong to the player.

*:
	The covered description of your penis is "My [short description] is safely tucked away under [the concealing vision of your penis]."
	The uncovered description of your penis is "My penis is [if player is aroused or more]standing prudly at attention[else]hanging flaccidly[end if]."
	The short description of your penis is "[if player is aroused or more]erect[else]limp[end if] penis".
	Description notability for your penis: Unless your penis can be seen, Hidden; Distinct.

	The covered description of your chest is "My [short description] is hidden away under [the concealing vision of your chest]."
	The uncovered description of your chest is "My [short description] is displayed proudly."
	The short description of your chest is "muscular chest".
	Description notability for your chest: Unless your chest can be seen, Hidden; grouped.

For a more complete description of orificies the following template can be used.
Note that this references several custom properties that are not defined.

*:
	The uncovered description of ACTOR's ass is
		"ACTOR's [short decription] is [if spanked][spanking description][else]SKINTONE[end if][if ACTOR's ass is spermed] with sperm leaking from her hole[end if].
		[if lubricated]Her anus is gleaming from [lubrication medium][end if][if ACTOR's ass is lubricated and ACTOR's ass contains something] with [a list of things in ACTOR's ass] peeking out[end if].
		[if ACTOR's ass is not lubricated and ACTOR's ass contains something][A list of things in ACTOR's ass] is peeking out of her tight anus.[end if]".

	The uncovered description of ACTOR's vagina is
		"ACTOR's [short decription] is [shaved description][if ACTOR's vagina is spermed] with sperm dripping down her thighs[end if].
		[if lubricated]Her lips are gleaming from [lubrication medium][end if][if ACTOR's vagina is lubricated and ACTOR's vagina contains something] with [a list of things in ACTOR's vagina] firmly inserted[end if].
		[if ACTOR's vagina is not lubricated and ACTOR's vagina contains something]Her lips are parted by [a list of things in ACTOR's vagina].[end if]".


Section 2.3 - Clothing

The template below covers the most commonly set properties for garments.
Most of these are not applicable to all forms of clothing.

*:
	A GARMENT is a TYPE worn by ACTOR.
	Description notability for GARMENT: Unless GARMENT can be seen, Hidden; Distinct/Grouped/Unnotable/Hidden.
	It is transparent. It is allow touching through.
	It is rippable. It is shiftable. The shiftyness of GARMENT is moveable/buttonable/zipable/fastenable/raisable/lowerable.
	The short description is "SHORTDESCRIPTION".
	The unworn description is "A [short description] DETAILS."
	The worn description is "The [short description] is slightly transparent, allowing you to see that [the holder of GARMENT] is wearing [revealed by shifting/taking off GARMENT] underneath."
	The shifted description is "The [short description] is SHIFTED, revealing [revealed by shifting GARMENT] underneath."
	The ripped description is  "The [short description] is RIPPED, revealing [revealed by ripping GARMENT] underneath."

The template below covers the all properties for garments.

*:
	A GARMENT is a TYPE worn by ACTOR.
	Description notability for GARMENT:	Unless GARMENT can be seen, Hidden; Distinct/Grouped/Unnotable/Hidden.
	It is transparent. It is allow touching through. The clothing size is NUMBER.
	The cloth decency is indecent/immodest/casual/formal. The clothing layer is skinwear/underwear/normalwear/overwear/outerwear.
	It is rippable. It is shiftable. The shiftyness of GARMENT is moveable/buttonable/zipable/fastenable/raisable/lowerable.
	The ripping revealed cover areas are {LIST}.
	The shifting revealed cover areas are {LIST}.
	The short description is "SHORTDESCRIPTION".
	The unworn description is "A [short description] DETAILS."
	The worn description is "The [short description] is slightly transparent, allowing you to see that [the holder of GARMENT] is wearing [revealed by shifting/taking off GARMENT] underneath."
	The shifted description is "The [short description] is SHIFTED, revealing [revealed by shifting GARMENT] underneath."
	The ripped description is  "The [short description] is RIPPED, revealing [revealed by ripping GARMENT] underneath."

Section 2.4 - Dialogue

The Simple Conversations extension can be used to easily set up dialogue with actors.
The template below show how to set up a dialogue table, as well as the relevant phrases to use for manipulating conversations.

*:
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

Chapter - Scenes


Section - Setup and Teardown

One of the benefits of scenes is that you can tie any relevant entry and exit parameters to them.
The following template provides the structure and phrases for setting up most scenes, divided into seperate rules for clarity.

*:
	Part 1.4.1 - PROLOGUE

	PROLOGUE is a scene.
	PROLOGUE begins when play begins.
	PROLOGUE ends when CONDITION.

	Chapter 1.4.1a - Setup

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
		Now ACTOR is not keep clothes after undress;
		Now ACTOR is agency-enabled;
		Now the agency state description of ACTOR is "ACTOR STATE";
		Now the uninterested response of ACTOR is "ACTOR DENIAL";
		Now the preferred clothing of ACTOR is {GARMENT, GARMENT};
		Force dress ACTOR in the preferred clothing of ACTOR;

	Chapter 1.4.1b - Teardown

	When PROLOGUE ends (this is the PROLOGUE ending rule):
		Say "(-continue-)[paragraph break]";
		Wait for any key;
		Clear the screen;

	When PROLOGUE ends (this is the PROLOGUE achievements rule):
		If CONDITION, award the ACHIEVEMENT;

	When PROLOGUE ends (this is the PROLOGUE stage-cleaning rule):
		[Ensure a consistent end-state for the world]

Section - Involving Actors

An actor's agency is usually tied to a scene.

*:
	Chapter 1.4.1c - Agency

	Planned agency for ACTOR during PROLOGUE:
		Unless ACTOR can see player:
			Let the way be the best route from the location of ACTOR to location of player, using doors;
			If the way is a direction:
				Try ACTOR going the way;

	Planned agency for ACTOR during PROLOGUE:
		Let the way be the best route from the location of ACTOR to DESTINATION, using doors;
		If the way is a direction:
			Try ACTOR going the way;

Erotic actions can be similarly tied to a scene, to control that they don't happen at inopportune times.
Consent rules will default to deny consent if nothing else is specified.
Note the seperate consent rule for the actor doing something; if consensual persuasion is enabled this will allow the actor to perform any action that is governed by consent (i.e. any erotic action or dealing with garments).
To let the player instruct the actor to do other actions you need to use the persuasion rules.

Also included are after rules for all the default body parts, taking into account the default limiting factors described in chapter 2.1 of Erotic Storytelling documentation.
Note how the fucking actions needs to account for both the actor performing the action as well as the orifice and penetrator; breasts must be made orificial to enable titfucking.
Custom refusal messages for the actions are best handled by using instead rules.

*:
	Chapter 1.4.1d - Consent

	Consent for doing something to ACTOR during PROLOGUE: If CONDITION, give consent; Make no decision.
	Consent for doing something to a body part enclosed by ACTOR during PROLOGUE: If CONDITION, give consent; Make no decision.
	Consent for doing something to a garment enclosed by ACTOR during PROLOGUE: If CONDITION, give consent; Make no decision.

	Consent for ACTOR doing something during PROLOGUE: If CONDITION, give consent; Make no decision.

	Chapter 1.4.1d - Erotica

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
