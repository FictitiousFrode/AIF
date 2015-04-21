Version 2 of Erotic Story Actions by Fictitious Frode begins here.

"Enables the sexual actions kissing, licking, touching, rubbing, masturbating and fucking."
Include Version 3 of Body Parts by Fictitious Frode.
Include Version 1 of Consent by Fictitious Frode.

Book 1 - Paraphernalia

[Sex toy is a kind of thing that is by default penetrating (but can be changed to orificial or non-sexual as needed). The fucking action knows to try to use this if neither of the involved parties have anything else to penetrate with.]

A sex toy is a kind of thing.
A sex toy is usually penetrating.

A strapon is a kind of sex toy.
A strapon is wearable.

Book 2 - Actions

Part 2.1 - Kissing

[Kissing is already covered in the Standard Rules, but it's disabled by default.
We also  need to do some basic checks on what can be kissed, and provide a default report message.
If the person kissed has a mouth, we redirect to that.]

Understand "Kiss [body part]" as kissing.
The block kissing rule is not listed in the check kissing rulebook.
To kiss is a verb.

Does the player mean kissing a person: It is likely.
Does the player mean kissing the player: It is very unlikely.
Does the player mean kissing something that is part of the player: It is very unlikely.

Section - Check

[Control what can be kissed]
Check an actor kissing (this is the self kissing rule):
	If the noun is the actor, Say "Kissing yourself [are not] very productive." (A) instead;
	If the noun is enclosed by the actor, Say "Kissing parts of yourself [are not] very productive." (B) instead;
[Instead of licking/sucking a person, try to redirect to their main sex organ.]
Check an actor kissing someone (this is the implicit kissing rule):
	If the noun is enclosing a mouth (called target):
		Try the actor kissing the target instead;
Check an actor kissing (This is the kissing viability rule):
	If the noun is not a person and the noun is not a body part:
		Say "[If the player is the actor][We][else][Actor][end if] [do not] want to kiss that." (A) instead;

Section - Default Report

[Default response]
Report  an actor kissing:
	Say "[If the player is the actor][We][else][Actor][end if] [kiss] [noun].";

Part 2.2 - Oral (Licking/Sucking)

[Licking is a new action]
Licking is an action applying to one thing.
The specification of the licking action is "This action is intended for when the actor uses their mouth on something, and responds to commands like LICK ANNA or SUCK BANANA. Attempts to lick oneself in whole or parts is blocked, and by default only works on persons and body parts which are set to be lickable."
Understand "lick [something]" and "suck [something]" as licking. 
To lick is a verb.

Does the player mean licking a vagina: It is very likely.
Does the player mean licking a penis: It is very likely.
Does the player mean licking a person: It is likely.
Does the player mean licking the player: It is very unlikely.
Does the player mean licking something that is part of the player: It is very unlikely.

Section - Check

Check an actor licking (this is the self licking rule):
	If the noun is enclosed by actor or the noun is the actor:
		Say "Licking yourself [are not] very productive." (A) instead;
[Instead of licking/sucking a person, try to redirect to their main sex organ.]
Check an actor licking someone (this is the implicit licking rule):
	If the noun is enclosing a vagina (called target):
		Try the actor licking the target instead;
	If the noun is enclosing a penis (called target):
		Try the actor licking the target instead;
	Say "[Regarding the actor][We] [cannot] find anything on [noun] to lick." (A) instead;
[Check that the target is a lickable body part]
Check an actor licking (this is the licking viability rule):
	If the noun is not a lickable body part:
		Say "[Regarding the actor][We] [cannot] lick [noun]." (A) instead;

Section - Default Report

[Default response]
Report an actor licking: 
	Say "[If the player is the actor][We][else][Actor][end if] [lick] [noun].";

Part 2.3 - Biting

