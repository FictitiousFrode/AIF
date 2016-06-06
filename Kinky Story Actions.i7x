Version 1/150126 of Kinky Story Actions by Fictitious Frode begins here.

"Supports the kinky activities of spanking, bondage, gagging and wet."

Include Version 4 of Body Parts by Fictitious Frode.
Include Version 2 of Ropework by Fictitious Frode.


Book 1 - Spanking

Part 1.1 - Spanking

[Spanking is a very simple action; the only requirements we have are that we must be able to touch the target, and it must be either a body part or a person. All of this is taken care of by the action specification.]
Spanking is an action applying to one touchable thing.
The specification of the spanking action is "The spanking action is enabled on persons and body parts, and ensures that the target is reachable. It does *not* check that the target is not enclosed by the actor, as we might want to have characters spank themselves."
Understand "spank [someone]" and "spank [body part]" as spanking.
To spank is a verb.

Report an actor spanking (This is the basic report spanking rule):
	Say "[If the player is the actor][We][else][Actor][end if] [spank] [noun]." (A);

Part 1.2 - Spanking With

[By default, we don't allow spanking with anything; the actions exists for the author to place "instead of" rules on. The one exception is spanking with your hands, which redirects to implicit spanking instead.]

Spanking it with is an action applying to one touchable thing and one carried thing.
The specification of the spanking it with action is "Spanking with something is blocked by default, as it's not feasible to keep a generic list of items that might be used to spank with. The action is provided for the author to write 'instead of' rules around; the one exception is spanking with your own hands will redirect to the implicit 'spanking' action."
Understand "spank [someone] with [something]" and "spank [body part] with [something]" as spanking it with.

Check an actor spanking something with something (this is the block spanking it with rule):
	If the second noun is part of the actor and the second noun is a pair of hands, try the actor spanking the noun instead;
	Say "[If the player is the actor][We][else][Actor][end if] [cannot] [spank] [noun] with [second noun]." (A);

Book 2 - Bondage

Part 2.1 - Ropework Integration

[Make hands ands legs attachable, and attempt to redirect tieing of a person to instead tie their hands or feet (in that order).]

A pair of hands is usually attachable.
A pair of legs is usually attachable.

Does the player mean tying something to something that is part of the player: It is unlikely.

[We redirect attempts to tie a person that is unattachable to find a suitable body part to tie instead.]
Check an actor tying something to a person (called P) (this is the tying persons redirect rule):
	If P is not attachable:
		If P encloses a free pair of hands (called hands), try the actor tying the noun to hands instead;
		If P encloses a free pair of legs (called legs), try the actor tying the noun to legs instead;
		If P encloses a free attachable body part (called target), try the actor tying the noun to target instead;

Part 2.2 - Cuffs

[Cuffs shares some similarities with rope (you can attach things together).
Unlike rope, cuffs should be both openable and lockable, and the default use would be for hands to be cuffed together, restricting hand usage (as implemented below). However, they can also be used to 'cuff someone to something', in a similar fashion to rope.]
[TODO: Implement]

Part 2.3 - Limitations

[TODO: Add some limitations here, such as no moving when legs/feet/thighs are bound, and no manipulation when hands are bound.]

Book 3 - Gagging

[We choose to implement gagging as something wearable that another person can put on, and when worn will limit certain actions. If Garments is being used, the gag will be implemented as a garment,]

Part 3.1a - Paraphernalia (for use with Garments by Fictitious Frode)

[First we need something to gag people with.]
A gag is a kind of garment.
The specification of a gag is "A gag is something that can be worn, and that other people can make you wear. When worn, it will limit the actions available."

When play begins:
	Now every gag is incompatible with every gag;
	Now every gag covers every mouth;

Part 3.1b - Paraphernalia (for use without Garments by Fictitious Frode)

A gag is a kind of wearable thing.
The specification of a gag is "A gag is something that can be worn, and that other people can make you wear. When worn, it will limit the actions available."

Part 3.2 - Actions

[There are two ways to put on (and take off) a gag: Wearing it yourself (with the 'wear' command), or being forced to wear it (with the 'gag' command). By making the definition of gagged just depend on the wearing of a gag, we can use the standard wearing actions without too many modifications; we just check that the person isn't already gagged.]

Definition: A person is gagged if they are wearing a gag.

Gagging it with is an action applying to one touchable thing and one carried thing.
The specification of the gagging it with action is "Gagging is the act of making another person wear a gag. As such, it requires the actor to be in possession of the gag at the start, but the gag is then transferred and worn by the other person."
Understand "gag [someone] with [gag]" as gagging it with.
Understand "put [gag] on [someone]" as gagging it with (with nouns reversed).
To gag is a verb.
To remove is a verb.

[Make sure that we don't double-gag]
Check an actor gagging someone (called P) with something (this is the can't gag what's already gagged rule):
	If P is gagged, say "[If the player is P][We][else][P][end if] [are] already gagged." (A) instead;
Check an actor wearing a gag (this is the can't wear gag when already gagged rule):
	If the actor is gagged, say "[If the player is the actor][We][else][Actor][end if] [are] already gagged." (A) instead;

Carry out an actor gagging something with something (this is the basic gagging rule):
	Now the noun is carrying the second noun; [We bypass giving, because that action might be blocked]
	Try the noun wearing the second noun;
	If the noun is not wearing the second noun:
		Say "(forcing [second noun] on [noun])[command clarification break]" (A);
		Now the noun is wearing the second noun;

Report an actor gagging something with something (this is the report gagging rule):
	Say "[If the player is the actor][We][else][Actor][end if] [gag] [noun] with [second noun]." (A);

Ungagging is an action applying to one thing.
The specification of the ungagging action is "Ungagging is the act of removing a gag from someone, and the gag ending up in the possession of the actor."
Understand "ungag [someone]" as ungagging.
Instead of an actor removing a gag from someone (called P), try the actor ungagging P instead;

Check an actor ungagging someone (called P) (this is the only ungag gagged people rule):
	If P is not gagged, say "[If the player is P][We][else][P][end if] [are not] gagged." (A) instead;

Carry out an actor ungagging someone (called P) (this is the basic ungagging rule):
	Repeat with gag-item running through the list of gags worn by P: [This should be one and only one, but this approach is safest to use]
		Now actor carries the gag-item;

Report an actor ungagging someone (this is the report ungagging rule):
	Say "[If the player is the actor][We][else][Actor][end if] [remove] the gag from [noun]." (A);
	
Part 3.3 - Restrictions 

[In order for gagging to be effective, we need to intercept and stop certain actions.
For many of these actions, there is an implicit understanding that the target of the action can talk back, so we block also when the target is gagged.]

Chapter - Standard Actions

Check an actor answering something that (this is the can't answer when gagged rule):
	If the actor is gagged, say "[If the player is the actor][We][else][Actor][end if] [cannot] say that when gagged." (A);
	If the noun is gagged, say "[If the player is the noun][We][else][Noun] [cannot] reply to that when gagged." (B);

Check an actor asking something about (this is the can't ask about when gagged rule):
	If the actor is gagged, say "[If the player is the actor][We][else][Actor][end if] [cannot] say that when gagged." (A);
	If the noun is gagged, say "[If the player is the noun][We][else][Noun] [cannot] reply to that when gagged." (B);

Check an actor asking something for (this is the can't ask for when gagged rule):
	If the actor is gagged, say "[If the player is the actor][We][else][Actor][end if] [cannot] say that when gagged." (A);
	If the noun is gagged, say "[If the player is the noun][We][else][Noun] [cannot] reply to that when gagged." (B);

Check an actor buying (this is the can't buy when gagged rule):
	If the actor is gagged, say "[If the player is the actor][We][else][Actor][end if] [cannot] communicate well enough for that when gagged." (A);

Check an actor consulting something about (this is the can't consult people when gagged rule):
	If the noun is a person:
		If the actor is gagged, say "[If the player is the actor][We][else][Actor][end if] [cannot] say that when gagged." (A);
		If the noun is gagged, say "[If the player is the noun][We][else][Noun] [cannot] reply to that when gagged." (B);

Check an actor drinking (this is the can't drink when gagged rule):
	If the actor is gagged, say "[If the player is the actor][We][else][Actor][end if] [cannot] drink [noun] when gagged." (A);

Check an actor eating (this is the can't eat when gagged rule):
	If the actor is gagged, say "[If the player is the actor][We][else][Actor][end if] [cannot] eat [noun] when gagged." (A);

Check an actor saying sorry (this is the can't say sorry when gagged rule):
	If the actor is gagged, say "[If the player is the actor][We][else][Actor][end if] [cannot] say that when gagged." (A);

Check an actor saying yes (this is the can't say yes when gagged rule):
	If the actor is gagged, say "[If the player is the actor][We][else][Actor][end if] [cannot] say that when gagged." (A);

[These seems to have been removed from the standard rules.
Check an actor singing (this is the can't sing when gagged rule):
	If the actor is gagged, say "[If the player is the actor][We][else][Actor][end if] [cannot] sing when gagged." (A);

Check an actor swearing mildly (this is the can't swear mildly when gagged rule):
	If the actor is gagged, say "[If the player is the actor][We][else][Actor][end if] [cannot] swear when gagged." (A);

Check an actor swearing obscenely (this is the can't swear obscenely when gagged rule):
	If the actor is gagged, say "[If the player is the actor][We][else][Actor][end if] [cannot] swear when gagged." (A);]

Check an actor telling something about (this is the can't tell about when gagged rule):
	If the actor is gagged, say "[If the player is the actor][We][else][Actor][end if] [cannot] say that when gagged." (A);
	If the noun is gagged, say "[If the player is the noun][We][else][Noun] [cannot] reply to that when gagged." (B);

Chapter - Erotic Actions (for use with Erotic Story Actions by Fictitious Frode)

Check an actor kissing (this is the can't kiss when gagged rule):
	If the actor is gagged, say "[If the player is the actor][We][else][Actor][end if] [cannot] kiss when gagged." (A);
	[It's perfectly fine to be the recipient of a kiss though!]
	
Check an actor licking (this is the can't lick when gagged rule):
	If the actor is gagged, say "[If the player is the actor][We][else][Actor][end if] [cannot] lick when gagged." (A);
	[It's perfectly fine to be the recipient of a lick though!]

Check an actor biting (this is the can't bite when gagged rule):
	If the actor is gagged, say "[If the player is the actor][We][else][Actor][end if] [cannot] bite when gagged." (A);
	[It's perfectly fine to be the recipient of a bite though!]

Check an actor fucking something with (this is the can't fuck a gagged mouth rule):
	If the noun is part of a person (called P) and the noun is a mouth and P is gagged, say "[If the player is the actor][We][else][Actor][end if] [cannot] fuck a gagged mouth." (A);
	
Book 4 - Wet

[We'll keep the functionality here basic, and just keep track of wether a person needs to urinate or not, while some stories might want to have the status *urgently* needs to urinate as well.]

A person is either need to urinate or does not need to urinate. A person is usually does not need to urinate.

Part 4.1 - Urinating

Urinating is an action applying to nothing.
The specification of the urinating action is "Urinating is the act of leting go of your bodily wastefluids. By default, the action just ensures that the actor has a need to perform the act, it's up to the story to state that a person needs to urinate.
The story might want to keep track of any stains left by this activity, and also control where the player is allowed to do so.
There is no check for what the actor is wearing."
Understand "urinate" as urinating.
Understand the commands "piss", "pee", "wee" and "wizz" as "urinate".
To relieve is a verb.

Check an actor urinating (this is the need to urinate rule):
	If the actor is does not need to urinate, say "[If the player is the actor][We][else][Actor][end if] [have] no need to urinate right now." (A);

Carry out an actor urinating (this is the basic urinating rule):
	Now the actor is does not need to urinate;

Report an actor urinating (this is the basic report urinating rule):
	Say "[If the player is the actor][We][else][Actor][end if] [relieve] ourself of [our] bodily wastefluids." (A);
	
Urinating on is an action applying to one touchable thing.
The specification of the urinating on action is "Urinating on is the act of leting go of your bodily wastefluids in/on a designated location. By default, the action ensures that the actor has a need to perform the act, it's up to the story to state that a person needs to urinate. It also ensures that the target of the action is either a container or a person; it does not actually transfer anything to the target.
The story should keep track of the results of this activity, and also control where the player is allowed to do so.
There is no check for what the actor is wearing."
Understand "urinate on/in [something]" as urinating on.

Check an actor urinating on (this is the need to urinate on rule):
	If the actor is does not need to urinate, say "[If the player is the actor][We][else][Actor][end if] [have] no need to urinate right now." (A);

Check an actor urinating on (this is the urinate on target rule):
	If the noun is a person or the noun is a container:
		Continue the action;
	Else:
		Say "[If the player is the actor][We][else][Actor][end if] [cannot] urinate on [noun]!" (A);

Carry out an actor urinating on (this is the basic urinating on rule):
	Now the actor is does not need to urinate;

Report an actor urinating (this is the basic report urinating on rule):
	Say "[If the player is the actor][We][else][Actor][end if] [relieve] ourself of [our] bodily wastefluids [if noun is a container]in[else]on[end if] [noun]." (A);

Book 5 - Integrations

Part 5.1 - Consent (for use with Consent by Fictitious Frode)

[This determines which actions should be governed by the consent rules.]

Spanking is consensual.
Spanking something with something is consensual.

Tying a person to something is consensual.
Tying a body part to something is consenual.

Gagging a person with something is consensual.
Ungagging a person is consensual.

Part 5.2 - Action Descriptions

Gagging a person with something is being rough.

Spanking is being rough.
Spanking something with something is being rough.
Spanking an indecent body part is being sexual.
Spanking an indecent body part with something is being sexual.

Part 5.3 - Limits

Kinky Story Actions ends here.

---- DOCUMENTATION ----

Chapter - Using this Extension

This extension defines (or enables, for the commands that are defined in the standard rules) the commands, does basic checking, and provides a default reporting rule. Therefore, no other activation is needed than including this extension. However, in order for the player to receive any reasonable input, the story author needs to define a more descriptive outcome for these actions.

Inform offers several ways to do this, described in Chapter 12.2 ("How actions are processed"), but the best way supported by this framework is using the After rulebook. Some things to remember: A kissing B is not the same as B kissing A; and in order to command other actors to perform, persuasion rules must be defined. It's also worth looking at chapter 12.12 for how to make better failure messages.

If used together with Garments or Erotic Story Actions, this extension needs to be loaded after those to be completely integrated.

Section - Actions

	* Spanking (with)
	* Tie (with)/Untie (via Ropework)
	* Gagging with
	* Urinating (on)

Section - Paraphernalia

This extension introduces a few new kinds.

	* Rope (from Ropework): Can be used to attach various things to each other. See the ropework extension for full details.
	* Cuffs: [TODO]
	* Gag: A wearable (garment if Garments extension is used) that when worn gags the person.

Chapter - The Actions

This extension contains the necessary framework to enable the kinky activities of spanking, bondage, gagging and wet.

	* Spanking (with)
	* Tie (with) (via Ropework)
	* Gagging with
	* Urinating (on)
	
Section - Spanking

The spanking action is enabled on persons and body parts, and ensures that the target is reachable. It does *not* check that the target is not enclosed by the actor, as we might want to have characters spank themselves.
We also provide a 'spanking it with' action in order to allow things to be used to spank with. Because it's not feasible to keep a generic list of items that can be used to spank with, this action blocks (almost) all attempts, and is intended for the author to write 'instead of' rules around. The one exception is spanking with hands attached to the actor, which will redirect to the implicit spanking action instead.

See the section on Body Parts below for some ideas on how to use this action.

Section - Bondage

Most of the groundwork for the bondage part is done by the Ropeworks extension, which handles the use of rope. In order for that extension to do it's work, the persons or body parts we want to restrain must be marked as attachable. By default hands and legs are made attachable, and attempts to tie a person that is not attachable will redirect to first hands, secondly legs, and lastly a random attachable body part.

Section - Gagging

A person wearing a gag is considered to be gagged, which will stop any actions attempting to communicate with that person. This includes telling a gagged person about something, as it's implicit in the action that the other party is able to reply to what they're told.
Gags can either be worn voluntarily (by just 'wear gag'), or forcefully by another character ('gag person with gag')

Section - Wet

Chapter - Integration with Other Parts of the Framework

Kinky Story Actions is just one part of a larger framework, and it's important to understand how it interacts with the other parts. It relies on body parts and consent to provide a solid foundation, and either (or both) of the clothing extensions. 

While not a requirement for using this extension, the use of Erotic Story Actions is more or less implied, as it enables the "basic AIF" functionality that this extension expands upon.

If used together with Garments or Erotic Story Actions, this extension needs to be loaded after those to be completely integrated.

Section - Consent

When asking another person in a story to try doing an action, that person's persuasion rules are consulted. These rules are only consulted when that person is the active participant, but for erotic stories we should also check if they are a willing secondary participant. Therefore the consent extension is used to provide a method for persons to consent to the various erotic actions, and a way to customize the messages when lack of consent blocks the action.

See the Consent extension for more details; or see Erotic Story Actions for examples on how to use consent in a story.

Note that tying a person or a body part is consensual, but not tying "normal" things.

Section - Body Parts

Body parts are an integral part of erotic stories, and the Body Part extension provides a range of ready made body parts that can be made part of actors in a story. The Body Part extension has the complete details on this, and Erotic Story Actions has examples on how to use this in a story.

One consequence of using Body Parts is that the range of valid targets for a player's actions increases drastically. For the standard AIF commands this is a good thing, but not all kinky actions make sense to be performed on body parts. By default, the framework supports the use of these kinky actions on both persons and body parts, but an author might for simplicity's sake redirect some of these actions away from body parts and onto the person. Below is a small example on how this might be accomplished. (Remember to also redirect the ...with actions!)

*:
	Instead of an actor spanking something that is enclosed by a person (called P), try spanking P instead.
	Instead of an actor spanking something that is enclosed by a person (called P) with something, try spanking P with the second noun instead.

There are other techniques that can be employed with a similar effect. It's possible to build a quite complex nesting mechanic in the After rulebook, that can give specific messages for given combinations. Just remember to take into account both the actor and the target, as well as the ...with actions!

*:
	After an actor spanking something (called target):
		If target is a body part:
			If target is:
				-- an ass: Say "Generic ass-spanking message.";
				-- otherwise: Say "Generic body part message, that can reference the [target].";
		If target is a person:
			If target is:
				-- A specific person: Say "Special message for that person.";
				-- otherwise: Say "Generic message.";
	

Chapter - Expanded Tutorial: Incorporating BDSM into a Story

It's assumed that the reader is familiar with the tutorial from Erotic Story Actions; this tutorial expands upon what's presented there in order to incorporate elements of BDSM play into a story.

Section - Setting and Characters

Section - Safe, Sane and Consensual (or not?)

Section - Locations and Items


Chapter - Technical Notes

If for some reason the report rulebook is used instead of the after rulebook, you need to end the responses with "instead" or the default reporting rule will be processed. If using the before or instead rulebooks, remember that this happens before the action is checked to see if all requisites are met.

For consent, if the "instead" is left off the consent denied for rules, then the default error message will be printed. To expand consent to apply to other actions, specify that the action is consensual.

Two things are currently missing from the framework: An implementation of handcuffs, and a list of restricted actions for when a person is restrained by rope (Movement when tied to something static is handled by the ropework itself though).

Section - Version History

Section - Contact Info

The author of the framework can be reached in the following ways:

	* Mail: fictitious.frode@gmail.com
	* Blog: https://informedaif.wordpress.com/ is a blog dedicated to writing AIF with Inform 7, and is the official host of the framework. It contains both dicussions around AIF and tutorials on both Inform in general and this framework in particular.
	* Reddit: https://www.reddit.com/r/AIFCentral/ is the subreddit for the AIF community, and the author checks this regularly.

Feedback of all varieties is welcome, but constructive criticism and discussion is the most appreciated, along with reports of bugs and other issues. For support I would appreciate using public communication, so that other may learn from the request as well.
