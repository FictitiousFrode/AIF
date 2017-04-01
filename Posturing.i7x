Version 2/170401 of Posturing by Fictitious Frode begins here.

Volume 0 - New Verbs

[These are the new verbs the extension uses; We put this in it's own volume in case anyone needs to rewrite it for compatibility:]

To stand is a verb.
To sit is a verb.
To kneel is a verb.
To bend is a verb.
To lie is a verb.
To drop is a verb.
To turn is a verb.

Volume 1 - Posturing

Book 1.1 - Concepts

Part 1.1.1 - Postures

Chapter 1.1.1a - Kind of Value

A posture is a kind of value. The postures are defined by the Table of Postures.
The specification of posture is "A posture is the position or bearing of a person. It can as an example be used to distinguish between sitting, standing or lying down."

Table of Postures
Posture	describe posture (text)	assume posture (text)
standing	"standing"	"[stand] up"
sitting	"sitting"	"[sit] down"
kneeling	"kneeling"	"[kneel]"
bending	"bending"	"[bend]"
prone	"laying prone"	"[lie] prone"
supine	"supine"	"[lie] supine"

To say describe posture of (P - a posture):
	Repeat with N running from 1 to the number of rows in the Table of Postures:
		Choose row N in the Table of Postures;
		If P is the Posture entry, say the describe posture entry;

To say assume posture of (P - a posture):
	Repeat with N running from 1 to the number of rows in the Table of Postures:
		Choose row N in the Table of Postures;
		If P is the Posture entry, say the assume posture entry;

Chapter 1.1.1b - Property Integrations
		
A person has a posture called the current posture.
A supporter has a list of postures called compatible postures. The compatible postures of a supporter is usually {standing}.
A container has a list of postures called compatible postures. The compatible postures of a container is usually {standing}.
A supporter has a number called the occupant limit. The occupant limit of a supporter is usually 1.
A container has a number called the occupant limit. The occupant limit of a container is usually 1.

Chapter 1.1.1c - Checking for Posture

[Checks if a given individual is in a given posture]
To decide whether (individual - a person) is posing (position - a posture):
	If the current posture of the individual is the position, decide yes;
	Else decide No;

[Checks if a given individual is in a given posture for a given location]
To decide whether (individual - a person) is posing (position - a posture) on (location - an object):
	If the current posture of the individual is the position and the individual is enclosed by the location, decide yes;
	Else decide no;

[Checks if *any* person is in a given posture for a given location]
To decide whether someone is posing (position - a posture) on (location - an object):
	If the location is enterable:
		Repeat with individual running through the list of persons enclosed by the location:
			If the current posture of the individual is the position, decide yes;
	Decide no;

[Determines if a location allows a posture]
To decide whether (location - an object) allows (position - a posture) posture:
	If location provides the property compatible postures:
		If position is listed in the compatible postures of location, decide yes;
	Decide no;

[Negation:]
To decide whether (location - an object) blocks (position - a posture) posture:
	If location provides the property compatible postures:
		If position is listed in the compatible postures of location, decide no;
	Decide yes;

[Determines if a location is filled to it's occupant limit]
To decide whether (location - an object) has vacancy:
	If location provides the property occupant limit:
		If the number of people enclosed by location is not less than the occupant limit of location, decide no;
	Decide yes;
	
Book 1.2 - New Actions

[As most of the logic for assuming a posture is shared between the postures, we use the posturing action to apply the logic and actions for each posture to redirect.]

Part 1.2.1 - Posturing

[Status: Complete
This actions is responsible for changing the posture of an actor. This includes checking that it's actually a change, and that the location of the actor can support the posture.]

Posturing is an action applying to one posture.
The specification of the posturing action is "Posturing is the action that alters the posture of an actor. It ensures that the location of the actor can support the new posture, and that the new posture is a change from the current. There are several other actions that redirect to this one."

Chapter 1.2.1a - Check

Check an actor posturing (this is the changing posture rule):
	Let P be the posture understood;
	If the current posture of the actor is P:
		If the actor is the player:
			Say "[We] [are] already [describe posture of P]." (A);
		Else if the player can see the actor and the action is not silent:
			Say "[The actor] [are] already [describe posture of P]." (B);
		Stop the action;

Check an actor posturing (this is the verify posture rule):
	Let P be the posture understood;
	If the holder of the actor is not a room:
		If the holder of the actor allows P posture, continue the action;
		If the holder of the actor is a container:
			If the actor is the player:
				Say "[We] [can't] [assume posture of P] in [the holder of the actor]." (A);
			Else if the player can see the actor and the action is not silent:
				Say "[The actor] [can't] [assume posture of P] in [the holder of the actor]." (B);
		Else:
			If the actor is the player:
				Say "[We] [can't] [assume posture of P] on [the holder of the actor]." (C);
			Else if the player can see the actor and the action is not silent:
				Say "[The actor] [can't] [assume posture of P] on [the holder of the actor]." (D);
		Stop the action;

Chapter 1.2.1b - Carry Out

Carry out an actor posturing (this is the assume posture rule):
	Now the current posture of the actor is the posture understood;

Chapter 1.2.1c - Report

Report an actor posturing (this is the report posturing rule):
	Let P be the current posture of the actor;
	If the holder of the actor is a room:
		If the actor is the player:
			Say "[We] [assume posture of P]." (A);
		Else if the player can see the actor and the action is not silent:
			Say "[The actor] [assume posture of P]." (B);
	Else if the holder of the actor is a container:
		If the actor is the player:
			Say "[We] [assume posture of P] in [the holder of the actor]." (C);
		Else if the player can see the actor and the action is not silent:
			Say "[The actor] [assume posture of P] in [the holder of the actor]." (D);
	Else:
		If the actor is the player:
			Say "[We] [assume posture of P] on [the holder of the actor]." (E);
		Else if the player can see the actor and the action is not silent:
			Say "[The actor] [assume posture of P] on [the holder of the actor]." (F);

Part 1.2.2 - Stand In/On

[Status: Complete
We need two actions: one for changing to the posture and one for assuming the posture on/in something.
Standing can also serve as a redirect to exiting/getting off.]

Standing is an action applying to nothing.
Standing on is an action applying to one thing.

Chapter 1.2.2a - Understanding

Understand the command "stand" as something new.
Understand "stand" as standing.
Understand "stand on [a supporter]" as standing on.
Understand "stand in [a container]" as standing on.
Understand "stand on/in/-- [something]" as standing on.

Chapter 1.2.2b - Carry Out

[Redirect to assuming the standing posture]
Carry out an actor standing (this is the implicit standing redirect rule):
	If the holder of the actor is a supporter (called location) and location blocks standing posture:
		Say "(getting off [the location])[command clarification break]";
		Try the actor getting off location instead;
	If the holder of the actor is a container (called location) and location blocks standing posture:
		Say "(exiting [the location])[command clarification break]";
		Try the actor exiting instead;
	Try the actor posturing standing;

[Try to enter the noun, then redirect to assume the standing posture]
Carry out an actor standing on (this is the explicit standing redirect rule):
	If the holder of the actor is not the noun, silently try the actor entering the noun;
	If the holder of the actor is the noun:
		Unless the current posture of the actor is standing, try the actor posturing standing;
		Else follow the report posturing rules;

Part 1.2.3 - Sit In/On/At

[Status: Complete
We need two actions: one for changing to the posture and one for assuming the posture on/in something.]

Sitting is an action applying to nothing.
Sitting on is an action applying to one thing.

Chapter 1.2.3a - Understanding

Understand the command "sit" as something new.
Understand "sit" as sitting.
Understand "sit on [a supporter]" as sitting on.
Understand "sit in [a container]" as sitting on.
Understand "sit on/in/at/-- [something]" as sitting on.

Chapter 1.2.3b - Carry Out

[Redirect to assuming the sitting posture]
Carry out an actor sitting (this is the implicit sitting redirect rule):
	Try the actor posturing sitting;

[Try to enter the noun, then redirect to assume the sitting posture]
Carry out an actor sitting on (this is the explicit sitting redirect rule):
	If the holder of the actor is not the noun, silently try the actor entering the noun;
	If the holder of the actor is the noun:
		Unless the current posture of the actor is sitting, try the actor posturing sitting;
		Else follow the report posturing rules;

Part 1.2.4 - Kneel Over/On/In

[Status: Complete
We need two actions: one for changing to the posture and one for assuming the posture on/in something.]

Kneeling is an action applying to nothing.
Kneeling on is an action applying to one thing.

Chapter 1.2.4a - Understanding

Understand "kneel" as kneeling.
Understand "kneel on/over [a supporter]" as kneeling on.
Understand "kneel in [a container]" as kneeling on.
Understand "kneel on/in/over/-- [something]" as kneeling on.

Chapter 1.2.4b - Carry Out

[Redirect to assuming the kneeling posture]
Carry out an actor kneeling (this is the implicit kneeling redirect rule):
	Try the actor posturing kneeling;

[Try to enter the noun, then redirect to assume the kneeling posture]
Carry out an actor kneeling on (this is the explicit kneeling redirect rule):
	If the holder of the actor is not the noun, silently try the actor entering the noun;
	If the holder of the actor is the noun:
		Unless the current posture of the actor is kneeling, try the actor posturing kneeling;
		Else follow the report posturing rules;

Part 1.2.5 - Bend Over/On/In

[Status: Complete
We need two actions: one for changing to the posture and one for assuming the posture on/in something.]

Bending is an action applying to nothing.
Bending on is an action applying to one thing.

Chapter 1.2.5a - Understanding

Understand "bend" as bending.
Understand "bend on/over [a supporter]" as bending on.
Understand "bend in [a container]" as bending on.
Understand "bend on/in/over/-- [something]" as bending on.

Chapter 1.2.5b - Carry Out

[Redirect to assuming the bending posture]
Carry out an actor bending (this is the implicit bending redirect rule):
	Try the actor posturing bending;

[Try to enter the noun, then redirect to assume the bending posture]
Carry out an actor bending on (this is the explicit bending redirect rule):
	If the holder of the actor is not the noun, silently try the actor entering the noun;
	If the holder of the actor is the noun:
		Unless the current posture of the actor is bending, try the actor posturing bending;
		Else follow the report posturing rules;

Part 1.2.6 - Lie Down On/In (Supine)

[Status: Complete
We need two actions: one for changing to the posture and one for assuming the posture on/in something.]

Lying down is an action applying to nothing.
Lying down on is an action applying to one thing.

Chapter 1.2.6a - Understanding

Understand the command "lie" as something new.
Understand "lie down/--" as lying down.
Understand "lay down/--" as lying down.
Understand "lie down/-- on [a supporter]" as lying down on.
Understand "lay down/-- on [a supporter]" as lying down on.
Understand "lie down/-- in [a container]" as lying down on.
Understand "lay down/-- in [a container]" as lying down on.
Understand "lie down/-- on/in/-- [something]" as lying down on.
Understand "lay down/-- on/in/-- [something]" as lying down on.

Chapter 1.2.6b - Carry Out

[Redirect to assuming the supine posture]
Carry out an actor lying down (this is the implicit lying down redirect rule):
	Try the actor posturing supine;

[Try to enter the noun, then redirect to assume the supine posture]
Carry out an actor lying down on (this is the explicit lying down redirect rule):
	If the holder of the actor is not the noun, silently try the actor entering the noun;
	If the holder of the actor is the noun:
		Unless the current posture of the actor is supine, try the actor posturing supine;
		Else follow the report posturing rules;

Part 1.2.7 - Drop Down On/In (Prone)

[Status: Complete
We need two actions: one for changing to the posture and one for assuming the posture on/in something.]

Dropping down is an action applying to nothing.
Dropping down on is an action applying to one thing.

Chapter 1.2.7a - Understanding

Understand "drop down" as dropping down.
Understand "drop down on [a supporter]" as dropping down on.
Understand "drop down in [a container]" as dropping down on.
Understand "drop down on/in/-- [something]" as dropping down on.

Chapter 1.2.7b - Carry Out

[Redirect to assuming the prone posture]
Carry out an actor dropping down (this is the implicit dropping down redirect rule):
	Try the actor posturing prone;

[Try to enter the noun, then redirect to assume the prone posture]
Carry out an actor dropping down on (this is the explicit dropping down redirect rule):
	If the holder of the actor is not the noun, silently try the actor entering the noun;
	If the holder of the actor is the noun:
		Unless the current posture of the actor is prone, try the actor posturing prone;
		Else follow the report posturing rules;

Part 1.2.8 - Turn Around

[Status: Complete
Turning around tries to change between the two lying down postures.]

Turning around is an action applying to nothing.

Chapter 1.2.8a - Understanding

Understand "turn around/--" as turning around.

Chapter 1.2.8b - Check

[Ensure that the actor is actually lying down]
Check an actor turning around (this is the must lie down to turn around rule):
	Unless the current posture of the actor is supine or the current posture of the actor is prone:
		If the actor is the player:
			Say "[We] [have] to be lying down to turn around." (A);
		Else if the player can see the actor and the action is not silent:
			Say "[The actor] [have] to be lying down to turn around." (B);
		Stop the action;

Chapter 1.2.8c - Carry Out

[Redirect to assuming the prone or supine posture]
Carry out an actor turning around (this is the turning around redirect rule):
	If the current posture of the actor is supine, silently try the actor posturing prone;
	Else silently try the actor posturing supine;

Chapter 1.2.8c - Report

Report an actor turning around (this is the report turning around rule):
	Let P be the current posture of the actor;
	If the holder of the actor is a room:
		If the actor is the player:
			Say "[We] [turn] around and are now [assume posture of P]." (A);
		Else if the player can see the actor and the action is not silent:
			Say "[The actor] [turn] around and are now [assume posture of P]." (B);
	Else if the holder of the actor is a container:
		If the actor is the player:
			Say "[We] [turn] around and are now [assume posture of P] in [the holder of the actor]." (C);
		Else if the player can see the actor and the action is not silent:
			Say "[The actor] [turn] around and are now [assume posture of P] in [the holder of the actor]." (D);
	Else:
		If the actor is the player:
			Say "[We] [turn] around and are now [assume posture of P] on [the holder of the actor]." (E);
		Else if the player can see the actor and the action is not silent:
			Say "[The actor] [turn] around and are now [assume posture of P] on [the holder of the actor]." (F);

Book 1.3 - Action Integration

Part 1.3.1 - Default Postures

[Status: Complete
After entering/exiting something, make the actor conform to the default posture of the new location if needed.]

Carry out an actor exiting (this is the default posture rule):
	Let location be the holder of the actor;
	Let P be standing;
	If location provides the property compatible postures:
		If the compatible postures of location is not empty, let P be entry 1 of the compatible postures of the location;
	Now the current posture of the actor is P;

The default posture rule is listed after the standard exiting rule in the carry out exiting rulebook.
The default posture rule is listed after the standard getting off rule in the carry out getting off rulebook.
The default posture rule is listed after the standard entering rule in the carry out entering rulebook.

Part 1.3.2 - Occupancy Check

[Status: Complete
Before entering/exiting something, make sure there is room for the actor.]

Check an actor entering (this is the entering occupancy control rule):
	Unless the noun has vacancy:
		If the actor is the player:
			Say "There [are] no room for [us] on [the noun]." (A);
		Else if the player can see the actor and the action is not silent:
			Say "There [regarding the actor][are] no room for [the actor] on [the noun]." (B);
		Stop the action;

Check an actor exiting (this is the exiting occupancy control rule):
	Let the former exterior be the not-counting-parts holder of the container exited from;
	Unless the former exterior has vacancy:
		If the actor is the player:
			Say "There [are] no room for [us] on [the noun]." (A);
		Else if the player can see the actor and the action is not silent:
			Say "There [regarding the actor][are] no room for [the actor] on [the noun]." (B);
		Stop the action;

Check an actor getting off (this is the getting off occupancy control rule):
	Let the former exterior be the not-counting-parts holder of the noun;
	Unless the former exterior has vacancy:
		If the actor is the player:
			Say "There [are] no room for [us] on [the noun]." (A);
		Else if the player can see the actor and the action is not silent:
			Say "There [regarding the actor][are] no room for [the actor] on [the noun]." (B);
		Stop the action;

Part 1.3.3 - Travelling Posture

[Status: Complete
Before going somewhere, make sure the actor is standing.
TODO: This could be expanded to allow movement in other postures.]

The control traveling posture rule is listed after the stand up before going rule in the check going rulebook.
Check an actor going somewhere (this is the control traveling posture rule):
	Unless the current posture of the actor is standing:
		If the actor is the player:
			Say "(first standing up)[command clarification break]" (A);
		Else if the player can see the actor and the action is not silent:
			Say "([the actor] first standing up)[command clarification break]" (B);
		Silently try the actor posturing standing;
		If the current posture of the actor is not standing, stop the action.

Part 1.3.4 - Describing Postures

[TODO
Rule for writing a paragraph about someone (called target):
	say "[The target] is [describe posture of current posture of target] here."

	Rule for writing a paragraph about someone (called target) on a supporter (called location):
	Say "[The target] is [describe posture of current posture of target] on [the location]."

Rule for writing a paragraph about someone (called target) in a container (called location):
	say "[The target] is [describe posture of current posture of target] in [the location]."


Rule for writing a paragraph about someone (called target):
	say "[The target] is [posture] [if the holder of the target is the location]nearby[otherwise][in-on the holder of the target][end if]."

Rule for writing a paragraph about something which encloses an unmentioned person (called target):
	carry out the writing a paragraph about activity with the target instead.
]

Book 1.4 - Templates

Part 1.4.1 - Furniture Catalog

Chapter 1.4.1a - Chair

A chair is a kind of supporter. A chair is usually enterable.
The occupant limit of a chair is usually 1. The compatible postures of a chair is usually {sitting, bending}.
The specification of a chair is "Chairs are made for sitting on, but also support bending (over). It usually has room for one person."

Chapter 1.4.1b - Table

A table is a kind of supporter. A table is usually enterable.
The occupant limit of a table is usually 2. The compatible postures of a table is usually {supine, prone, sitting, bending}.
The specification of a table is "Tables are made for laying (supine) on, but also support laying prone, sitting on and bending over. It usually has room for two persons."

Chapter 1.4.1c - Desk

A desk is a kind of supporter. A desk is usually enterable.
The occupant limit of a desk is usually 1. The compatible postures of a desk is usually {sitting, bending, supine, prone}.
The specification of a desk is "Desks are made for sitting on/at, but also support laying prone/supine and bending over. It usually has room for one person."

Chapter 1.4.1d - Sofa

A sofa is a kind of supporter. A sofa is usually enterable.
The occupant limit of a sofa is usually 3. The compatible postures of a sofa is usually {sitting, bending, supine, prone}.
The specification of a sofa is "Sofas are made for sittin on, but also support laying prone/supine and bending over. It usually has room for three persons."
Understand "couch" as sofa.

Chapter 1.4.1e - Bed

A bed is a kind of supporter. A bed is usually enterable.
The occupant limit of a bed is usually 3. The compatible postures of a bed is usually {supine, prone, sitting, kneeling}.
The specification of a bed is "Beds are made for laying (supine) on, but also support laying prone, sitting and kneeling on. It usually has room for three persons."

Chapter 1.4.1f - Cabinet

A cabinet is a kind of container. A cabinet is usually enterable. A cabinet is usually openable.
The occupant limit of a cabinet is usually 2. The compatible postures of a cabinet is usually {standing, sitting, kneeling}.
The specification of a cabinet is "Cabinets are usually large enough for two people to stand in, but also support sitting and kneeling."

Posturing ends here.

---- DOCUMENTATION ----
	
Chapter 1 - Using this Extension

To use this extension, you need to download and install it (which you probably have if you're reading this) and include it in your story:

*:
	Include Posturing by Fictitious Frode.

By including this extension you will allow the player (and other actors) to assume postures.
The included postures are 'standing' (default), 'sitting', 'bending', 'kneeling, 'prone' (laying face-down) and 'supine' (laying face-up).
Also included are the relevant actions to change into these postures, as well as 'turning around' to change between the two laying down postures.
It's also possible for actors to posture on and in certain things.
While the first version of this extension used a special kind of supporter to represent this furniture, this version allows posturing on anything that is enterable and has the 'compatible postures' property.

Section 1.1 - Documentation Overview

The documentation will cover the following subjects:

	Chapter 1: A short overview of the extension.
	Chapter 2: Techniques and guidelines on how to use postures.
	Chapter 3: A technical reference for everything added or changed with this extension.

The following examples are included:

	A: Garden Lounge - 
	B: Customization: Crawling - How to create new postures

Section 1.2 - Version History

2015-01-26: AIF Framework Extension (Release 1)

	Inflexible posture model based on furniture

2017-04-01: Beta-2 (Release 2)

	Complete re-coding, keeping the same postures but using centralized control with posture-specific redirects.
	Moved from kind-based furniture to property-based checks for greater flexibility.

Section 1.3 - Contact Info

The author of this extension can be reached in the following ways:

	Mail: fictitious.frode@gmail.com
	Blog: https://informedaif.wordpress.com/ is a blog dedicated to writing AIF with Inform 7, and is the official host of the extension. It contains both dicussions around AIF and tutorials on both Inform in general and this extension in particular.
	Reddit: https://www.reddit.com/r/AIFCentral/ is the subreddit for the AIF community, and the author checks this regularly.
	GitHub: https://github.com/FictitiousFrode/AIF Contains the latest version of the extension, possibly including functionality that hasn't been released yet.

Feedback of all varieties is welcome, but constructive criticism and discussion is the most appreciated, along with reports of bugs and other issues.
For support I would appreciate using public communication, so that other may learn from the request as well.

Section 1.4 - Acknowledgments

This extension probably wouldn't have been remade if it wasn't for Mister Flibble's Photoshoot which showed the power of properly implemented postures.
The deck chair from the examples is based on his creation.

Example 394 - Slouching provided much of the inspiration for this implementation.
The relation-based approch is replaced with lists, and everything is implemented in a more robust and customizable fashion.

Chapter 2 - Posturing

Postures provide an option for further depth in how actors are placed in the world model.
This brings both new opportunity for immersion, but also requires the author to consider more options.
This chapter will cover how postures can be used in a story, and how to create your own custom postures and furniture.

Section 2.1 - Postures and Actions

The extension comes with the most common postures defined, including actions for changing to these postures.
Changes to a persons posture is generally performed by the posturing action, except for some cases related to entering and exiting locations.
The following is a list of the postures made available by this extension, and the commands the player can use to reach them:

	Standing: stand (on/in something)
	Sitting: sit (on/in/at something)
	Kneeling: kneel (on/in/over something)
	Bending: bend (on/in/over something)
	Supine: lie/lay (down) (on/in something), or turn (around) when already prone.
	Prone: drop down (on/in something), or turn (around) when already supine.

Postures aren't limited to just being in a room however.
Through Inform's standard rules supporters and containers can be entered, and now also has a property stating which postures are supported on them.
By using the compatible postures (a list of postures), any enterable object in Inform's world model can now control which postures they allow.
The first entry in the list is assumed to be the preferred posture, which is taken when a person enters without a valid posture.
In order to control how many people there is room for, the property occupant limit is also available.
For convenience, the following ready-to-use furniture templates are provided:

	Chair (supporter): sitting and bending for 1 person
	Table (supporter): supine, prone, sitting and bending for 2 persons
	Desk (supporter): sitting, bending, supine and prone for 1 person
	Sofa (supporter): sitting, bending, supine and prone for 3 persons
	Bed (supporter): supine, prone, sitting and kneeling for 3 persons
	Cabinet (openable container): standing, sitting and kneeling for 2 persons

Section 2.2 - Integrating Postures

For postures to have full effect it's important they are integrated with the other actions that are relevant for the story.
This can be as simple as descriptions taking the posture into account, or more comprehensive where certain postures prevent actions from taking place.
An example of the latter is something that is out of reach unless the player is standing on something.

While most of this integration is left up to the author to decide on, some of the standard actions are integrated:

	Entering: The entering occupancy control rule ensures that the occupancy limit is observed, and the default posture rule makes an actor conform to the default posture of what is entered.
	Exiting: The exiting occupancy control rule ensures that the occupancy limit is observed, and the default posture rule makes an actor conform to the default posture of what is exited.
	Getting off: The getting off occupancy control rule ensures that the occupancy limit is observed, and the default posture rule makes an actor conform to the default posture of what is exited.
	Going: The control traveling posture rule ensures that an actor can only go somewhere while standing.

Section 2.3 - Customization

Creating custom furniture to pose on is very simple, especially when it's to function like a supporter or container.
Example A shows how to create a deck chair as a custom furniture, which is as easy setting the compatible postures and occupant limit properties to what is desired.
In order to create new furniture that is not a supporter or container, your new piece will have to provide the compatible postures or occupant limit properties depending on what functionality you want to enable.

Adding support for new postures can be achieved in a similar fashion.
The postures are defined by the Table of Postures, which features the columns posture, describe posture (text) and assume posture (text).
Adding a new posture is as easy as extending this table with a new row, giving a name to the posture as well as some text describing how the postures looks and is assumed.
In order for players to make use of the new posture we also need some actions that redirect to the posturing action, and you might have to alter some furniture to accomodate the new posture.
Example B shows how to create a crawling posture.

Chapter 3 - Technical Reference

Contained in this chapter is a technical description of all the new and altered mechanics for the extension, divided by type.
It's intended as a companion to the other chapters, although an experienced author could glean much of the previous information from this chapter alone.

Section 3.1 - New Kind of Value: Posture

The postures are defined in the Table of Postures, which is reproduced below.
The text values describe posture and assume posture are used to describe the value of the posture, the first for when a person is in the posture and the other for when a person assumes the posture.
Postures are used for people, as the current posture, and for containers and supporters as a list called compatible postures.
For changing the posture of a person in a controlled manner, the posturing action should be used.

	Table of Postures
	Posture	describe posture (text)	assume posture (text)
	standing	"standing"	"[stand] up"
	sitting	"sitting"	"[sit] down"
	kneeling	"kneeling"	"[kneel]"
	bending	"bending"	"[bend]"
	prone	"laying prone"	"[lie] prone"
	supine	"supine"	"[lie] supine"

Section 3.2 - Phrases 

The following phrases can be used to describe a posture in a text substitution:

	say DESCRIBE POSTURE OF (posture): Uses the describe posture entry in the Table of Postures to describe someone in the posture.
	say ASSUME POSTURE OF (posture): Uses the assume posture entry in the Table of Postures to describe someone assuming the posture.

The following phrases can be used to check for postures:

	whether (person) IS POSING (posture): Checks if the current posture of the person is the specified posture.
	whether (person) IS POSING (posture) ON (object): Checks if the current posture of the person is the specified posture and that the person is enclosed by the given object.
	whether SOMEONE IS POSING (posture) ON (object): Checks each person enclosed by the object to see if any of them are in the given posture.
	whether (object) ALLOWS (posture) POSTURE: Checks if the compatible postures of the given object contains the specified posture. If the compatible postures property isn't available, it's assumed to be allowed.
	whether (object) BLOCKS (posture) POSTURE: Checks if the compatible postures of the given object does not contain the specified posture. If the compatible postures property isn't available, it's assumed to not be blocked.
	whether (object) HAS VACANCY: Checks if the number of people enclosed by the object is less than the occupant limit. If the object doesn't provide the occupant limit, it's assumed to have vacancy.

Example: * Garden Lounge - Relaxing in various postures

Getting started with postures is as easy as using the furniture templates.

	*: "Garden Lounge"
	
	Include Posturing by Fictitious Frode.
	Garden Patio is a room.

	A hammock is a bed in Garden Patio.
	A stone bench is a sofa in Garden Patio.

We can also easily create new furniture according to our own needs.

	A deck chair is an enterable supporter in Garden Patio. The compatible postures are {supine, prone, sitting}.

These will work for both the player and other actors.

	Clarice is a woman in Garden Patio.
	A persuasion rule: persuasion succeeds.

	Test me with "sit on bench / clarice, sit on bench / stand / lie on chair / clarice, enter chair / look"

Example: ** Crawling - Creating new postures

Adding a new posture is rather simple, but we must also remember to add new actions for the actors to use.

	*: "Crawling"
	
	Include Posturing by Fictitious Frode.
	
First we expand the Table of Postures to create the crawling posture.

	To crawl is a verb.
	
	Table of Postures (continued)
	Posture	describe posture (text)	assume posture (text)
	crawling	"crawling"	"[crawl] on all four"
	
We can then create two new actions, one to crawl and one to crawl on and in something.

	Crawling is an action applying to nothing.
	Understand "crawl" as crawling.
	Carry out an actor crawling: try the actor posturing crawling.
	
	Crawling on is an action applying to one thing.
	Understand "crawl on/over [a supporter]" as crawling on.
	Understand "crawl in [a container]" as crawling on.
	Understand "crawl on/in/over/-- [something]" as crawling on.

	Carry out an actor crawling on:
		If the holder of the actor is not the noun, silently try the actor entering the noun;
		If the holder of the actor is the noun:
			Unless the current posture of the actor is crawling, try the actor posturing crawling;
			Else follow the report posturing rules;
	
We can now create containers and supporters that work with crawling.

	Garage is a room.
	A cardboard box is an enterable container in Garage. The compatible postures is {crawling}.
	
	Test me with "enter box / stand / crawl in box"