[Biting is a new action]
Biting is an action applying to one thing.
The specification of the biting action is "This action is intended for when the actor bites something, and responds to commands like BITE ANNA or BITE BANANA. Attempts to bite oneself in whole or parts is blocked, and by default only works on persons and body parts which are set to be lickable. Attempts to bite something edible is redirected to eating it instead, and attempts to bite a person tries to redirect to biting their mouth."
Understand "bite [someone]" and "bite [body part]" as biting.
Understand "bite [something edible]" as eating.
To bite is a verb.

Does the player mean biting a person: It is likely.
Does the player mean biting the player: It is very unlikely.
Does the player mean biting something that is part of the player: It is very unlikely.

Section - Check

Check an actor biting (this is the self biting rule):
	If the noun is enclosed by actor or the noun is the actor:
		Say "Licking yourself [are not] very productive." (A) instead;
Check an actor biting someone (this is the implicit biting rule):
	If the noun is enclosing a mouth (called target):
		Try the actor biting the target instead;
Check an actor biting (this is the biting viability rule):
	If the noun is not a lickable body part:
		Say "[Regarding the actor][We] [cannot] bite [noun]." (A) instead;

Section - Default Report

[Default response]
Report an actor biting: 
	Say "[If the player is the actor][We][else][Actor][end if] [bite] [noun].";

Part 2.4 - Touching/Caressing

[Touching is already covered in the Standard Rules.
Touching is "passive touching" where the player feels something, while rubbing is "active touching" where the player actively rubs or massages something.
There is nothing to check or report for touching.]
Understand "caress [something]" and "feel [something]" as touching.
To touch is a verb.
To caress is a verb.

Does the player mean touching an indecent body part: It is very likely.
Does the player mean touching a body part: It is likely.
Does the player mean touching a person: It is unlikely.
Does the player mean touching the player: It is very unlikely.
Does the player mean touching something that is part of the player: It is very unlikely.

Part 2.5 - Rubbing/Fingering

[Rubbing is already covered in the Standard Rules, but it's disabled by default.
Rubbing oneself is masturbation, and redirected as such.
Default checking and reporting covered by the Standard Rules.]
The specification of the rubbing action is "This action is intended for when the actor uses their hands to rub something, and reponds to commands like RUB ANNA, MASSAGE ANNA'S BREASTS, etc. It only works only body parts that are set to rubbable. Attempts to rub oneself is redirected to masturbation."
The can't rub another person rule is not listed in the check rubbing rulebook.
Understand "massage [something]", "rub [something]", "finger [something orificial]", "fondle [something]" as rubbing. 

To rub is a verb.
To massage is a verb.

Does the player mean rubbing an indecent body part: It is very likely.
Does the player mean rubbing a body part: It is likely.
Does the player mean rubbing a person: It is unlikely.
Does the player mean rubbing the player: It is very unlikely.
Does the player mean rubbing something that is part of the player: It is very unlikely.

Section - Check

[Rubbing yourself is masturbation.]
Check an actor rubbing (this is the self massaging rule):
	If the noun is enclosed by the actor or the noun is the actor:
		Try the actor masturbating instead;
Check an actor rubbing (this is the rubbing viability rule):
	If the noun is not a rubbable body part:
		Say "[Regarding the actor][We] [cannot] rub [noun]." (A) instead;

Part 2.6 - Pinching

[Pinching is a new action]
Pinching is an action applying to one thing.
The specification of the pinching action is "This action is intended for when the actor pinches something, and responds to commands like PINCH ANNA or PINCH ANNA'S ASS. Attempts to pinch oneself in whole or parts is blocked."
Understand "pinch [someone]" and "pinch [body part]" as pinching.
To pinch is a verb.

Section - Check

Check an actor pinching (this is the self pinching rule):
	If the noun is enclosed by actor or the noun is the actor:
		Say "Pinching yourself [are not] very productive." (A) instead;
Check an actor pinching (this is the pinching viability rule):
	If the noun is not a rubbable body part:
		Say "[Regarding the actor][We] [cannot] pinch [noun]." (A) instead;

Section - Default Report

[Default response]
Report an actor pinching: 
	Say "[If the player is the actor][We][else][Actor][end if] [pinch] [noun].";

Part 2.7 - Masturbation

