Version 1 of Consent by Fictitious Frode begins here.

"This extension provides the framework for seeking consent from actors before performing actions that affect them."
Include Version 1 of Body Parts by Fictitious Frode.

Part 1 - Consent Rules

[In order to have other actors consent to actions being performed on them (or parts of them), we create a new consent rulebook (Consent rules). We also create a rulebook for handling errors when consent is not given (Consent denied for). We make that consen is denied by default. We then carefully insert this into the action-processing rules such that all actions that are marked as consensual follow the consent rules and stop the action if consent is not obtained.]

Consent rules is a rulebook.
Consent rules have outcomes consent given (success) and consent denied (failure).
Consent denied for is a rulebook.
Consent rule (this is the default consent rule):
	Consent denied;

The consent seeking rule is listed in the action-processing rules.
This is the consent seeking rule:
	If the current action is consensual:
		Follow the consent rules;
		If the rule failed:
			Follow the consent denied for rulebook;
			If not the rule succeeded and not the rule failed:
				Say "[If the noun is the actor][We][else][Noun][end if] [are not] consenting to that ([current action])." (A);
			Stop the action;

[In order to let Inform know that actions are consensual, we need to actually make an action consensual. In order to not surprise the author, we do this to a new action that will never be used.]
Dummy-action-consenting is an action applying to nothing.
Dummy-action-consenting is consensual.

Consent ends here.

---- DOCUMENTATION ----

This extension provides the framework for seeking consent before performing actions that affect them.

Chapter: Using this Extension

When asking another person in a story to try doing an action, that person's persuasion rules are consulted. These rules are only consulted when that person is the active participant, but for certain actions it is fitting to check if they are a willing secondary participant. This extension is created in order to facilitate such a check, which is a 3 step process:

	1: Define which actions require consent.
	2: Granting consent for a person.
	3: Customize failure message for when consent is denied

Section: Defining consensual actions

All actions that are defined as consensual (and only those) will attempt to gain consent from the involved person. Defining which actions are consensual is as easy as stating it, as shown in Example A and below:

*:
	Kissing is consensual.

It's also possible to define consent more finely grained:

*:
	Touching a person is consensual.

This can be as detailed as needed, including references to scenes and specific things.

Section: Granting consent

Consent is granted in a similar way that persuasion is defined (see §12.4 for details), using the Consent rulebook. Consent can be given or denied both for specific actions and/or persons, or in a broader sense with the terms someone and something. Example A shows how to give a specific consent; for a very general rule (that undoes everything we try to accomplish here, and as such is only good for testing or as an example) we could use the following:

*:
	Consent rule for an actor doing something to someone: Consent given.

More likely, we can grant consent for a person while a certain scene is happening:

*:
	Consent rule for doing something to a person during a scene: Consent given

Only actions that are defined to require consent (see above) will be checked, but it's possible to give consent for actions that are not checked without any errors being raised.

Section: Failure messages

Actions stopped due to denied consent is handled similarly to failed persuasion (see §12.5 for details), using the Consent denied for rulebook. Example A shows how to give a specific failure message. It's important to use the "instead" keyword here, otherwise the default failure message will be printed as well.

Chapter: Technical Notes

The default failure message can be altered by altering the consent seeking rule response (A), detailed in §14.11:

*:
	The consent seeking rule response (A) is "That would be rude."

If you want other actors to perform actions on the player, make sure to give these consent as well; this is not done automatically out of fear of messing up actions with two nouns.

Section: Version History

Release 1 (v1.0): First release

Section: Contact Info

The author of the framework can be reached in the following ways:

	* Mail: fictitious.frode@gmail.com
	* Blog: https://informedaif.wordpress.com/ is a blog dedicated to writing AIF with Inform 7, and is the official host of the framework. It contains both dicussions around AIF and tutorials on both Inform in general and this framework in particular.
	* Reddit: https://www.reddit.com/r/AIFCentral/ is the subreddit for the AIF community, and the author checks this regularly.

Feedback of all varieties is welcome, but constructive criticism and discussion is the most appreciated, along with reports of bugs and other issues. For support I would appreciate using public communication, so that other may learn from the request as well.

Example: ** Consent - Kissing three different persons with different consent.

	*: "Consensual Kissing"
	The Library is a room.
	Rachel is a woman in the Library. [Rachel allows kissing]
	Annie is a woman in the Library. [Annie disallows kissing, with a custom failure message.]
	Sarah is a woman in the Library. [Sarah disallows kissing, with the default failure message.]
	The block kissing rule is not listed in the check kissing rulebook.
	Kissing is consensual.
	Report kissing:
		Say "Smooch!";

	Consent rule for kissing Rachel:
		Say "You can say things here, but the response might end up looking weird.";
		Consent given.
	
	Consent denied for kissing Annie: Say "Annie doesn't want that." instead;
	
	Test me with "kiss Rachel / kiss Annie / kiss Sarah."
