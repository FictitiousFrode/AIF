Version 1/170819 of Moisturizer by Fictitious Frode begins here.
"An experimental testbed for Erotic Storytelling, use at your own risk as features can change drastically.
It started out as a way providing some of the features from Moist, hence the name.
It currently covers charged items, lubrication, reading, numeric arousal, penetrations."

Include Erotic Storytelling by Fictitious Frode.

Volume 0 - New Verbs

[These are the new verbs the framework uses; We put this in it's own volume in case anyone needs to rewrite it for compatibility:]

To prevent is a verb.
To charge is a verb.
To smear is a verb.

Volume 1 - General Features

Book 1.1 - Charged Items

Part 1.1.1 - Charges

[Devices have both a charge and a max charge. We use -1 as a null value.]
A device has a number called charges. The charges of a device is usually -1.
A device has a number called max charges. The max charges of a device is usually -1.
A device has some text called extinguishing. The extinguishing of a device is usually "[The printed name] suddenly stops working."

Chapter 1.1.1a - Consumption

Every turn:
	Repeat with D running through switched on devices:
		If charges of D > 0, decrease the charges of D by 1;
		If charges of D is 0:
			Now D is switched off;
			If the player can see D, say the extinguishing of D;

Chapter 1.1.1b - Switching On

Check an actor switching on (this is the can't switch without charges rule):
	If the charges of noun is 0:
		If the actor is the player or the player can see the actor:
			say "Nothing happens." (A);
		Stop the action.

Part 1.1.2 - Recharging

A recharger is a kind of thing.

Recharging is an action applying to one touchable thing.
The specification of the fucking action is "Fucking is a helper action that can allows the player to target a person, and logic is applied to decide what parts are supposed to be involved. Redirects to the fucking it with action."

Chapter 1.1.2 - Understanding

Understand "charge [something preferably held]" as recharging.
Understand "recharge [something preferably held]" as recharging.
Understand "refill [something preferably held]" as recharging.

The recharging action has an object called the charger (matched as "with").
Rule for setting action variables for recharging:
	If the actor carries a recharger (called R), now the charger is R;

Chapter 1.1.2b - Checking

[Moist: You don't have a recharger.]
Check an actor recharging (This is the must have a recharger rule):
	If the charger is nothing:
		If the actor is the player:
			Say "[We] [don't] have anything to charge with." (A);
		Else if the player can see the actor and the action is not silent:
			Say "[The Actor] [don't] have anything to charge with." (B);
		Stop the action;

Check an actor recharging (This is the can only recharge charged items rule):
	Unless the noun provides the property charges and the noun provides the property max charges:
		If the actor is the player:
			Say "[Regarding the noun][Those] [aren't] something [we] [can] charge." (A);
		Else if the player can see the actor and the action is not silent:
			Say "[Regarding the noun][Those] [aren't] something [the actor] [can] charge." (B);
		Stop the action;

Chapter 1.1.2c - Carry Out

Carry out an actor recharging (this is the charge to full capacity rule):
	Now the charges of noun is the max charges of noun;

Chapter 1.1.2d - Report

Report an actor recharging (this is the standard report recharging rule):
	If the actor is the player:
		Say "[We] [charge] [the noun] to full capacity." (A);
	Else if the player can see the actor and the action is not silent:
		Say "[The actor] [charge] [the noun] to full capacity." (B);

Book 1.2 - Lubricating

Part 1.2.1 - Foundations

[Status: Complete]

Chapter 1.2.1a - Definition

[A thing can be lubricated if it provides the property lubrication time, and is lubricated if this property is positive. Lubrication medium is optional.
We define these two properties for the templates they are most applicable for.]

Definition: A thing (called T) is lubricated if T provides the property lubrication time and the lubrication time of T > 0.

An ass has a number called lubrication time.
An ass has some text called lubrication medium.
A penis has a number called lubrication time.
A penis has some text called lubrication medium.
A vagina has a number called lubrication time.
A vagina has some text called lubrication medium.
A sex toy has a number called lubrication time.
A sex toy has some text called lubrication medium.
A strap-on has a number called lubrication time.
A strap-on has some text called lubrication medium.

Chapter 1.2.1b - Drying

Every turn (this is the lubricant drying rule):
	Repeat with T running through things:
		If T provides the property lubrication time and the lubrication time of T > 0:
			Decrease the lubrication time of T by 1;
			If the player can see T:
				Let medium be "lubricant";
				If T provides the property lubrication medium and the lubrication medium of T is not the default value of text, now medium is the lubrication medium of T;
				Say "The [medium] on [T][if T is in a body part] inside [holder of T][end if] seems to have dried up." (A);

Chapter 1.2.1c - Lubricant

A lubricant is a kind of thing.
A lubricant has a number called duration. The duration of a lubricant is usually 15.
A lubricant has a number called charges. The charges of a lubricant is usually 10.
A lubricant has a number called max charges. The max charges of a lubricant is usually 10.
A lubricant has some text called lubrication medium. The lubrication medium of a lubricant is usually "jelly".

Part 1.2.2 - Action

[Status: Mostly complete]

Lubricating is an action applying to one touchable thing.

Chapter 1.2.2a - Understanding

Understand "lubricate [something]" as lubricating.
Understand "lube [something]" as lubricating.
Understand "wet [something]" as lubricating.
Understand "moisten [something]" as lubricating.
Understand "moist [something]" as lubricating.

The lubricating action has an object called lubricator (matched as "with").
Rule for setting action variables for lubricating:
	Let L be the list of lubricants carried by the actor;
	Sort L in reverse charges order;
	Unless L is empty, now the lubricator is entry 1 of L;

Chapter 1.2.2b - Checking

[Make sure the noun can be lubricated:]
Check an actor lubricating (This is the lubricating correct things rule):
	If the noun does not provide the property lubrication time:
		[Moist: It's of no use to lubricate [the noun].]
		If the actor is the player:
			Say "[The noun] is not something [we] [can] lubricate." (A);
		Else if the player can see the actor and the action is not silent:
			Say "[The noun] is not something [the actor] [can] lubricate." (B);
		Stop the action;

[Make sure that we have a charged lubricator:]
Check an actor lubricating (This is the lubricant control rule):
	If the lubricator is nothing:
		Say "You don't have anything to lubricate with.";
		Stop the action;
	If the charges of lubricator is 0:
		Say "The [lubricator] is empty.";
		Stop the action;

[Make sure the body part is accessible]
Check an actor lubricating (This is the lubricating body parts require access rule):
	If the noun is a body part:
		Unless the noun can be touched:
			If the actor is the player or the player can see the actor and the action is not silent:
				Say "[The noun] [are] covered by [preventing touching of the noun]." (A);
			Stop the action;

[TODO: Either reinstate these checks, or make a reference to lubricating around in the reporting rule
	If the noun contains something (called blocker):
		Say "First remove [the blocker] which is inserted in [the noun].";
		Stop the action;
	If the noun is in something (called blocker):
		Say "First remove [the noun] out of [the blocker].";
		Stop the action;]

[TODO: Make sure it's not already lubricated]

[Check for consent.]
Check an actor lubricating (This is the lubricating requires consent rule):
	If the noun is enclosed by a person:
		Follow the consent rules;
		Unless the outcome of the rulebook is the give consent outcome:
			Stop the action;

Chapter 1.2.2c - Carry Out

[Use charge and apply medium for duration:]
Carry out an actor lubricating something (this is the apply lubrication rule):
	Decrease the charges of the lubricator by 1;
	Now the lubrication time of the noun is duration of lubricator;
	If noun provides the property lubrication medium, now the lubrication medium of noun is the lubrication medium of lubricator;

Chapter 1.2.2d - Reporting

Report an actor lubricating (this is the standard report lubricating rule):
	If the actor is the player:
		Say "[We] [smear] a layer of [lubrication medium of lubricator] on [the noun]." (A);
	Else if the player can see the actor:
		Say "[The actor] [smear] a layer of [lubrication medium of lubricator] on [the noun]." (B);
	Else if the actor can see the noun:
		Say "[The noun] [are] covered by a layer of [lubrication medium of lubricator]." (C);

Chapter 1.2.2e - Persuasion

Persuasion for asking someone to try lubricating something (this is the consensual lubriaction persuasion rule): If consensual persuasion option is active and noun is enclosed by a person, persuasion succeeds.
Unsuccessful attempt by someone lubricating something when the reason the action failed is the lubricating requires consent rule: Rule succeeds;

Book 1.3 - Reading

Volume 2 - Erotic Features

Book 2.1 - Penetrations

[Penetrations can be achieved through a new relation with related actions and restrictions, or through hijacking the existing containment relation and the insert/remove actions.
We opt for the second option.]

Part 2.1.1 - Penetrating

[Status: Complete
Inserting should allow a penetrating thing to be inserted into an orificial body part, taking into account clothing and capacity.
NOTE: If the thing being inserted is a body part we redirect to fucking - This might be changed.]

Chapter 2.1.1 - Checking

[Allow allow inserting into orificial body parts by modifying existing rules. Note the special handling of breasts.]
The can't insert into what's not a container rule is not listed in any rulebook.
[The modified can't insert into what's not a container rule substitutes for the can't insert into what's not a container rule.]
Check an actor inserting something into (this is the modified can't insert into what's not a container rule):
	If the second noun is a container, continue the action;
	If the second noun is a an orificial body part and the second noun is not some breasts, continue the action;
	If the actor is the player or the player can see the noun and the action is not silent:
		Say "[regarding the second noun][Those] [can't contain] things." (A);
	Stop the action.

[Modify the capacity check to account for body parts.]
The can't insert if this exceeds carrying capacity rule is not listed in any rulebook.
[The modified can't insert if this exceeds carrying capacity rule substitutes for the can't insert if this exceeds carrying capacity rule.]
Check an actor inserting something into (this is the modified can't insert if this exceeds carrying capacity rule):
	If the second noun provides the property carrying capacity:
		If the number of things in the second noun is at least the carrying capacity of the second noun:
			If the actor is the player or the player can see the noun and the action is not silent:
				Now the prior named object is nothing;
				Say "[There] [are] no more room in [the second noun]." (A);
			Stop the action;
	If the second noun is an orificial body part:
		If something is in second noun:
			If the actor is the player or the player can see the noun and the action is not silent:
				Now the prior named object is nothing;
				Say "[The second noun] already contains [the list of things in second noun]." (B);
			Stop the action;

[Check that only penetrating things are inserted into body parts. Note the redirect to fucking for body parts]
Check an actor inserting something into (this is the penetrating body parts rule):
	If the second noun is an orificial body part:
		If the noun is a penetrating body part:
			If the actor is the player or the player can see the noun and the action is not silent:
				Try the actor fucking the noun with the second noun instead;
		If the noun is penetrating, continue the action;
		If the actor is the player or the player can see the noun and the action is not silent:
			Say "[The noun] is not something you can put in [the second noun]." (A);
		Stop the action;

[Check that the body part is accessible. We allow for touching rather than requiring full access.]
Check an actor inserting something into (this is the penetrating accessible body parts rule):
	If the second noun is a body part:
		Unless noun can be touched:
			If the actor is the player:
				Say "[The preventing touching of second noun] [prevent] [us] from reaching [the noun]." (A);
			Else if the player can see the noun and the action is not silent:
				Say "[The preventing touching of second noun] [prevent] [the actor] from reaching [the noun]." (B);
			Stop the action;

[Check for consent.]
Check an actor inserting something into (This is the penetrating requires consent rule):
	If the second noun is a body part:
		Follow the consent rules;
		Unless the outcome of the rulebook is the give consent outcome:
			Stop the action;

Chapter 2.1.1b - Persuasion

Persuasion for asking someone to try inserting something into something (this is the consensual penetration persuasion rule): If consensual persuasion option is active and the second noun is a body part, persuasion succeeds.
Unsuccessful attempt by someone inserting something into when the reason the action failed is the penetrating requires consent rule: Rule succeeds;

Part 2.1.2 - Withdrawing

[Status: Complete
Taking should account for removing a penetrator from a body part.]

Chapter 2.1.2a - Checking

[NOTE: This rule is already modified by Erotic Storytelling]

The revised can't take people's possessions rule is not listed in any rulebook.
[The third can't take people's possessions rule substitutes for the can't take people's possessions rule.]
Check an actor taking (this is the third can't take people's possessions rule):
	If the noun is a garment and the noun is worn by someone, continue the action; [Defer judgement to consent rules]
	If noun is in a body part, continue the action;  [Defer judgement to consent rules]
	Let the local ceiling be the common ancestor of the actor with the noun;
	Let the owner be the not-counting-parts holder of the noun;
	While the owner is not nothing and the owner is not the local ceiling:
		If the owner is a person:
			If the actor is the player:
				Say "[regarding the noun][Those] [seem] to belong to [the owner]." (A);
			Stop the action;
		Let the owner be the not-counting-parts holder of the owner;

[Check that the body part is accessible. We allow for touching rather than requiring full access.]
Check an actor taking something (this is the withdrawing from accessible body parts rule):
	If the noun is in a body part (called orifice):
		Unless orifice can be touched:
			If the actor is the player:
				Say "[The preventing touching of orifice] [prevent] [us] from reaching [the noun]." (A);
			Else if the player can see the noun and the action is not silent:
				Say "[The preventing touching of orifice] [prevent] [the actor] from reaching [the noun]." (B);
			Stop the action;

[Check for consent.]
Check an actor taking something (This is the withdrawing requires consent rule):
	If the noun is in a body part (called orifice):
		Follow the consent rules;
		Unless the outcome of the rulebook is the give consent outcome:
			Stop the action;

Chapter 2.1.2b - Persuasion

Persuasion for asking someone to try taking something (this is the consensual withdrawing persuasion rule): If consensual persuasion option is active and the noun is in a body part , persuasion succeeds.
Unsuccessful attempt by someone taking something when the reason the action failed is the withdrawing requires consent rule: Rule succeeds;

Book 2.2 Voyeurism

Part 2.2.1 - Kinds

A voyeur point is a kind of container.
The printed name is usually "voyeurism modus".
A voyeur point is usually enterable. A voyeur point is usually transparent.
A voyeur point has a room called the destination.
[TODO Instead of an actor exiting a voyeur point (called V), move the actor to the destination of V.]

Book 2.3 - Numeric Arousal

A person has a number called the excitement.
Definition: A person (called P) is excited if the excitement of P > 15.

Book 2.4 - Restraints

To decide whether (P - a person) is confined by (C - a container):
	If P is in C and C is closed and C is locked, decide yes;
	Decide no;

To decide whether (P - a person) is confined:
	If P is in a container (called C):
		If P is confined by C, decide yes;
	Decide no;

[TODO: Surely there's a smarter way to do this?]
To decide whether (P - a person) is not confined:
	If P is in a container (called C):
		If P is confined by C, decide no;
	Decide yes;

To decide which object is the restraint of (P - a person):
	If P is in a container (called C):
		If P is confined by C, decide on C;
	Decide on nothing;


Moisturizer ends here.

---- DOCUMENTATION ----

Chapter 1 - Using this Extension

To use this extension (which relies on Erotic Storytelling), you need to download and install it (which you probably have if you're reading this) and include it in your story:

*:
	Include Moisturizer by Fictitious Frode.

As this extension makes use of Erotic Storytelling, you don't need to include both but if you then this extension must be loaded last.

Section 1.1 - Extension Overview

'Moisturizer' is a pun on the fact that this started out as a way to supply functionality in Moist (by Scarlett Herring) that wasn't ready or suitable for Erotic Storytelling.
It is now an experimental testbed so changes (and bugs!) are to be expected and the documentation is not always complete or updated.

Section 1.2 - Version History

2017-08-19: Release 1

	* Charged items and recharging; functionally complete
	* Lubrication; functionally complete
	* Penetrations; functionally complete
	* Numeric Arousal; partial implementation
	* Readables; idea stage
	* Voyeurism; idea stage


Section 1.3 - Contact Info

The author of this extension can be reached in the following ways:

	Mail: fictitious.frode@gmail.com
	Blog: https://informedaif.wordpress.com/ is a blog dedicated to writing AIF with Inform 7, and is the official host of the extension. It contains both dicussions around AIF and tutorials on both Inform in general and this extension in particular.
	Reddit: https://www.reddit.com/r/AIFCentral/ is the subreddit for the AIF community, and the author checks this regularly.
	GitHub: https://github.com/FictitiousFrode/AIF Contains the latest version of the extension, possibly including functionality that hasn't been released yet.

Feedback of all varieties is welcome, but constructive criticism and discussion is the most appreciated, along with reports of bugs and other issues.
For support I would appreciate using public communication, so that other may learn from the request as well.