Chapter - Default

Masturbating is an action applying to nothing.
The specification of the masturbating action is "This action is intended for when the actor pleasures themself. The story author should add checks to see if there is a reason for masturbating. By default, this action is disabled with the disable masturbation rule."
Understand "masturbate", "jackoff", "jilloff", "jack off" and "jill off" as masturbating. 

[TODO]
Masturbating with is an action applying to one touchable thing.

[TODO: To/For something]
Masturbating to is an action applying to one visible thing.

To masturbate is a verb.

Section - Check

[Masturbation is disable by default.]
Check an actor masturbating (this is the no masturbating rule):
	If the actor is the player:
		Say "[regarding the player][We] [don't] feel like doing that right [now]." instead;
	Say "[The actor] [don't] want to do that." instead;

Section - Report

[Default responses]
Report an actor masturbating: 
	Say "[If the player is the actor][We][else][Actor][end if] [masturbate].";
Report an actor masturbating with a thing (called T): 
	Say "[If the player is the actor][We][else][Actor][end if] [masturbate] with [T].";
Report an actor masturbating to a thing (called T): 
	Say "[If the player is the actor][We][else][Actor][end if] [masturbate] to [T].";

Part 2.8 - Fucking

[Fucking is a very complex action, and is the act of putting something penetrating into something orificial.]
Fucking it with is an action applying to one touchable thing and one thing.
The specification of the fucking it with action is "Fucking it with is the action of putting something into something else. By default it expects to receive an orifice to put something penetrating into. It will also take a person as it's only input, and go through a complex calculation to find the proper orificial and penetrating objects."
Understand "fuck [something orificial] with [something penetrating]" as fucking it with.
Understand "fuck [something penetrating] with [something orificial]" as fucking it with (with nouns reversed).
Understand "fuck [someone]" as fucking it with.

To fuck is a verb.

Section - Deciding on missing nouns

Does the player mean fucking something with a penis: it is very likely.
Does the player mean fucking a vagina with a penis: It is very likely.
Does the player mean fucking a vagina with something: it is very likely.
Does the player mean fucking something with a sex toy that is carried by actor: It is likely.

Rule for supplying a missing second noun while an actor fucking:
	Let actor be the person asked;
	If noun is an orificial thing:
		[Find a penetrator]
		If actor is enclosing a penis (called P):
			Now the second noun is P;
			Continue the activity;
		If the actor is wearing a strapon (called P):
			Now the second noun is P;
			Continue the activity;
		If the actor carries a penetrating sex toy (called P):
			Now the second noun is P;
			Continue the activity;
	Else if noun is a penetrating thing:
		[Find an orifice; Nouns are reversed so both must be updated]
		If actor is enclosing a vagina (called V):
			Now the second noun is the noun;
			Now the noun is V;
			Continue the activity;
		Else if actor is enclosing an ass (called A):
			Now the second noun is the noun;
			Now the noun is A;
			Continue the activity;
		Else if actor is enclosing an orificial body part (called O):
			Now the second noun is the noun;
			Now the noun is O;
			Continue the activity;
	Else if noun is a person:
		If actor is enclosing a penis (called P):
			[Find an orifice; Nouns are reversed so both must be updated]
			If noun is enclosing a vagina (called V):
				Now the second noun is P;
				Now the noun is V;
				Continue the activity;
			If noun is enclosing an ass (called A):
				Now the second noun is P;
				Now the noun is A;
				Continue the activity;
			If noun is enclosing an orificial body part (called O):
				Now the second noun is P;
				Now the noun is O;
				Continue the activity;
		If actor is wearing a strapon(called P):
			[Find something to fuck it with]
			If actor is enclosing a vagina (called V):
				Now the second noun is P;
				Now the noun is V;
				Continue the activity;
			If noun is enclosing an ass (called A):
				Now the second noun is P;
				Now the noun is A;
				Continue the activity;
			If noun is enclosing an orificial body part (called O):
				Now the second noun is P;
				Now the noun is O;
				Continue the activity;
		If noun is enclosing a penis (called P):
			[Find something to fuck it with]
			If actor is enclosing a vagina (called V):
				Now the second noun is P;
				Now the noun is V;
				Continue the activity;
		 If actor carries a penetrating sex toy (called P):
			[Find something to use the toy on]
			If  noun is enclosing a vagina (called V):
				Now the second noun is P;
				Now the noun is V;
				Continue the activity;
	Say "[If the player is the actor][We][otherwise][Actor][end if] [do not] have anything to fuck [noun] with.";

