Version 1/150126 of Posturing by Fictitious Frode begins here.

"Allows actors in a story to assume various postures, and provides furniture to posture on.."

[For most IF, it's sufficient to know which actors are in a given room.
For AIF, it might be helpful to know how and where each actor is in a given room. Where they are is represented by furniture (which is a subtype of support).
Example 394 and 8.4 of the Recipe Book covers some of this, but in a different way.]

Book 1 - Postures

[An actor has a posture and a location. The postures can be one of:
 * Standing (default)
 * Dancing - Postponed
 * Sitting
 * Kneeling
 * Bending (over)
 * laying prone (face-down)
 * laying supine (face-up)
The location can be a piece of furniture, or possible the floor, or even a corner.
When listing actors in a location, we want to also state their posture w/location, if it's not the default.]

A posture is a kind of value. The postures are standing, sitting, kneeling, bending over, laying prone and laying supine.
A person has a posture called the current posture. The current posture is usually standing.

[TODO: Alter how actors are listed in a room.]
[TODO: Alter how the player's posture is listed]
[TODO: Alter accessibility of body parts based on postures]

Part 1.1 - Verbs

To stand is a verb.
To dance is a verb.
To sit is a verb.
To kneel is a verb.
To bend is a verb.
To lie is a verb.
To turn is a verb.
To drop is a verb.

Chapter - Converting to verb

To say (the position - a posture) as verb:
	If the position is:
		-- standing: Say "[stand]";
[		-- dancing: Say "[dance]";]
		-- sitting: Say "[sit]";
		-- kneeling: Say "[kneel]";
		-- bending over: Say "[bend]";
		-- laying prone: Say "[lie]";
		-- laying supine: Say "[lie]";

Part 1.2 - Definitions

[Checks if a given individual is in a given posture]
To decide whether (individual - a person) is currently (position - a posture):
	If the current posture of the individual is the position, decide yes;
	Else decide No;

To decide whether (individual - a person) is not currently (position - a posture):
	If the current posture of the individual is the position, decide no;
	Else decide yes;

[Checks if a given individual is in a given posture for a given location]
To decide whether (individual - a person) is currently (position - a posture) on (location - a thing):
	If the current posture of the individual is the position and the individual is supported by the location, decide yes;
	Else decide no;

[Negation]
To decide whether (individual - a person) is not currently (position - a posture) on (location - a thing):
	If the current posture of the individual is the position and the individual is supported by the location, decide no;
	Else decide yes;

[Checks if a given individual is in a given location]
To decide whether (individual - a person) is currently in (location - a thing):
	If the the individual is supported by the location, decide yes;
	Else decide no;

[Checks if *any* person is in a given posture for a given location]
To decide whether someone is currently (position - a posture) on (location - a thing):
	If the location is enterable:
		Repeat with individual running through the list of persons supported by the location:
			If the current posture of the individual is the position, decide yes;
	Decide no;
		
Book 2 - Furniture

[Furniture are provided both to facilitate postures, but also to plop down ready-made objects that can decorate rooms.]

A piece of furniture is a kind of supporter. The plural is pieces of furniture.
The specification of a piece of furniture is "Furniture is provided as a kind of support that is meant for the player and other actors to make active use of in the story, and as such they are usually enterable. We also keep track of how many actors a piece of furniture has room for, and what the preferred (default) posture is. In order to lessen the effect of unforeseen consequences when adding new postures, we track the list of allowed postures instead of a list of blocked postures."
The plural of a piece of furniture is pieces of furniture. They are plural-named.
A piece of furniture is usually enterable.
A piece of furniture has a posture called the preferred posture.
A piece of furniture has a number called the occupant limit. The occupant limit of a piece of furniture is usually 1.
A piece of furniture has a list of postures called compatible postures.

Part 2.1 - Definitions

[Determines if there is room for one more person on a furniture]
To decide if (F - a piece of furniture) has vacancy:
	Let occupants be the number of entries in the list of people on F;
	Let limit be the occupant limit of F;
	If occupants >= limit, decide no;
	Decide yes;

[Determines if a furniture allows a posture]
To decide if (furniture - a piece of furniture) allows (position - a posture):
	If position is listed in the compatible postures of furniture, decide yes;
	Decide no;

[Negation of the above]
To decide if (furniture - a piece of furniture) blocks (position - a posture):
	If position is listed in the compatible postures of furniture, decide no;
	Decide yes;


Part 2.2 - Furniture Catalog

Chapter - Bed

A bed is a kind of piece of furniture.
The specification of a bed is "As the name implies, this represents a generic bed."
The occupant limit of a bed is usually 4.
The preferred posture of a bed is usually laying supine.
The compatible postures of a bed is usually {sitting, kneeling, bending over, laying supine, laying prone}.
The description of a bed is usually "It's a standard bed, for sleeping and other activities."

Chapter - Chair

A chair is a kind of piece of furniture.
The occupant limit of a chair is usually 1.
The preferred posture of a chair is usually sitting.
The description of a chair is usually "It's chair, made for sitting on."
The compatible postures of a chair is usually {sitting, bending over}.

Chapter - Couch/Sofa

A sofa is a kind of piece of furniture. Understand "couch" as sofa.
The occupant limit of a sofa is usually 3.
The preferred posture of a sofa is usually sitting.
The description of a sofa is usually "It's three-couch sofa."
The compatible postures of a sofa is usually {sitting, bending over, laying supine, laying prone}.

Chapter - Table

A table is a kind of piece of furniture.
The occupant limit of a table is usually 2.
The preferred posture of a table is laying supine.
The description of a table is usually "It's solid table."
The compatible postures of a table is usually {sitting, bending over, laying supine, laying prone}.

Chapter - Desk

A desk is a kind of piece of furniture.
The occupant limit of a desk is usually 1.
The preferred posture of a desk is sitting.
The description of a desk is usually "It's a sturdy desk."
The compatible postures of a desk is usually {sitting, bending over, laying supine, laying prone}.
[TODO: Drawer]

[TODO: Cabinet/Dresser]

Book 3 - Changing Postures

Part 3.1 - General Entering and Exiting

Check an actor entering a piece of furniture (called F) (this is the enforce occupancy limit rule):
	If F has vacancy:
		Continue the action;
	Else:
		Say "[F] [are] already occupied." (A);
		Stop the action;

[Change postures when entering furniture]
Carry out an actor entering something (this is the assert postures rule):
	If F is a piece of furniture (called F):
		If F blocks the current posture of actor:
			Say "[Current posture of actor] [are not] possible on [F]; [if actor is the player][We][else][Actor][end if] [are] [preferred posture of F] instead." (A);
			Now the current posture of actor is the preferred posture of F;

The assert postures rule is listed last in the carry out entering rulebook.

Carry out an actor getting off a piece of furniture (this is the revert to standing rule):
	Try the actor standing;

[Change postures when changing rooms]
Carry out an actor going:
	Silently try the actor standing;

Part 3.2 - Stand

[The act of standing can be either be on something, or implicit in the current location.
Implicit standing simply changes the posture (if possible), while standing on tries to enter the targeted location with the standing posture.]

Chapter - Stand on

Standing on is an action applying to one touchable thing.
The specification of the standing on action is "Standing on is the act of changing both one's posture and location. See 'standing' for the action of just changing one's posture, or 'enter' for the act of just changing location.
By default, standing on will only accept a piece of furniture as a valid location, but 'stand on floor' and 'stand on ground' will redirect to getting off if the actor is on something."
Understand "stand on [something]" as standing on.
Understand "stand on ground" and "stand on floor" as getting off.

Check an actor standing on something (this is the standing on verification rule):
	If the actor is currently standing on the noun, say "[If the player is the actor][We][else][Actor][end if] [are] already standing on [noun]." (A) instead;
	If the noun is not a piece of furniture (called F):
		Say "[If the player is the actor][We][else][Actor][end if] [cannot] [stand] on [noun]." (B) instead;
	Else:
		If F blocks standing, say "[If the player is the actor][We][else][Actor][end if] [cannot] [stand] on [noun]." (C) instead;
		If the actor is on something that is not F:
			Say "(first getting off [F])[command clarification break]" (D);
			Try the actor getting off F;

Carry out an actor standing on a piece of furniture (called F) (this is the basic standing rule):
	Now the current posture of the actor is standing;
	If the actor is not on F, try the actor entering F;

Report an actor standing on something (this is the report standing on rule) :
	If the actor is the player, say "[If the player is the actor][We][else][Actor][end if] [stand] on [noun]." (A);

Chapter - Implicit Stand

Standing is an action applying to nothing.
The specification of the standing action is "Standing is the act of changing one's posture while remaining in the same location. See 'standing on' for the action of changing both posture and location."
Understand "stand" as standing.

Check an actor standing (this is the standing up verification rule):
	If the actor is currently standing, say "[If the player is the actor][We][else][Actor][end if] [are] already standing." (A) instead;
	If the actor is on a piece of furniture (called location):
		If location blocks standing:
			[Since we can't stand where we are, we interpret this as a request to exit instead.]
			Say "(first getting off [location])[command clarification break]" (B);
			Try the actor getting off the location;

Carry out an actor standing (this is the basic implicit standing rule):
	Now the current posture of the actor is standing;

Report an actor standing (this is the report implicit standing up rule):
	If the actor is the player, say "[If the player is the actor][We][else][Actor][end if] [stand] up." (A);

Part 3.3 - Sit

[The act of sitting can be either be on something, or implicit in the current location.
Implicit sitting tries to find something to sit on, and if no free furniture that supports sitting is found, instead sits on the ground. Sitting on tries to enter the targeted location with the sitting posture.]

Chapter - Sit on

Sitting on is an action applying to one touchable thing.
The specification of the sitting on action is "Sitting on is the act of changing both one's posture and location.
By default, only furniture is supported for sitting on."
Understand "sit on [something]" as sitting on.

Check an actor sitting on something (this is the sitting on verification rule):
	If the actor is currently sitting on the noun, say "[If the player is the actor][We][else][Actor][end if] [are] already sitting on [noun]." (A) instead;
	If the noun is not a piece of furniture (called F):
		Say "[If the player is the actor][We][else][Actor][end if] [cannot] [sit] on [noun]." (B) instead;
	Else:
		If F blocks sitting, say "[If the player is the actor][We][else][Actor][end if] [cannot] [sit] on [noun]." (C) instead;
		If the actor is on something that is not F:
			Say "(first getting off [F])[command clarification break]" (D);
			Try the actor getting off F;

Carry out an actor sitting on a piece of furniture (called F) (this is the basic sitting rule):
	Now the current posture of the actor is sitting;
	If the actor is not on F, try the actor entering F;

Report an actor sitting on something (this is the report sitting on rule) :
	If the actor is the player, say "[If the player is the actor][We][else][Actor][end if] [sit] down on [noun]." (A);

Chapter - Implicit Sit

Sitting is an action applying to nothing.
The specification of the sitting action is "Sitting is the act of trying to find something to sit on, and failing that, sitting on the ground. See 'sitting on' for actively targeting the place to sit."
Understand "sit" as sitting.

Check an actor sitting (this is the sitting verification rule):
	If the actor is currently sitting, say "[If the player is the actor][We][else][Actor][end if] [are] already sitting." (A) instead;
	If the actor is on a piece of furniture (called location) and location blocks sitting:
		[Since we can't sit where we are, we interpret this as a request to exit first.]
		Say "(first getting off [location])[command clarification break]" (B);
		Try the actor getting off the location;
	[See if there is a free furniture to sit on...]
	Repeat with current furniture running through the list of pieces of furniture in location of actor:
		If current furniture allows sitting and current furniture has vacancy:
			Say "(sitting on [current furniture])[command clarification break]" (C);
			Try the actor sitting on current furniture instead;

Carry out an actor sitting (this is the basic implicit sitting rule):
	Now the current posture of the actor is sitting;

Report an actor sitting (this is the report implicit sitting rule):
	If the actor is the player, say "[If the player is the actor][We][else][Actor][end if] [sit] down." (A);

Part 3.4 - Kneel

[The act of kneeling can be either be on something, or implicit in the current location.
Implicit kneeling simply changes the posture (if possible), while kneeling on tries to enter the targeted location with the kneeling posture.]

Chapter - Kneel on

Kneeling on is an action applying to one touchable thing.
The specification of the kneeling on action is "Kneeling on is the act of changing both one's posture and location. See 'kneeling' for the action of just changing one's posture, or 'enter' for the act of just changing location.
By default, kneeling on will only accept a piece of furniture as a valid location, but 'kneel on floor' and 'kneel on ground' will redirect to kneeling (getting off if necessary) by the use of the supply missing noun rule."
Understand "kneel on [something]" as kneeling on.

Check an actor kneeling on something (this is the kneeling on verification rule):
	If the actor is currently kneeling on the noun, say "[If the player is the actor][We][else][Actor][end if] [are] already kneeling on [noun]." (A) instead;
	If the noun is not a piece of furniture (called F):
		Say "[If the player is the actor][We][else][Actor][end if] [cannot] [kneel] on [noun]." (B) instead;
	Else:
		If F blocks kneeling, say "[If the player is the actor][We][else][Actor][end if] [cannot] [kneel] on [noun]." (C) instead;
		If the actor is on something that is not F:
			Say "(first getting off [F])[command clarification break]" (D);
			Try the actor getting off F;

Carry out an actor kneeling on a piece of furniture (called F) (this is the basic kneeling rule):
	Now the current posture of the actor is kneeling;
	If the actor is not on F, try the actor entering F;

Report an actor kneeling on something (this is the report kneeling on rule) :
	If the actor is the player, say "[If the player is the actor][We][else][Actor][end if] [kneel] on [noun]." (A);

Chapter - Implicit Kneel

Kneeling is an action applying to nothing.
The specification of the kneeling action is "Kneeling is the act of changing one's posture while remaining in the same location. See 'kneeling on' for the action of changing both posture and location."
Understand "kneel" as kneeling.
Understand "kneel on ground" and "kneel on floor" as kneeling.

Check an actor kneeling (this is the kneeling verification rule):
	If the actor is currently kneeling, say "[If the player is the actor][We][else][Actor][end if] [are] already kneeling." (A) instead;
	If the actor is on a piece of furniture (called location) and location blocks kneeling: 
		[Since we can't kneel where we are, we interpret this as a request to exit first.]
		Say "(first getting off [location])[command clarification break]" (B);
		Try the actor getting off the location;

Carry out an actor kneeling (this is the basic implicit kneeling rule):
	Now the current posture of the actor is kneeling;

Report an actor kneeling (this is the report implicit kneeling rule):
	If the actor is the player, say "[If the player is the actor][We][else][Actor][end if] [kneel]." (A);

Part 3.5 - Lie Down

[laying down is more complex than it might first appear, as one might be either face up (formally called supine) or face down (formally called prone). Thus, we have 5 actions to support laying down: Lie (on) which gives us the supine position, drop down (on) which gives us the prone position, and turn around to swap between them.]

Chapter - Lie on (supine)

Laying on is an action applying to one touchable thing.
The specification of the laying on action is "Laying on is the act of changing both one's posture (to supine) and location. See 'laying' for the action of just changing one's posture (to supine), or 'enter' for the act of just changing location. 
See also the actions 'drop down' and 'drop down on' which change posture to prone (another form of laying down) as well as 'turn around'.
By default, laying on will only accept a piece of furniture as a valid location, but 'lay/lie on floor/ground' will redirect to lay (getting off if necessary) by the use of the supply missing noun rule."
Understand "lay on [something]" and "lie on [something]" as laying on.

Check an actor laying on something (this is the laying on verification rule):
	If the actor is currently laying supine on the noun, say "[If the player is the actor][We][else][Actor][end if] [are] already laying down on [noun]." (A) instead;
	If the noun is not a piece of furniture (called F):
		Say "[If the player is the actor][We][else][Actor][end if] [cannot] [lie] on [noun]." (B) instead;
	Else:
		If F blocks laying supine, say "[If the player is the actor][We][else][Actor][end if] [cannot] [lie] on [noun]." (C) instead;
		If the actor is on something that is not F:
			Say "(first getting off [F])[command clarification break]" (D);
			Try the actor getting off F;

Carry out an actor laying on a piece of furniture (called F) (this is the basic laying rule):
	Now the current posture of the actor is laying supine;
	If the actor is not on F, try the actor entering F;

Report an actor laying on something (this is the report laying on rule) :
	If the actor is the player, say "[If the player is the actor][We][else][Actor][end if] [lie] on [noun]." (A);

Chapter - Drop Down on (prone)

Dropping down on is an action applying to one touchable thing.
The specification of the dropping down on action is "Dropping down on is the act of changing both one's posture (to prone) and location. See 'dropping down' for the action of just changing one's posture (to prone), or 'enter' for the act of just changing location. 
See also the actions 'lie' and 'lie on' which change posture to supine (another form of laying down) as well as 'turn around'.
By default, dropping down on will only accept a piece of furniture as a valid location, but 'dropping down on floor/ground' will redirect to dropping down (getting off if necessary) by the use of the supply missing noun rule."
Understand "drop down on [something]" and "lie facedown on [something]" as dropping down on.

Check an actor dropping down on something (this is the dropping down on verification rule):
	If the actor is currently laying prone on the noun, say "[If the player is the actor][We][else][Actor][end if] [are] already dropped down on [noun]." (A) instead;
	If the noun is not a piece of furniture (called F):
		Say "[If the player is the actor][We][else][Actor][end if] [cannot] [drop] down on [noun]." (B) instead;
	Else:
		If F blocks laying prone, say "[If the player is the actor][We][else][Actor][end if] [cannot] [drop] down on [noun]." (C) instead;
		If the actor is on something that is not F:
			Say "(first getting off [F])[command clarification break]" (D);
			Try the actor getting off F;

Carry out an actor dropping down on a piece of furniture (called F) (this is the basic dropping down rule):
	Now the current posture of the actor is laying prone;
	If the actor is not on F, try the actor entering F;

Report an actor dropping down on something (this is the report dropping down on rule) :
	If the actor is the player, say "[If the player is the actor][We][else][Actor][end if] [drop] down on [noun]." (A);

Chapter - Implicit Lie Down (supine)

Laying is an action applying to nothing.
The specification of the laying action is "Laying is the act of changing one's posture (to supine) while remaining in the same location. See 'laying on' for the action of changing both posture and location.
See also the actions 'drop down' and 'drop down on' which change posture to prone (another form of laying down) as well as 'turn around'."
Understand "lie down" and "lay down" as laying.
Understand "lay on ground", "lay on floor", "lie on ground" and "lie on floor" as laying.

Check an actor laying (this is the laying verification rule):
	If the actor is currently laying supine, say "[If the player is the actor][We][else][Actor][end if] [are] already laying down." (A) instead;
	If the actor is on a piece of furniture (called location) and location blocks laying supine: 
		[Since we can't lie where we are, we interpret this as a request to exit first.]
		Say "(first getting off [location])[command clarification break]" (B);
		Try the actor getting off the location;

Carry out an actor laying (this is the basic implicit laying rule):
	Now the current posture of the actor is laying supine;

Report an actor laying (this is the report implicit laying rule):
	If the actor is the player, say "[If the player is the actor][We][else][Actor][end if] [lie] down." (A);

Chapter - Implicit Drop Down (supine)

Dropping down is an action applying to nothing.
The specification of the dropping down action is "Dropping down is the act of changing one's posture (to prone) while remaining in the same location. See 'dropping down on' for the action of changing both posture and location.
See also the actions 'lie' and 'lie on' which change posture to supine (another form of laying down) as well as 'turn around'."
Understand "lie facedown" and "drop down" as dropping down.
Understand "drop down on ground" and "drop down on floor" as dropping down.

Check an actor dropping down (this is the dropping down verification rule):
	If the actor is currently laying prone, say "[If the player is the actor][We][else][Actor][end if] [are] already dropped down down." (A) instead;
	If the actor is on a piece of furniture (called location) and location blocks laying prone: 
		[Since we can't lie where we are, we interpret this as a request to exit first.]
		Say "(first getting off [location])[command clarification break]" (B);
		Try the actor getting off the location;

Carry out an actor dropping down (this is the basic implicit dropping down rule):
	Now the current posture of the actor is laying prone;

Report an actor dropping down (this is the report implicit dropping down rule):
	If the actor is the player, say "[If the player is the actor][We][else][Actor][end if] [drop] down." (A);

Chapter - Turn Around (supine <-> prone)

Turning around is an action applying to nothing.
The specification of the turning around action is "Turning around is the act of changing one's posture between prone and supine, and should not be confused with the 'turning' action, which turns a dial.
See also the 'lie (on)' and 'drop down (on)' actions."
Understand "turn around" as turning around.

[TODO: Expand to allow turn to turn another person.]

Check an actor turning around (this is the turning around verification rule):
	If the actor is not currently laying prone and the actor is not currently laying supine, say "[If the player is the actor][We][else][Actor][end if] [are not] laying down." (A) instead;
	If the actor is on a piece of furniture (called location):
		If the actor is currently laying supine and location blocks laying prone, say "[If the player is the actor][We][else][Actor][end if] [cannot] turn around on [location]." (B);
		If the actor is currently laying prone and location blocks laying supine, say "[If the player is the actor][We][else][Actor][end if] [cannot] turn around on [location]." (C);

Carry out an actor turning around (this is the basic turning around rule):
	If the actor is currently laying prone:
		Now the current posture of the actor is laying supine;
	Else if the actor is currently laying supine:
		Now the current posture of the actor is laying prone;

Report an actor turning around (this is the report turning around rule):
	If the actor is the player, say "[If the player is the actor][We][else][Actor][end if] [turn] around." (A);

Part 3.6 - Bending

[Explicit bending is the act of bending oneself over something. While this might not be thought of as entering the thing we are bending over, for simplicity's sake it's handled the same way.
Implicit bending is different though; as it's rare for the command to mean 'bend over the furniture you are occupying'.]

Chapter - Bending Over

Bending over is an action applying to one touchable thing.
The specification of the bending over action is "Bending over is the act of changing one's posture and location.
See 'bending' for the action changing posture while remaining in the same location."
Understand "bend over [something]" as bending over.
To bend is a verb.

Check an actor bending over something (this is the bending over verification rule):
	If the actor is currently bending over on the noun, say "[If the player is the actor][We][else][Actor][end if] [are] already bending over [noun]." (A) instead;
	If the noun is not a piece of furniture (called F):
		Say "[If the player is the actor][We][else][Actor][end if] [cannot] [bend] over [noun]." (B) instead;
	Else:
		If F blocks bending over, say "[If the player is the actor][We][else][Actor][end if] [cannot] [bend] over [noun]." (C) instead;
		If the actor is on something that is not F:
			Say "(first getting off [F])[command clarification break]" (D);
			Try the actor getting off F;

Carry out an actor bending over a piece of furniture (called F) (this is the basic bending over rule):
	Now the current posture of the actor is bending over;
	If the actor is not on F, try the actor entering F;

Report an actor bending over (this is the report implicit bending over rule):
	If the actor is the player, say "[If the player is the actor][We][else][Actor][end if] [bend] over [noun]." (A);

Chapter - Implicit Bending

Bending is an action applying to nothing.
The specification of the bending over action is "Bending is the act of changing one's posture while remaining in the same location. See 'bending over it' for the action of changing both posture and location."
Understand "bend over" as bending.

Check an actor bending (this is the bending verification rule):
	If the actor is currently bending over, say "[If the player is the actor][We][else][Actor][end if] [are] already bent over." (A) instead;
	If the actor is on a piece of furniture (called location) and location blocks bending over: 
		[Since we can't bend where we are, we interpret this as a request to exit first.]
		Say "(first getting off [location])[command clarification break]" (B);
		Try the actor getting off the location;

Carry out an actor bending (this is the basic implicit bending rule):
	Now the current posture of the actor is bending over;

Report an actor bending (this is the report implicit bending rule):
	If the actor is the player, say "[If the player is the actor][We][else][Actor][end if] [bend] over." (A);

[Dancing is postponed.

Part 3.7 - Dancing

Chapter - Actions (for use without Erotic Story Actions by Fictitious Frode)

[There are two dance actions, one for solo and for pair.]

Dancing is an action applying to nothing.
The specification of the dancing action is "Dancing is the act of dancing alone. See 'dancing with' for dancing with a partner.
On it's own, this action doesn't do anything other than print a basic 'Soandso is dancing' response, but can be used for authors to build upon."
Understand "dance" as dancing.
To dance is a verb.

Report an actor dancing (This is the default report dancing rule):
	Say "[If the player is the actor][We][else][Actor][end if] [dance]." (A);

Dancing with is an action applying to one touchable thing.
The specification of the dancing action is "Dancing is the act of dancing with a partner. See 'dancing' for dancing alone.
On it's own, this action just checks that the partner is a person that can be touched, and prints a basic 'Soandso is dancing with partner' response."
Understand "Dance with [someone]" as dancing with.

Report an actor dancing with (This is the default report dancing with rule):
	Say "[If the player is the actor][We][else][Actor][end if] [dance] with [noun]." (A);

Chapter - Dancing

Check an actor dancing (this is the dancing verification rule):
	If the actor is currently dancing, say "[If the player is the actor][We][else][Actor][end if] [are] already dancing." (A) instead;
	If the actor is on a piece of furniture (called location) and location blocks dancing: 
		[Since we can't dance where we are, we interpret this as a request to exit first.]
		Say "(first getting off [location])[command clarification break]" (B);
		Try the actor getting off the location;

Carry out an actor dancing (this is the basic solo dancing rule):
	Now the current posture of the actor is dancing;

Chapter - Dancing With

Check an actor dancing with someone (called partner) (this is the dancing with verification rule):
	If the actor is currently dancing and partner is currently dancing, say "[If the player is the actor]We[else][They][end if] [are] already dancing." (A) instead;
	If the actor is on a piece of furniture (called location) and location blocks dancing: 
		[Since we can't dance where we are, we interpret this as a request to exit first.]
		Say "(first getting off [location])[command clarification break]" (B);
		Try the actor getting off the location;
	If the partner is on a piece of furniture (called location) and location blocks dancing: 
		[Same for the partner]
		Say "([partner] first getting off [location])[command clarification break]" (C);
		Try the partner getting off the location;

Carry out an actor dancing with someone (called partner) (this is the basic pair dancing rule):
	Now the current posture of the actor is dancing;
	Now the Current posture of the partner is dancing;
]

Posturing ends here.

---- DOCUMENTATION ----

Chapter - Using this Extension

This extensions enables postures, actions for changing posture, and furniture on which to posture. These are detailed below.

Note that extension does not automatically print out what posture a person has, this is left for the story author to control.

Section - Postures and Actions

These are the postures provided by the framework:

	Standing (default)
	Dancing (Postponed)
	Sitting
	Kneeling
	Bending (over)
	Laying prone (face-down)
	Laying supine (face-up)
	Dancing

Each of the postures listed above has two actions associated with them; an implicit action which just changes the posture (if possible), and an explicit posture that has the actor assuming the posture on a targeted piece of furniture. There's also the "turn (around)" command to switch between laying prone and supine.

Note, the dancing and dancing with actions are fully compatible with Erotic Story Actions, without requiring it's presence.

Section - Furniture

A piece if furniture is a a supporter that is always enterable, and has some properties to assist with postures and containing actors.

	A preferred posture: This posture is assumed by someone 'entering'.
	An occupant limit: How many people can be on the furniture at the same time
	Compatible postures: A list of postures that the piece of furniture supports.

The following pieces of furniture is provided (with default values):

	Bed: Supports 4 people, sitting, kneeling, bending, laying supine (default) or laying prone.
	Chair: Supports 1 person, sitting (default) or bending.
	Sofa (Couch): Supports 3 people, sitting (default), bending, laying supine or laying prone.
	Table: Supports 2 people sitting, bending, laying supine (default) or laying prone.
	Desk: Supports 1 person, sitting (default), bending, laying supine or laying prone.

Section - Custom Furniture

Creating custom furniture as needed is easy, just take the template of a chair below and rename chair to your custom type, and change the default values.

*:
	A chair is a kind of piece of furniture.
	The occupant limit of a chair is usually 1.
	The preferred posture  of a chair is usually sitting.
	The description of a chair is usually "It's chair, made for sitting on."
	The compatible postures of a chair is usually {sitting, bending}.

Chapter - Technical Notes

Postures has the potential to make AIF much more immersive, but can also totally break the immersion if not done properly. Be sure to include proper checks for postures on all actions! If nothing else, consider adapting the following catch all:

*:
	Before an actor doing something:
		If Current posture of the actor is not standing:
			Say "(first standing)[command clarification break]";
			Try the actor standing;
		If Current posture of the actor is not standing:
			Say "(stopping)";
			Stop the action;

(Note that this is too restrictive again, basically stopping postures from having any effects at all)

Section - Integration with Other Parts of the Framework

In the future, access to body parts for erotic actions will depend on the Current posture of the people, but for now this is left to the story author to determine.

Section - Version History

Section - Contact Info

The author of the framework can be reached in the following ways:

	* Mail: fictitious.frode@gmail.com
	* Blog: https://informedaif.wordpress.com/ is a blog dedicated to writing AIF with Inform 7, and is the official host of the framework. It contains both dicussions around AIF and tutorials on both Inform in general and this framework in particular.
	* Reddit: https://www.reddit.com/r/AIFCentral/ is the subreddit for the AIF community, and the author checks this regularly.

Feedback of all varieties is welcome, but constructive criticism and discussion is the most appreciated, along with reports of bugs and other issues. For support I would appreciate using public communication, so that other may learn from the request as well.