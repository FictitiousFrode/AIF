Version 3 of Outfits by Fictitious Frode begins here.

"Outfits are a special form of clothing, that covers everything and blocks all other garments."
Include Version 3 of Body Parts by Fictitious Frode.

[Outfits are a special form of clothing, that covers everything and blocks all other garments.
Description of persons and body parts should check for which outfit is being worn, and tailor the description thereafter.]

Book 1 - Kinds

An outfit is a kind of coverable.
An outfit is always wearable. 

Book 2 - Actions

Part 2.1 - Dressing

[Make sure that the actor is not already wearing an outfit.]
Check an actor wearing an outfit (This is the outfit not replaced rule):
	If the actor is wearing an outfit (called blocker):
		If the actor is the player, say "[We] [cannot] [wear] [noun], [we] [are] wearing [blocker]" (A) instead;
		Else say "[Actor] [cannot] [wear] [noun], [regarding the actor][they] [are] wearing [blocker]" (B) instead;

[Will try to remove anything worn by the actor, to allow the outfit to be put on.
Update the underlaying relation for body parts when putting on an outfit.
This rule is not named, as removing it might cause malfunctions.]
Carry out an actor wearing an outfit (called cloth):
	While the actor is wearing coverable:
		Try the actor stripping;
		If the actor is wearing a coverable, say "Failed taking off [list of coverables worn by actor]." instead;
	Now every body part that is part of the actor underlies the cloth;

When play begins (this is the initial outfits rule):
	Repeat with current-coverable running through the list of coverables:
		Now current-coverable is not underlaid by anything;
	Repeat with P running through the list of persons:
		If P is wearing an outfit (called O):
			Now every body part that is part of P underlies O;
			Now the decency of P is the decency of O;

Part 2.2 - Undressing

[Update the underlaying relation when removing outfit.
This rule is not named, as removing it might cause malfunctions.]
Carry out an actor taking off an outfit (called cloth):
	Now the cloth is not underlaid by anything;

Part 2.3 - Stripping

[Remove everything worn by the actor, in correct order.]
Carry out an actor stripping while the actor is wearing outfit (this is the stripping removes every outfit rule):
	While the actor is wearing an outfit (called cloth):
		Silently try the actor taking off the cloth;
		If the actor is wearing the cloth, say "Failed in taking off [cloth]." instead;
		Else say "([cloth] removed.)";

Part 2.4 - Inventory

[When the player takes inventory, we want to also report what the player is wearing]
Report taking inventory (this is the list player outfit rule):
	If the player is wearing outfit, say "[We] [are] wearing [a list of outfits worn by the player]."

Part 2.5 - Outfit Descriptions

[Provides easy description of an outfit based on who is wearing it, with the values stored in a table.]
Table of Worn Outfit Descriptions
outfit (an outfit)	wearer (a person)	description (some text)
--	--	--