Section - Validation

[Reverse nouns if needed. This probably is not needed, but better safe then sorry.]
Instead of an actor fucking something penetrating (called P) with something orificial (called O), try the actor fucking O with P;

[Make sure that both nouns are not covered by clothing]
Check an actor fucking something (called target) with something (called penetrator) (This is the implied stripping when fucking rule):
	If target is a body part enclosed by a person (called P):
		While target underlies something (called impediment) worn by P:
			If P is the player:
				Say "(first removing [the impediment])[command clarification break]";
				Silently try taking off the impediment;
				If target underlies the impediment, rule fails;
			Else:
				Say "[P]'s [impediment] [are] in the way." instead;
	If penetrator is a body part enclosed by a person (called P):
		While penetrator underlies something (called impediment) worn by P:
			If P is the player:
				Say "(first removing [the impediment])[command clarification break]";
				Silently try taking off the impediment;
				If target underlies the impediment, rule fails;
			Else:
				Say "[P]'s [impediment] [are] in the way." instead;

[Make sure that actor is in control of atleast one of the nouns]
Check an actor fucking something (called target) with something (called penetrator) (This is the fucking control rule):
	Let control be false;
	[If both are body parts, actor must own one of them]
	If target is a body part enclosed by actor, let control be true;
	If penetrator is a body part enclosed by actor, let control be true;
	[If either is a loose thing, actor must be holding or wearing]
	If target is not a part of something:
		If target is carried by actor, let control be true;
	If penetrator is not a part of something:
		If penetrator is carried by actor, let control be true;
	If control is false, say "[If the player is the actor][We][otherwise][Actor][end if] must control atleast one of the involved parts." (A) instead;

[Make sure that both nouns are not body parts of the same actor]
Check an actor fucking a body part (called target) with a body part (called penetrator) (This is the cannot fuck yourself rule):
	If target is part of the actor and penetrator is part of the actor, say "Fucking oneself is not very productive." (A) instead;

Section - Default Report

Report an actor fucking something (called target) with something (called penetrator):
	Say "[If the player is the actor][We][otherwise][Actor][end if] [fuck] [noun] with [second noun].";

Chapter - Assfucking

Assfucking is an action applying to one touchable thing.
The specification of the assfucking action is "This is just a redirect wrapper for the fucking it with action."
Understand "assfuck [something]" as assfucking.

Check an actor assfucking a person (called target):
	If target is enclosing an ass (called A), try the actor fucking A with instead;
	Say "[If player is the target][We][else][Target][end if] [do not] have an ass [if actor is player][we][else][actor][end if] [can] fuck." instead;
Check an actor assfucking an ass (called A):
	Try the actor fucking A with instead;
Check an actor assfucking something (called target) (this is the block assfucking rule):
	If target is not a person, say "[If the player is the actor][We][otherwise][Actor][end if] [cannot] fuck [noun]." (A) instead;

Chapter - Titfucking

Titfucking is an action applying to one touchable thing.
The specification of the titfucking action is "This is just a redirect wrapper for the fucking it with action."
Understand "titfuck [something]" as titfucking.

Check an actor titfucking a person (called target):
	If target is enclosing a pair of breasts (called B), try the actor fucking B with instead;
	Say "[If player is the target][We][else][Target][end if] [do not] have breasts [if actor is player][we][else][actor][end if] [can] fuck." instead;
Check an actor titfucking a pair of breasts (called B):
	Try the actor fucking B with instead;
Check an actor titfucking something (called target) (this is the block titfucking rule):
	If target is not a person, say "[If the player is the actor][We][otherwise][Actor][end if] [cannot] fuck [noun]." (A) instead;

Book 3 - Consent

Part 3.1 - Consensual Actions

[This determines which actions should be governed by the consent rules.]

Kissing a person is consensual.
Kissing a body part is consensual.

Licking a person is consensual.
Licking a body part is consensual.

Biting a person is consensual.
Biting a body part is consensual.

Touching a person is consensual.
Touching a body part is consensual.

Rubbing a person is consensual.
Rubbing a body part is consensual.

Pinching a person is consensual.
Pinching a body part is consensual.

Fucking is consensual.

Part 3.2 - Action Descriptions

[These classifications are not used by the framework, but left in for the author to latch on to and possible future expansion.]

Kissing a person is being erotic.
Kissing a body part is being erotic.
Kissing an indecent body part is being sexual.

Licking a person is being erotic.
Licking a body part is being erotic.
Licking an indecent body part is being sexual.

Biting a person is being rough.
Biting a body part is being rough.
Biting an indecent body part is being sexual.

Touching a person is being erotic.
Touching a body part is being erotic.
Touching an indecent body part is being sexual.

Rubbing a person is being erotic.
Rubbing a body part is being erotic.
Rubbing an indecent body part is being sexual.

Pinching a person is being rough.
Pinching a body part is being rough.
Pinching an indecent body part is being sexual.

Masturbating is being sexual.
Masturbating with is being sexual.
Masturbating to is being sexual.

Fucking with is being sexual.
Fucking with is being penetrating.

Erotic Story Actions ends here.

---- DOCUMENTATION ----

This extension provides the necessary actions for creating an erotic story, and a framework for actors to provide consent to these actions.

Chapter: Using this Extension

Section: Actions

This extension defines (or enables, for the commands that are defined in the standard rules) the commands, does basic checking, and provides a default reporting rule. Therefore, no other activation is needed than including this extension. However, in order for the player to receive any reasonable input, the story author needs to define a more descriptive outcome for these actions.

Inform offers several ways to do this, described in Chapter 12.2 ("How actions are processed"), but the best way supported by this framework is using the After rulebook. Some things to remember: A kissing B is not the same as B kissing A; and in order to command other actors to perform, persuasion rules must be defined. It's also worth looking at chapter 12.12 for how to make better failure messages.

Section: Paraphernalia

The extension contains two kinds of paraphernalia, that are intended for use with the fucking action:

Sex toy is a kind of thing that is by default penetrating (but can be changed to orificial or non-sexual as needed). The fucking action knows to try to use this if neither of the involved parties have anything else to penetrate with.

A strapon is a special kind of sex toy that can be worn, and will take precedence on use over carried sex toys if it is worn. A small warning; asking a woman who is wearing a strapon to fuck another person, will take precedence to fucking any available orifice, instead of the other person trying to fuck the first woman if possible.

Chapter: The Actions

Deciding on exactly which actions are needed is a hard task, as they are often variations on a theme. To start with, I've settled on soft and normal touching and mouth-using, as well as various forms of fucking. Kissing and licking/sucking are the soft and normal actions with the mouth, while touch/caress and rub/finger are the soft and normal touch methods. In the future this might be expanded to rough use, such as pinch and bite.

	* Soft mouth: Kissing
	* Medium mouth: Licking (Also responds to "suck")
	* Rough mouth: Biting
	* Soft hands: Touching (Also responds to "caress" and "feel")
	* Medium hands: Rubbing (Also responds to "massage", "fondle" and "finger")
	* Rough hands: Pinching 
	* Masturbating
	* Fucking (something orificial with something penetrating)

These actions are also classified as either being erotic, being sexual, being rough or being penetrating. The extension does not currently do anything with these classifications, they are provided for the benefit of the author.

Section: Kissing

Kissing is a standard actions in Inform that is disabled by default. This expansion enables it, but checks that only persons and body-parts can be kissed, as well as dis-allowing kissing yourself or any of your body parts. If the person kissed has a mouth, the action redirects to kissing that instead. Example A shows kissing in action.