[When the player examines a person wearing an outfit, the fitting entry from the Table of Worn Outfit Descriptions is printed. An entry with blank wearer is considered to be the default description, and is used whenever a description for the specific wearer is not found. If no entry is found, it tries to cover by printing what outfit the person is wearing, and it's description.]
Report examining a person (called target) (This is the describe outfit rule):
	Let described be false;
	Let default description be "";
	If target is wearing an outfit (called cloth):
		[Find either a record for outfit and this person, or outfit and blank person]
		Repeat through Table of Worn Outfit Descriptions:
			If there is no wearer entry:
				If cloth is outfit entry, let default description be description entry;
			Else if target is wearer entry and cloth is outfit entry:
				Say "[description entry]";
				Now described is true;
	Else:
		[Find a record for blank outfit and this person]
		Repeat through Table of Worn Outfit Descriptions:
			If there is no outfit entry and target is wearer entry:
				Say "[description entry]";
				Now described is true;
	If described is false:
		If default description is "" and target is not wearing nothing:
			If the noun is the player, say "[We] [are] wearing [cloth]: [Description of cloth]";
			Else say  "[Target] [are] wearing [cloth]: [Description of cloth]";
		Else:
			Say "[Default description]";

Table of Outfit Bodypart Descriptions
body part (a body part)	outfit (an outfit)	description (some text)
--	--	--

[When the player examines the body part of a person wearing an outfit, the fitting entry from the Table of Outfit Bodypart Descriptions is printed. A blank outfit defines a default description of the body part, and if no entry is found, it instead describes the body part directly.]
Before examining a body part (called BP):
	Let default description be "";
	If BP underlies an outfit (called O):
		Repeat through Table of Outfit Bodypart Descriptions:
			If there is no outfit entry:
				If BP is body part entry, let default description be description entry;
			Else:
				If BP is body part entry, say "[description entry]" instead;
		If default description is not "", say default description instead;
		Say "[BP] is covered by [O]." instead;
	Else:
		Repeat through Table of Outfit Bodypart Descriptions:
			If BP is body part entry and there is no outfit entry:
				Say "[description entry]" instead;

Part 2.6 - Worn Outfit Reactions

[This allows us to have people in a room react to our outfit (or lack of one) when we enter.
A blank outfit means no outfit.]

Table of Worn Outfit Reactions
reacter (a person)	outfit (An outfit)	reaction (some text)	ruling (a rule)
--	--	--	--

Report going to a room (called R) (This is the worn outfit reaction rule):
	Repeat through Table of Worn Outfit Reactions:
		Let P be the reacter entry;
		If the player is not wearing an outfit:
			If there is no outfit entry and P is listed in the list of people in R:
				Unless there is no ruling entry, follow the ruling entry;
				Say "[reaction entry]";
		Else:
			If the outfit entry is worn by the player and P is listed in the list of people in R:
				Unless there is no ruling entry, follow the ruling entry;
				Say "[reaction entry]";

The worn outfit reaction rule is listed last in the report going rulebook.
				
Part 2.7 - Responsive Crowds

[A responsive crowd is a kind of backdrop (it can be placed in multiple rooms), and if the player enters a room containing a responsive crowd, a response apropriate to the outfit worn by the player is printed. A blank outfit means no outfit, while a blank crowd is the default reponse for any crowd not given a specific response.]

A responsive crowd is a kind of backdrop.

Table of Responsive Crowd Reactions
outfit (An outfit)	crowd (a responsive crowd)	reaction (some text)	ruling (a rule)
--	--	--	--

Report going to a room (called R) containing a responsive crowd (called C) (this is the responsive crowd reaction rule):
	Let reaction be "";
	Let ruling be a rule;
	Let default reaction be "";
	Let default ruling be a rule;
	If the player is not wearing an outfit:
		Repeat through Table of Responsive Crowd Reactions:
			If C is crowd entry and there is no outfit entry:
				Let reaction be reaction entry;
				Unless there is no ruling entry, let ruling be ruling entry;
			If there is no crowd entry and there is no outfit entry:
				Let default reaction be reaction entry;
				Unless there is no ruling entry, let default ruling be ruling entry;
	else:
		Let O be entry 1 of the list of outfits worn by the player;
		Repeat through Table of Responsive Crowd Reactions:
			If C is crowd entry and O is outfit entry:
				Let reaction be reaction entry;
				Unless there is no ruling entry, let ruling be ruling entry;
			If there is no crowd entry and O is outfit entry:
				Let default reaction be reaction entry;
				Unless there is no ruling entry, let default ruling be ruling entry;
	If reaction is not "":
		Say reaction;
		Follow the ruling;
	Else:
		If default reaction is not "", say default reaction;
		Follow the default ruling;

The responsive crowd reaction rule is listed last in the report going rulebook.

Outfits ends here.

---- DOCUMENTATION ----

This extensions relies on the coverable from the Body Parts extension, and adds garments as a new kind of coverable.

Chapter: Using this Extension

This extension requires Body Parts, and is incompatible with Garments as a person wearing garments instead of an outfit will be assumed to be naked.

This extension provides outfits, which are an alternative to dressing people in garments. An outfit will cover everything on a person, blocks any other coverables (such as garments) from being worn, and will replace any garments already worn. There is also a framework built around descriptions of persons and body parts when an outfit is worn. Outfits are mainly intended to be changed behind-the-scenes, and not by player interaction. This should preferably be done by specifying that the actor puts on the outfit; if the outfit is just stated as worn then the initial outfits rule should be followed in order to recalculate coverage. This is automatically performed at the start of the story. Example A shows how to create an outfit.

Section: Dressing, Undressing and Stripping

When a character puts on an outfit, any body parts will be considered covered. Putting on an outfit will also silently remove any garments that the character was already wearing. However, if the character is already wearing an outfit, then the action is stopped. This might be altered by unlisting the "outfit not replaced rule".

Stripping is also implemented, and will remove any outfit worn by the character.

Remember that Inform has a set of persuasion rules that governs what you can order other characters to do. Note that if you only enable strip, and not taking off, it will fail as strip calls taking off. If you want all characters to respond to commands to dress and undress, you should look at Example B.:

If the story changes outfits for actors behind the scenes, this should preferably be done by specifying that the actor puts on the outfit; if the outfit is just stated as worn then the initial outfits rule should be followed in order to recalculate coverage.

Section: Visibility and Descriptions

Wearing an outfit does not automatically stop vision of anything, but all body parts attached to the wearer are considered covered. When examining a person wearing an outfit, the outfit worn and it's description is printed. To stop this, unlist the "describe outfit rule". Descriptions of body parts should be tailored to fit the outfits that a character might wear. This process has been simplified by moving the descriptions into a table called Table of Outfit Bodypart Descriptions. See the example below for details on using this table. Note that a blank (--) entry in the outfit column indicates that the body part is not covered. If no entry is found at all (the person is wearing something not taken into account), the default description of the body part is used instead. This is shown in Example C.

Likewise the Table of Worn Outfit Descriptions gives descriptions of a person based on what outfit they are wearing. A blank (--) entry in the wearer column is the default description of the outfit if worn by anyone that does not have their own entry. If there is no default entry, the title and description of the outfit is printed instead. This is shown in Example D.

Section: Reactions and Responsive Crowds

In order to spice up feedback from NPCs and make the story come more alive, support for reactions based on what the player is wearing has been added.

The Table of Worn Outfit Reactions contains reactions for specific NPCs. A blank entry in the outfit column means that the player is not wearing an outfit. There are no defaults or fallbacks defined here. Example E shows how this works.

This only makes defined actors react, but it's also possible to have "invisible crowds" in a game to make it feel more populated than it really is. The responsive crowd is defined as a new kind of backdrop (meaning it can exist in several places), and the Table of Responsive Crowd Reactions holds their responses. Like before, an empty outfit column means the player is naked, while an empty crowd column is the default response for the given outfit. Example E shows this.

Both of these tables have an entry for ruling; this can be used to refer to a named rule that triggers when the conditions for printing the text is met. This can be used to award or punish the player as the author sees fit.

Chapter: Technical Notes

Section: Version History

Release 2 (v0.6)

	Outfit Descriptions would crash on generic descriptions (--).
	Body Part descriptions was incompatible with using B to trigger bold text.
	Worn Outfit Reactions had a nasty bug that made it not work at all.
	Responsive Crowd Reactions had a nasty bug that made it not work at all.
	Added ruling triggers to reactions and responses, as suggested by AnotherWannabe.
	Improved how reactions and reponses were printed.
	Updated documentation.

Release 3 (v1.0)

	No major changes.

Section: Contact Info

The author of the framework can be reached in the following ways:

	* Mail: fictitious.frode@gmail.com
	* Blog: https://informedaif.wordpress.com/ is a blog dedicated to writing AIF with Inform 7, and is the official host of the framework. It contains both dicussions around AIF and tutorials on both Inform in general and this framework in particular.
	* Reddit: https://www.reddit.com/r/AIFCentral/ is the subreddit for the AIF community, and the author checks this regularly.

Feedback of all varieties is welcome, but constructive criticism and discussion is the most appreciated, along with reports of bugs and other issues. For support I would appreciate using public communication, so that other may learn from the request as well.

Example: * Basic Outfits - Creating and putting on outfits

	The Library is a room.
	Soandso is a person in the Library.
	A pair of feet is a part of every person.

	The fancy outfit is an outfit. The description is "This clothing looks very fancy!"
	Soandso is wearing the fancy outfit.

	The description of Soandso's feet is "[If Soandso is wearing the fancy outfit]The feet are covered in very fancy boots.[else]Nude feet!";

	Test me with "x feet / strip / x feet."

Example: * Persuasion - Making every character respond to commands to take on/off garments, and strip.

	Persuasion rule for asking a person to try wearing a garment: persuasion succeeds.
	Persuasion rule for asking a person to try taking off a garment: persuasion succeeds.
	Persuasion rule for asking a person to try stripping: persuasion succeeds.

Example: * Outfit Descriptions 1 - Two descriptions of feet, one general and one for a particular outfit.

	The Library is a room.
	Soandso is a person in the Library. 
	A pair of feet is a part of every person.
	
	The plain outfit is an outfit. The description is "This looks very plain."
	Soandso is wearing the plain outfit.

	Table of Outfit Bodypart Descriptions (Continued)
	body part (a body part)	outfit (an outfit)	description (some text)
	Soandso's pair of feet	plain outfit	"Soandso's feet look very plain."
	Soandso's pair of feet	--	"These are Soandso's beautiful feet."

	Test me with "x soandso's feet."

Example: * Outfit Descriptions 2 - Two descriptions of the plain outfit, one general and for a particular person.

	The Library is a room.
	Soandso is a person in the Library.
	A pair of feet is a part of every person.
	
	The plain outfit is an outfit. The description is "This looks very plain."
	Soandso is wearing the plain outfit.

	Table of Worn Outfit Descriptions (Continued)
	outfit (an outfit)	wearer (a person)	description (some text)
	plain outfit	soandso	"Soandso looks rather plain in this outfit."
	plain outfit	--	"The wearer looks rather plain in this outfit."

	Test me with "x me/ strip / x me."

Example: ** Reactions - Setting up reactions from other actors based on your outfits.

	The Bedroom is a room. The Library is east of the bedroom.
	The mother is a woman in the library.

	Table of Worn Outfit Reactions (continued)
	reacter (a person)	outfit (An outfit)	reaction (some text)	ruling (a rule)
	mother	--	"As you enter, your mother turns to face you. 'Why are you walking around naked, dear?'"	--

	Test me with "east."

Example: ** Responsive Crowds - Setting up reactions from crowds.

	The Lobby is a room. The Bar is east of the Lobby.
	A rowdy crowd is a responsive crowd in bar.
	
	Table of Responsive Crowd Reactions (continued)
	outfit (An outfit)	crowd (a responsive crowd)	reaction (some text)	ruling (a rule)
	--	rowdy crowd	"The crowd of bar-goers turns around and gapes at your naked ass as you enter."	--

	Test me with "east."