Kissing a person or body part is being erotic, while kissing an indecent body part is being sexual.

Note: There is currently no check that the noun is not covered.

Section: Licking

Licking and sucking is a new action that for simplicity has been combined into the licking action. Licking anything other than persons and body parts is stopped, and licking a person tries to redirect to an attached vagina or penis. Trying to lick oneself (or your own body parts) are stopped, other body parts are checked that they are lickable (a property defined in Volume 1 - Body Parts). This means that the number of lickable objects is very few in practice, and the action that needs to be reported is "licking a body part". Example B shows licking in action.

Licking a person or body part is being erotic, while licking an indecent body part is being sexual.

Note: There is currently no check that the noun is not covered.

Section: Biting

Biting is a new action that works on just persons and body parts that have been marked as lickable. Biting a person will try to redirect to biting their mouth, if they have one. Example C shows licking in action.

Biting a person or body part is being rough, while biting an indecent body part is being sexual.

Note: There is currently no check that the noun is not covered.

Section: Touching

Touching is a standard action in Inform, with a default response that implies the action did not happen. There is no actual blocking of the action though, so a normal after rule will make it work. "Caress" and "Feel" are added as synonyms of touching. Example D shows touching in action.

Touching a person or body part is being erotic, while touching an indecent body part is being sexual.

Note: There is currently no check that the noun is not covered.

Section: Rubbing

Rubbing is another standard action, that by default does nothing. The framework gives it a default response, and adds massage and fondle as generic synonyms, and fingering an orifice as a specific synonym. Trying to rub yourself is redirected to masturbation. Example E shows rubbing in action.

Rubbing a person or body part is being erotic, while rubbing an indecent body part is being sexual.

Note: There is currently no check that the noun is not covered.

Section: Pinching

Pinching is a new action that works on just persons and body. Example F shows licking in action.

Pinching a person or body part is being rough, while pinching an indecent body part is being sexual.

Note: There is currently no check that the noun is not covered.

Section: Masturbation

Masturbation is a new action that is disabled by default. To enable it, disable the "no masturbating" rule. Example G shows masturbation in action.

Masturbation is being sexual.

Note: There is currently no check for what the actor is wearing.

Section: Fucking

Fucking is a new action, and is the real meat of this extension. It's a very complex action, but boils down to putting a penetrating thing into an orificial thing. While the action itself takes two things, support is added for the player to use more generic commands, such as "Fuck person" or "Person fuck me". Orificial and penetrating is a property added to all things by volume 1, which also applies this to certain body parts in the manner expected. This volume also adds a seperate "sex toy" thing, that is penetrating by default, and these will be implicitly used by actors told to fuck.

It requires that atleast one of the participants has something penetrating and the other something orificial (preferably vagina, but it does support custom body parts). The action ensures that the actor is in control of atleast one of the two things involved, and that both things are not covered by clothing or part of the same person. There are also two helper commands for the player, "Assfuck someone" and "titfuck someone"; these redirect to using the fucking it with action if the target person has the requisite body part.

Fucking is both sexual and penetrating.

Example H shows how to use the fucking action.

Chapter: Integration with Other Parts of the Framework

Erotic Story Actions is just one part of a larger framework, and it's important to understand how it interacts with the other parts. It relies on body parts and consent to provide a solid foundation, and either (or both) of the clothing extensions. It's also possible to expand upon the actions provied by using other Story Action components, or swapping to the Sexual Simulator System for a different experience.

Section: Consent

When asking another person in a story to try doing an action, that person's persuasion rules are consulted. These rules are only consulted when that person is the active participant, but for erotic stories we should also check if they are a willing secondary participant. Therefore the consent extension is used to provide a method for persons to consent to the various erotic actions, and a way to customize the messages when lack of consent blocks the action.

See the Consent extension for more details; All the examples in this extension shows a blanket consent in order to showcase the actions, but Example I shows consent in detail, while Example J contains a mini-adventure with more complex rules for consent.

Note that a person is distinct from their body parts for these purposes, and you might want to use something like this:

*:
	Consent rule for doing something to Annie: consent given.
	Consent rule for doing something to a thing that is part of Annie: consent given.
	Consent rule for fucking something with something: consent given.

Section: Body Parts

Body parts are an integral part of erotic stories, and the Body Part extension provides a range of ready made body parts that can be made part of actors in a story. The Body Part extension has the complete details on this, but the following should add most body parts needed for a normal story:

*:
	A pair of feet is a part of every person.
	A chest is a part of every man.
	A pair of breasts is a part of every woman.
	A mouth is a part of every person.
	Some hair is a part of every person.
	An ass is a part of every person.
	A penis is a part of every man.
	A vagina is a part of every woman.

In order to avoid strangely named parts, it's best to do this after all actors have been defined, and the identity of the player has been set. These would then need to be given descriptions for every relevant actor. Example J contains a complete mini-adventure that highlights this.

Section: Clothing

The framework contains two different extensions for handling clothing. These build on the same principles and are compatible with each other, but for simplicity's sake it's  best to stick to one type of clothing for a story. Garments implements layered clothing that can be individually manipulated by the player. Outfits is a simpler clothing system, where dressing and undressing takes place between-scenese. This is less flexible, but easier to work with and allows for having reactions to what the player is wearing.

Section: Other Action Extensions

The actions in this extensions can be expanded upon by using the Kinky Story Actions to provide support for BDSM activities such as bondage, spanking and gagging. These two extensions are compatible and do not rely on each other in any way.

The Sexual Simulator System is an extension that provides a different approach to storytelling, where the player has more control of the details in the encounter. This extension is not yet published.

Chapter: Expanded Tutorial: Writing Erotic Stories

TODO

Example J contains a complete mini-adventure that highlights how this extension can be used to create an erotic story.

Chapter: Technical Notes

This extension was known as Sexual Actions in it's first release, but that name was changed in this release to better reflect the style of adventure best supported by the extension.

If for some reason the report rulebook is used instead of the after rulebook, you need to end the responses with "instead" or the default reporting rule will be processed. If using the before or instead rulebooks, remember that this happens before the action is checked to see if all requisites are met.

For consent, if the "instead" is left off the consent denied for rules, then the default error message will be printed. To expand consent to apply to other actions, specify that the action is consensual.

Section: Version History

Release 2 (v1.0):

	Extension renamed from Sexual Actions.
	Consent framework added.
	Improved understanding of what the player means.
	Added biting and pinching as actions.
	Checked that body part is rubbable for the rubbing and pinching actions.
	Added strapon, integrated into the fucking action.
	Kissing now defaults to a person's mouth, if present.

Section: Contact Info

The author of the framework can be reached in the following ways:

	* Mail: fictitious.frode@gmail.com
	* Blog: https://informedaif.wordpress.com/ is a blog dedicated to writing AIF with Inform 7, and is the official host of the framework. It contains both dicussions around AIF and tutorials on both Inform in general and this framework in particular.
	* Reddit: https://www.reddit.com/r/AIFCentral/ is the subreddit for the AIF community, and the author checks this regularly.

Feedback of all varieties is welcome, but constructive criticism and discussion is the most appreciated, along with reports of bugs and other issues. For support I would appreciate using public communication, so that other may learn from the request as well.

Example: * Kissing - Altering the response of the kissing action.

	The Bedroom is a room.
	Annie is a woman in the bedroom.
	Persuasion rule for asking Annie to try kissing something: persuasion succeeds.
	Consent rule for doing something to Annie: consent given.

	After kissing Annie, say "You lean over and give Annie a big smooch."
	After Annie kissing someone, say "Annie kisses [noun]."

	Test kissing with "kiss Annie / Annie, kiss me".

Example: * Licking - Making feet lickable, and altering the response for licking them.

	The Bedroom is a room.
	Annie is a woman in the bedroom.
	A pair of feet is usually lickable.
	A pair of feet is a part of every person.
	Persuasion rule for asking Annie to try licking something: persuasion succeeds.
	Consent rule for doing something to a thing that is part of Annie: consent given.

	After licking Annie's pair of feet, say "You gently lick Annie's feet."

	Test licking with "Lick Annie / Lick Annie's feet / Annie, lick my feet."

Example: * Biting - Making feet lickable, and altering the response for biting them.

	The Bedroom is a room.
	Annie is a woman in the bedroom.
	A pair of feet is usually lickable.
	A pair of feet is a part of every person.
	Persuasion rule for asking Annie to try biting something: persuasion succeeds.
	Consent rule for doing something to a thing that is part of Annie: consent given.

	After biting Annie's pair of feet, say "You naughtly bite Annie's feet."

	Test biting with "Bite Annie / Bite Annie's feet / Annie, bite my feet."

Example: * Touching - Altering the response of the touching action.

	The Bedroom is a room.
	Annie is a woman in the bedroom.
	A pair of feet is a part of every person.
	Persuasion rule for asking Annie to try touching something: persuasion succeeds.
	Consent rule for doing something to a thing that is part of Annie: consent given.

	After touching Annie's pair of feet, say "You let your hands slide gently over Annie's feet."

	Test touching with "touch Annie / touch Annie's feet / Annie, touch my feet."

Example: * Rubbing - Altering the response of the rubbing action.

	The Bedroom is a room.
	Annie is a woman in the bedroom.
	A pair of feet is a part of every person.
	Persuasion rule for asking Annie to try rubbing something: persuasion succeeds.
	Consent rule for doing something to a thing that is part of Annie: consent given.

	After rubbing Annie's pair of feet, say "You take Annie's feet in your hands, and start rubbing them. She moans in pleasure."

	Test rubbing with "rub Annie / rub Annie's feet / Annie, rub my feet."

Example: * Pinching - Altering the response of the pinching action.

	The Bedroom is a room.
	Annie is a woman in the bedroom.
	A pair of feet is a part of every person.
	Persuasion rule for asking Annie to try pinching something: persuasion succeeds.
	Consent rule for doing something to a thing that is part of Annie: consent given.

	After pinching Annie's pair of feet, say "You take Annie's feet in your hands, and start pinching them. She moans in pain and pleasure."

	Test pinching with "pinch Annie / pinch Annie's feet / Annie, pinch my feet."

Example: * Masturbating - Altering the response of the masturbating action

	The Bedroom is a room.
	Annie is a woman in the bedroom.
	Persuasion rule for asking Annie to try masturbating: persuasion succeeds.
	The no masturbating rule is not listed in any rulebook.

	After masturbating, say "You pull out your equipment and give it a good tug. How pleasureable."

	Test masturbating with "masturbate / Annie, masturbate."

Example: ** Fucking - Altering the response of the fucking action:

	The Bedroom is a room.
	Tyler is a man. The player is Tyler.
	Annie is a woman in the bedroom.
	A vagina is a part of every woman.
	A penis is a part of every man.
	Persuasion rule for asking Annie to try fucking something with something: persuasion succeeds.
	Consent rule for fucking something with something: consent given.

	After fucking Annie's vagina with your penis, say "You gently let your member slide into Annie."
	After Annie fucking Annie's vagina with your penis, say "Annie climbs on top of you, and lets herself slide down on your equipment."

	Test fucking with "Fuck Annie / Annie, fuck me."

Example:  ** Consent - Kissing three different persons with different consent.

	The Library is a room.
	Rachel is a woman in the Library. [Rachel allows kissing]
	Annie is a woman in the Library. [Annie disallows kissing, with a custom failure message.]
	Sarah is a woman in the Library. [Sarah disallwos kissing, with the default failure message.]
	
	Consent rule for kissing Rachel:
		Say "You can say things here, but the response might end up looking weird.";
		consent given.
	
	Consent denied for kissing Annie: Say "Annie doesn't want that." instead;
	
	Test consent with "kiss Rachel / kiss annie / kiss sarah."
