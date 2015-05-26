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

The framework contains two different extensions for handling clothing. These build on the same principles but are not compatible with each other. Garments implements layered clothing that can be individually manipulated by the player. Outfits is a simpler clothing system, where dressing and undressing takes place between-scenese. This is less flexible, but easier to work with and allows for having reactions to what the player is wearing.

Section: Other Action Extensions

The actions in this extensions can be expanded upon by using the Kinky Story Actions to provide support for BDSM activities such as bondage, spanking and gagging. These two extensions are compatible and do not rely on each other in any way.

The Sexual Simulator System is an extension that provides a different approach to storytelling, where the player has more control of the details in the encounter. This extension is not yet published.

Chapter: Expanded Tutorial: Writing Erotic Stories

Writing an AIF game is a great undertaking but also a rewarding experience. The Inside Erin newsletter has a variety of very good articles on the subject, available here:

	http://newsletter.aifcommunity.org/index.php?id=writing.html

This part of the documentation does not take aim to replace or supplant these excellent sources, but instead focuses on how to implement some of the essential tricks using this Inform and this framework. This assumes that the reader is somewhat familiar with basic Inform syntax, but will not assume any expertise.

Section: Setting and Characters

The first part of writing a new story, is to come up with an interesting setting, and the characters and plot to go with it. Perhaps the most important thing to note here is that over-ambition is the real project-killer: Don't start with a concept you can't finish. For your first story, try to keep it small, especially in the amount of characters the player should be allowed to interact with. The AIF community has a long (and proud?) history of fan-fiction; the community evolved out of the newsgroup alt.games.xtrek, devoted to adult fan-fiction involving Star Trek characters. Writing a fan-fiction story has the advantage of providing both setting and characters, and can give ideas for puzzles and events that can unfold in the story.

Once you have a basic idea of the story you're wanting to write, it's time to get started on the writing. Just don't get too attached to your initial concept, as it is likely to change as you develop the story. It's therefore best to focus the initial energy on parts that will remain, or are reusable. I would recommend starting with writing descriptions of the characters you decided upon and their notable body parts, as well as descriptions of the notable locations.

Section: Locations and Items

The only thing that is absolutely required in an Inform story is a location or room, but a story with just an empty room with no description is the very definition of a boring story. In order to give the player immersion in the story, it's important with good descriptions of locations. Note that "good" does not always mean "long"; a good room description should list what is obvious from a quick look around the room without going into excessive detail. The big question then quickly becomes, how much detail is enough, and when is the detail excessive? Any object that is mentioned in the room description should have a description, as well as some objects that a player would expect to be present. Most of these would be implemented as backdrops to avoid the player doing crazy stuff, and they will try it. There are two related issues I would like to point out here: It's important to avoid pointing out key objects too blatantly. From this it follows that it's also important to keep a somewhat equal level of detail across the story.

Another big question, is how many rooms should the story have. Not every place you can think of needs to be implemented as a seperate room, many connecting rooms such as hallways can be skipped past by the use of a "Before going..." rule. This gives the player the impression that world is larger than what you have actually implemented, but saves you the trouble of writing up boring rooms with no purpose, and the player from walking through rooms that serve no other purpose than to make the world seem large. Similarly, you can block off a described area by the use of an "Instead of going..." rule. Below is a very short example of this:

*:
	The Library is a room. "You are standing in the school's library, which is lined with seemingly endless shelves filled with books. A large door leads south to the hallway, and a closet is to the east."
	Some bookshelves is backdrop in the library. The description is "These sturdy shelves are filled with books of all sorts." Understand "shelves / shelf" as bookshelves.
	Instead of going east in the library, say "You have no reason to go hide in the closet."
	Before going south in the library, say "You pass through the door into the hallway, and follow it back to your classroom."
	Your Classroom is a room. "Your classroom is filled with empty desks and chairs. A door leads west to the hallway."
	South of Library is west of Your Classroom.
	Before going west in Your Classroom, say "You wander around the hallways and make your way to the library."
	Test me with "e / s / w."

Perhaps the most important part of writing up the world in this way, is to take the time to test it out. Go exploring in your own world, poke at everything mentioned in the text and see what you manage to "break". It's also time to start giving some thought to what puzzles would fit in, and where the clues and puzzle items would fit in naturally.

Section: Events and Scenes

So far we've been mostly concerned with the physical world, but a story is also a collection of events that the author wants the player to experience. Some stories are more linear in the order these events happen, while others allow them to happen in the order the player stumbles upon them. Inform has an entire concepted dedicated to structuring the story, which is called scenes. Chapter 10 of the documentation deals with this, and I would recommend reading through it now.

One of the most obvious uses of scenes, is to clearly delimit the sex scenes that are going to be a part of the story. This allows us to clearly define how and when it starts, and write rules and responses that only take place during the correct scene. It's also very handy to use these to keep track of which puzzles have been completed.

Section: Clothing and Character Descriptions

By now, you hopefully have an idea of how your story will look like, and how it will unfold. So let's get back to the meat of the work, writing descriptions. Earlier on it was suggested to start writing descriptions, now well show how easy those are to enter into the story. Personally, I like to create all the characters at the very start of the story file along with a small note of their role, sort of like a Dramatis Personae for a play. Then each person gets their own part later on to flesh out details. 

Clothing is another issue, and the descriptions of characters and parts should take into account what the character is currently wearing. The framework offers two options for clothing; Outfits has built in support for descriptions based on what the actor is wearing so instead we will focus on the more advanced Garments extension where descriptions has to be varied manually. This can be achieved by several different methods, as we will shortly see.

What follows is an excerpt from Example J (there's a lot of content cut here), showing how to create and describe body parts with the framework. Exactly which body parts that should be used is a matter of personal opinion, but the parts used should be a pretty normal selection. The most important part is to create the parts after the characters and the player has been defined, to avoid them getting strange names. Normally you would stick to one method for describing characters and parts, but here we will use different methods to illustrate different techniques. I make no promises on the quality of the text here.

:*
	Include Body Parts by Fictitious Frode. [This isn't needed if you're importing any of the extensions relying on it]
	Include Garments by Fictitious Frode. [This includes Body Parts.]

	[Create the characters here, with quick reference of their role]
	Tyler is a man. The player is Tyler.
	Helena is a woman. [A swedish blonde airhead, with kinky tendencies.]

	Observation Lounge is a room. "This large room is well decorated, and you can almost forget that the large mirrors on the wall most likely conceals cameras or live observeres."

	A pair of feet is a part of every person.
	A mouth is a part of every person.
	Some hair is a part of every person.
	An ass is a part of every person.
	A chest is a part of every man.
	A penis is a part of every man.
	A pair of breasts is a part of every woman.
	A vagina is a part of every woman.
	
	[We start with a basic description of the clothing and the person.]
	A pair of sneakers is a pair of shoes worn by Helena. The description is "It's Helena's sneakers. There's nothing special about them."
	A lacy black thong is a pair of panties worn by Helena. The description is "[If black thong is worn by Helena]The lacy black thong fits Helena's curves snuggly.[else]It's Helena's lacy black thong. It still looks hot, even if she isn't wearing it."
	A lacy black bra is a bra worn by Helena.
	A cut-off denim shorts is a pair of trousers worn by Helena. The description is "[If denim shorts is worn by Helena]Helena is wearing a pair of cut-off shorts that really show off her perky buttocks and long legs.[else]It's Helena's pair of cut-off shorts. They don't look like much when she's not wearing them."
	[For her blouse, we want to give a rather complex description, so we split the description off into a Saying rule:]
	A white low-cut blouse is a shirt worn by Helena. The description is "[Helena's shirt description]"
	
	To say Helena's shirt description:
		If white blouse is worn by Helena:
			Say "Helena is wearing a white blouse that is cut low to show off her ample cleavage";
	[This will run the sentence on, as it didn't end in punctuation.]
			If Helena is wearing black lacy bra, say ", and the frilly edges of a black bra";
			Say ".";
		Else:
			Say "It's Helena's white blouse. It doesn't look like much when she's not wearing it.";	

	[We want her appearance in the room to represent what she is wearing.]
	Helena is in Observation Lounge. "A beautiful woman with long curly blonde hair is here[if white blouse is worn by Helena], the name-tag pinned to her low-cut blouse proclaiming her name to be 'Helena'[end if]."
	The description of Helena is "Helena is another member of the ray experiment, and you don't really know much about her. She seems friendly enough, always with a coy smile on her face."
	[The framework will automatically append a list of what she is currently wearing, so we don't need to do it. We could describe the general shape of her body though, and call attention to particular body parts, and then it would be proper to mention how they are covered.]

	The description of Helena's pair of feet is "[If sneakers is worn by Helena]Helena's feet are covered by her sneakers.[else]Helena has exquisite feet. She must take good care of them."
	The description of Helena's pair of legs is "Helena's legs are smooth, and just the right amount of tanned."
	The description of Helena's mouth is "Helena has lucious red lips."
	The description of Helena's hair is "Helena has shoulder-length blonde hair."
	The description of Helena's ass is "[If denim shorts is worn by Helena]Helena's bottom looks very perky in her short-shorts.[else if black thong is worn by Helena]The lacy black thong does not do much to cover up Helena's lovely buttocks.[else]Helena notices you staring at her naked behind, and shakes it for you."
	The description of Helena's pair of breasts is "[Helena's Breasts Description]".
	The description of Helena's vagina is "[If denim shorts is worn by Helena]You can't get a good look at that through her short-shorts.[else if black thong is worn by Helena]The lacy black thong just about covers Helena's vagina, leaving just enough to your imagination.[else]Helena's vagina has a small landing strip, point the way to the juicy goodness."

	To say Helena's Breasts Description:
		If white blouse is worn by Helena:
			Say "Helena's breasts is covered by a white blouse that is cut low to show off her ample cleavage";
			If Helena is wearing black lacy bra, say ", and the frilly edges of a black bra";
			Say ".";
		Else if Helena is wearing black lacy bra:
			Say "A lacy black bra accentuates Helena's firm breasts.";
		Else:
			Say "Helena's breasts are perky and firm.";

That was quite a bit of text, so let's have a short recap of what he just accomplished. We start by including the necessary extensions, and define the characters. Every story needs atleast one room, so we make one, that could really do with some more furnishing. Then it's time to declare which body parts we will be working with, this needs to be done after we define the characters but before we start describing them. Finally, it's time to start on the real work of describing the character. The clothing is first, note how we can just say that what type of garment it is and who is wearing it. The Garments extension takes care of the rest of the layering. For most of the clothing pieces we alternate description based on if Helena is wearing them or not. There is a limit to how complex you can make the statements inside a say command, so for the shirt we demonstrate another way of making complex descriptions: Moving it into a seperate "say" rule. There's nothing stopping you doing this to every description.

We describe the character in a similar fashion, and it's important to note how the initial appearance differs from the description. The initial appearance is printed when the player looks in the room, and should not be too long. Similarly, the description of the character should focus on who the character is and not go into too much detail of how the character looks, but it should call attention to body parts the player might want to investigate more. For a much simpler approach to clothing, take a look at the Outfits extension.

Something else to take note of: Characters do not drop the clothing they take off, but depending on persuasion rules the player might get other characters to give away their clothing. This means that for stories with multiple characters, enterprising player might manage to get the "wrong" characters to wear clothing, so you might want to take steps to ensure this doesn't happen or take this into account in the descriptions.

Section: Sexy Stuff

So far, all we've done is to allow the player to explore and look at things, but if the player actually tries the action provided by the framework... Well, the framework does print default messages, so no action will go unanswered, but we have a lot of responses to write. First though, we need to allow the actions to take place at all, as the Consent extension defaults to blocking the actions. We'll again use parts of Example J to showcase one way of using Consent, by linking it to a scene. The following has two scenes; one that begins when the story begins, and our erotic scene that takes over 5 turns later. It also shows how to to timed messages in Inform.

*:
	Introduction begins when play begins.
	Introduction ends when the time since introduction began is 5 minutes.
	When introduction begins:
		First warning occurs in 1 minutes from now;
		Second warning occurs in 3 minutes from now;

	At the time when first warning occurs:
		Say "A voice comes in over the speakers: 'Experiment commences in 3 minutes.'"

	At the time when second warning occurs:
		Say "A voice comes in over the speakers again: 'Experiment commences in 1 minute. Take your places.'"

	Experiment begins when introduction ends.
	When experiment begins:
		Say "A voice comes in over the speakers again: 'Experiment commences now.' You wait for some sort of sound from the ray, but no other sound comes. Instead, something flickers in the eyes of the other test subjects."

We can then tie a consent rule to this scene. It could be as generic as "Consent rule for doing something during experiment: Consent given.", which would allow anything to anyone during the scene. Normally though, we would want more granular control of how consent is granted, so that's what this example will do. The framework has divided the actions into a few distinct groupings that can be used to simplify consent; we should also customize the failure message when consent is denied.

*:
	Consent rule for being erotic during experiment: Consent given.
	Consent rule for being sexual during experiment: Consent given.
	Consent rule for being penetrating during experiment: Consent given.
	Consent rule for being rough during experiment: Consent given.
	
	Persuasion rule for asking a person to try being erotic during experiment: persuasion succeeds.
	Persuasion rule for asking a person to try being sexual during experiment: persuasion succeeds.
	Persuasion rule for asking a person to try being rough during experiment: persuasion succeeds.
	Persuasion rule for asking a person to try being penetrating during experiment: persuasion succeeds.

	Taking off is being erotic.
	Wearing is being erotic.

By defining that wearing and taking off are erotic actions, we can allow the player to control these actions but without letting the character give away their clothing, avoiding the dilemma discussed earlier. Another risk of too-permissive persuasion rules, is that the player can start ordering other characters around the map. Another issue that might come up, but isn't a factor in a one-room story like this, is the player moving around while naked. Luckily the Body Parts extension has a solution for this, by declaring a decency for every character. This makes indecent movent quite easy to stop:

*:
	Instead of an actor going when indecent: Say "You can't move around like that!"
	Instead of an actor going when immodest: Say "You can't move around like that!"

Section: Switching It Up

So far, we haven't actually started on the meat of the story, writing the responses to all these actions we have enabled. Besides the fucking action (and masturbation, which is blocked by default), we have 6 actions that can be done to 7 different body parts, for a whopping 42+ action descriptions. Considering that we might want the other character to do these same actions back on the player, we can double this. Luckily, some actions are blocked off by the framework. By default, only 3 body parts are lickable (for the licking and biting actions) and rubbable (for the rub and pinch actions). This leaves us with something like this:

	Feet: Kiss, Touch
	Legs: Kiss, Touch
	Mouth: Kiss, Lick, Bite, Touch
	Hair: Kiss, Touch
	Ass: Kiss, Touch, Rub, Pinch, Fuck
	Breasts: Kiss, Lick, Bite, Touch, Rub, Pinch
	Vagina: Kiss, Lick, Bite, Touch, Rub, Pinch, Fuck

Or grouped the other way:

	Kissing: Feet, Legs, Mouth, Hair, Ass, Breasts, Vagina
	Licking: Mouth, Breasts, Vagina
	Biting: Mouth, Breasts, Vagina
	Touching: Feet, Legs, Mouth, Hair, Ass, Breasts, Vagina
	Rubbing: Ass, Breasts, Vagina
	Pinching: Ass, Breasts, Vagina
	Fucking: Ass, Vagina

That's a total of 28 possible actions, which is a bit more manageable, especially considering that some of these would be rather short. This can be lowered further if we disallow the rough actions. There are several approaches on how to write these action descriptions, and I recommend looking at both the guides mentioned earlier and how other games do it. Usually responses are divided into to groupings; the major actions suck as fucking and interacting with the interesting body parts, and these gets the most attention. It's important to not completely neglect the minor actions though, but this isn't where your energy is best spent.

Technically there's also several different ways to change the response of an action, but the two main methods available to a story author is by use of the AFTER and INSTEAD rules. As the name implies, they differ in when they activate; AFTER rules are only fired if the action is successfull, while INSTEAD rules trigger before the action is attempted. In general, you should use AFTER for successfull actions, and INSTEAD for when the action should be stopped with a specialized message. What follows is a small excerpt of the action descriptions from Example J in an attempt to show this in action.

	Instead of kissing Helena's feet when sneakers are worn by Helena, say "Her shoes are in the way."
	After kissing Helena's feet, say "You gently kiss her feet."
	After touching Helena's feet, say "You fondle Helena's feet[if sneakers are worn by Helena] through her shoes[end if]."

For a final twist, we might want to swap messages when a command is repeated. This can eithe be done by using [one of] inside a text, as described in §5.7 - Text with random alternatives. For longer, more complex alternatives, it's better to use the tecniques described in §7.16 - Repeated Actions, an example of which is shown below. Note that the action described can be either specific or general.

	After waiting for the first time, say "Time passes slowly..."
	After waiting for third time, say "Getting impatient, are we?"
	After waiting for more than 5 times, say "Look, nobody here's getting any younger, so shall we get on with it?"

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

*:
	The Bedroom is a room.
	Annie is a woman in the bedroom.
	Persuasion rule for asking Annie to try kissing something: persuasion succeeds.
	Consent rule for doing something to Annie: consent given.

	After kissing Annie, say "You lean over and give Annie a big smooch."
	After Annie kissing someone, say "Annie kisses [noun]."

	Test kissing with "kiss Annie / Annie, kiss me".

Example: * Licking - Making feet lickable, and altering the response for licking them.

*:
	The Bedroom is a room.
	Annie is a woman in the bedroom.
	A pair of feet is usually lickable.
	A pair of feet is a part of every person.
	Persuasion rule for asking Annie to try licking something: persuasion succeeds.
	Consent rule for doing something to a thing that is part of Annie: consent given.

	After licking Annie's pair of feet, say "You gently lick Annie's feet."

	Test licking with "Lick Annie / Lick Annie's feet / Annie, lick my feet."

Example: * Biting - Making feet lickable, and altering the response for biting them.

*:
	The Bedroom is a room.
	Annie is a woman in the bedroom.
	A pair of feet is usually lickable.
	A pair of feet is a part of every person.
	Persuasion rule for asking Annie to try biting something: persuasion succeeds.
	Consent rule for doing something to a thing that is part of Annie: consent given.

	After biting Annie's pair of feet, say "You naughtly bite Annie's feet."

	Test biting with "Bite Annie / Bite Annie's feet / Annie, bite my feet."

Example: * Touching - Altering the response of the touching action.

*:
	The Bedroom is a room.
	Annie is a woman in the bedroom.
	A pair of feet is a part of every person.
	Persuasion rule for asking Annie to try touching something: persuasion succeeds.
	Consent rule for doing something to a thing that is part of Annie: consent given.

	After touching Annie's pair of feet, say "You let your hands slide gently over Annie's feet."

	Test touching with "touch Annie / touch Annie's feet / Annie, touch my feet."

Example: * Rubbing - Altering the response of the rubbing action.

*:
	The Bedroom is a room.
	Annie is a woman in the bedroom.
	A pair of feet is a part of every person.
	Persuasion rule for asking Annie to try rubbing something: persuasion succeeds.
	Consent rule for doing something to a thing that is part of Annie: consent given.

	After rubbing Annie's pair of feet, say "You take Annie's feet in your hands, and start rubbing them. She moans in pleasure."

	Test rubbing with "rub Annie / rub Annie's feet / Annie, rub my feet."

Example: * Pinching - Altering the response of the pinching action.

*:
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

*:
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

*:
	The Library is a room.
	Rachel is a woman in the Library. [Rachel allows kissing]
	Annie is a woman in the Library. [Annie disallows kissing, with a custom failure message.]
	Sarah is a woman in the Library. [Sarah disallwos kissing, with the default failure message.]
	
	Consent rule for kissing Rachel:
		Say "You can say things here, but the response might end up looking weird.";
		consent given.
	
	Consent denied for kissing Annie: Say "Annie doesn't want that." instead;
	
	Test consent with "kiss Rachel / kiss annie / kiss sarah."

Example: *** The Experiment - A sample AIF story

This is a small example of how easy it can be to write an AIF using the framework. As this is just a sample game, the I make no claims to the quality of the writing. The story is organized to my personal preferences, but this is not a necessity. Another caution; this story does not have any custom text for asking the other actor to do anything, this is something a proper story would have. This includes interacting with both the players and her own body parts.


	*: "The Experiment"
	
	Volume 0 - Setup

	[The first task is to properly set up the story and it's cast. We also make some shortcuts to say style changes.]

	When play begins, say "When your friend Derek asked for volunteers to test his latest inhibitor-suppression ray, you would have been crazy to refuse.[br]
	Derek has just shown you into the observation lounge, where the other test subject is waiting."

	Book - Imports

	Include Erotic Story Actions by Fictitious Frode.
	Include Garments by Fictitious Frode.

	Book - Text
	
	To say /p: say paragraph break.
	To say br: say line break.
	To say i -- beginning say_i -- running on: (- style underline; -).
	To say /i -- ending say_i -- running on: (- style roman; -). 
	To say b -- beginning say_b -- running on: (- style bold; -). 
	To say /b -- ending say_b -- running on: (- style roman; -). 

	To prompt for keypress:
		Say "[[]Press any key...[]][br]";
		Wait for any key.

	Book 4 - Cast

	Tyler is a man. The player is Tyler.
	Helena is a woman.

	Volume 1 - Locations

	[The next part is to create the world, and any puzzle elements. As this is just a sample story, the world we define is very small, and not very detailed. A proper story would need more furnishings to flesh out the room, such as furniture and decorations.]

	Observation Lounge is a room. "This large room is well decorated, and you can almost forget that the large mirrors on the wall most likely conceals cameras or live observeres."

	Volume 2 - Puzzles and Items

	A big red button is a device in Observation Lounge. It is fixed in place.  "A big red button marked 'ABORT' is attached to one wall."

	Volume 3 - Events

	[A story should also be segmented into scenes. For our sample, we need a introduction, the play part, and an optional aftermath.]

	Introduction is a scene.
	Experiment is a scene.
	Aftermath is a scene.


	Part 1 - Introduction

	[The introduction starts when the story begins, and lasts for 5 turns. This also illustrates how to set up timed prompts.]

	Introduction begins when play begins.
	Introduction ends when the time since introduction began is 5 minutes.
	When introduction begins:
		First warning occurs in 1 minutes from now;
		Second warning occurs in 3 minutes from now;

	At the time when first warning occurs:
		Say "A voice comes in over the speakers: 'Experiment commences in 3 minutes.'"

	At the time when second warning occurs:
		Say "A voice comes in over the speakers again: 'Experiment commences in 1 minute. Take your places.'"

	Part 2 - Experiment

	[The experiment itself begins when introduction ends, and ends when someone uses the big red button. Note that the big red button should probably have some more improved working and text.]

	Experiment begins when introduction ends.
	Experiment ends when the big red button is switched on.
	When experiment begins:
		Say "A voice comes in over the speakers again: 'Experiment commences now.' You wait for some sort of sound from the ray, but no other sound comes. Instead, something flickers in the eyes of the other test subjects."

	Part 3 - Aftermath

	Aftermath begins when experiment ends.
	When aftermath begins:
		Say "As you hit the button there is no noticeable effect, but something still feels different."

	Volume 4 - Characters

	[Finally, it's time to start on the characters proper. We first define which body parts we need.]

	A pair of feet is a part of every person.
	A pair of legs is a part of every person.
	A mouth is a part of every person.
	Some hair is a part of every person.
	An ass is a part of every person.

	A chest is a part of every man.
	A penis is a part of every man.

	A pair of breasts is a part of every woman.
	A vagina is a part of every woman.

	Part 1 - Tyler

	[A proper story would have some descriptions of the player, but for now we just rely on the default body part descriptions.]

	Part 2 - Helena

	[We start with a basic description of the clothing and the person.]

	A pair of sneakers is a pair of shoes worn by Helena. The description is "It's Helena's sneakers. There's nothing special about them."
	A lacy black thong is a pair of panties worn by Helena. The description is "[If black thong is worn by Helena]The lacy black thong fits Helena's curves snuggly.[else]It's Helena's lacy black thong. It still looks hot, even if she isn't wearing it."
	A lacy black bra is a bra worn by Helena.
	A cut-off denim shorts is a pair of trousers worn by Helena. The description is "[If denim shorts is worn by Helena]Helena is wearing a pair of cut-off shorts that really show off her perky buttocks and long legs.[else]It's Helena's pair of cut-off shorts. They don't look like much when she's not wearing them."

	[For her blouse, we want to give a rather complex description, so we split the description off into a Saying rule:]

	A white low-cut blouse is a shirt worn by Helena. The description is "[Helena's shirt description]".

	To say Helena's shirt description:
		If white blouse is worn by Helena:
			Say "Helena is wearing a white blouse that is cut low to show off her ample cleavage";
			[This will run the sentence on, as it didn't end in punctuation.]
			If Helena is wearing black lacy bra, say ", and the frilly edges of a black bra";
			Say ".";
		Else:
			Say "It's Helena's white blouse. It doesn't look like much when she's not wearing it.";

	[We want her appearance in the room to represent what she is wearing.]

	Helena is in Observation Lounge. "A beautiful woman with long curly blonde hair is here[if white blouse is worn by Helena], the name-tag pinned to her low-cut blouse proclaiming her name to be 'Helena'[end if]."

	Chapter 1 - Descriptions

	[The framework will automatically append a list of what she is currently wearing, so we don't need to do it. We could describe the general shape of her body though, and call attention to particular body parts, and then it would be proper to mention how they are covered.]

	The description of Helena is "Helena is another member of the ray experiment, and you don't really know much about her. She seems friendly enough, always with a coy smile on her face."

	The description of Helena's pair of feet is "[If sneakers is worn by Helena]Helena's feet are covered by her sneakers.[else]Helena has exquisite feet. She must take good care of them."
	The description of Helena's pair of legs is "Helena's legs are smooth, and just the right amount of tanned."
	The description of Helena's mouth is "Helena has lucious red lips."
	The description of Helena's hair is "Helena has shoulder-length blonde hair."
	The description of Helena's ass is "[If denim shorts is worn by Helena]Helena's bottom looks very perky in her short-shorts.[else if black thong is worn by Helena]The lacy black thong does not do much to cover up Helena's lovely buttocks.[else]Helena notices you staring at her naked behind, and shakes it for you."
	The description of Helena's pair of breasts is "[Helena's Breasts Description]".
	The description of Helena's vagina is "[If denim shorts is worn by Helena]You can't get a good look at that through her short-shorts.[else if black thong is worn by Helena]The lacy black thong just about covers Helena's vagina, leaving just enough to your imagination.[else]Helena's vagina has a small landing strip, point the way to the juicy goodness."

	To say Helena's Breasts Description:
		If white blouse is worn by Helena:
			Say "Helena's breasts is covered by a white blouse that is cut low to show off her ample cleavage";
			If Helena is wearing black lacy bra, say ", and the frilly edges of a black bra";
			Say ".";
		Else if Helena is wearing black lacy bra:
			Say "A lacy black bra accentuates Helena's firm breasts.";
		Else:
			Say "Helena's breasts are perky and firm.";

	Chapter 2 - Conversation

	[Normally, the player would want to engage the other actors in conversation.]

	Chapter 3 - Interaction

	[Finally, the meat of the story. The first part is to define consent and persuasion. This can be done as detailed or broadly as desired, but it's probably easiest to use the defined groupings and the scenes we defined earlier.]

	Consent rule for being erotic during experiment: Consent given.
	Consent rule for being sexual during experiment: Consent given.
	Consent rule for being penetrating during experiment: Consent given.
	Consent rule for being rough during experiment: Consent given.
	
	Persuasion rule for asking a person to try being erotic during experiment: persuasion succeeds.
	Persuasion rule for asking a person to try being sexual during experiment: persuasion succeeds.
	Persuasion rule for asking a person to try being rough during experiment: persuasion succeeds.
	Persuasion rule for asking a person to try being penetrating during experiment: persuasion succeeds.
	
	Consent denied for being erotic: Say "She pulls away as you try, so you stop." instead;
	Consent denied for being sexual: Say "You don't think she would appreciate that." instead;
	Consent denied for being rough: Say "That seems a little harsh." instead;
	Consent denied for being penetrating: Say "Surely, that's not proper." instead;

	[By defining taking off and wearing as erotic, they are also covered by the consent and persuasion rules we just defined.]

	Taking off is being erotic.
	Wearing is being erotic.

	[For the actual actions, it's probably best to group them by the body part they affect, although it's perfectly reasonable to group them by action as well.]

	Section - Feet

	[Kiss, Touch]
	Instead of kissing Helena's feet when sneakers are worn by Helena, say "Her shoes are in the way."
	After kissing Helena's feet, say "You gently kiss her feet."
	After touching Helena's feet, say "You fondle Helena's feet[if sneakers are worn by Helena] through her shoes[end if]."

	Section - Legs

	[Kiss, Touch]
	After kissing Helena's legs, say "You gently kiss her legs."
	After touching Helena's legs, say "You let your hands gently slide over her smooth legs."

	Section - Mouth

	[Kiss, Lick, Bite, Touch]
	After kissing Helena's mouth, say "You lean in and gently kiss her on the lips."
	After licking Helena's mouth, say "You lean in to kiss her, and instead playfully lick her lips."
	After biting Helena's mouth, say "As you kiss Helena, you playfully bite down on her lips, gently."
	After touching Helena's mouth, say "You softly place your finger on Helena's mouth. She smiles at you."

	Section - Hair

	[Kiss, Touch]
	Instead of kissing Helena's hair, say "You lean in to kiss her hair, but change your mind when you smell the amount of hairspray she's been using."
	After touching Helena's hair, say "You let your fingers run through her hair. She seems to like it."

	Section - Ass

	[Kiss, Touch, Rub, Pinch, Fuck]
	Instead of kissing Helena's ass when Helena's ass is covered by something , say "[The list of visible things covering Helena's ass] [are] in the way."
	After kissing Helena's ass, say "You kiss Helena's cute buttcheeks."
	After rubbing Helena's ass, say "You softly massage Helena's ass[if Helena's ass is covered by something] through [the list of visible things covering Helena's ass][end if]."
	After pinching Helena's ass, say "Helena squeals as you pinch her ass[if Helena's ass is covered by something] through [the list of visible things covering Helena's ass][end if]."
	After fucking Helena's ass with your penis, say "You pull Helena's legs up, and steer your stiff shaft towards her rear opening,and gently press it inside of her."

	Section - Breasts

	[Kiss, Lick, Bite, Touch, Rub, Pinch]
	Instead of kissing Helena's pair of breasts when Helena's pair of breasts is covered by something, say "[The list of visible things covering Helena's pair of breasts] [are] in the way."
	After kissing Helena's pair of breasts, say "Helena moans as your lips gently play with her bare breasts."
	Instead of licking Helena's pair of breasts when Helena's pair of breasts is covered by something , say "[The list of visible things covering Helena's pair of breasts] [are] in the way."
	After licking Helena's pair of breasts, say "Your tounge runs over Helena's exposed nipples, making her moan in pleasure."
	Instead of biting Helena's pair of breasts when Helena's pair of breasts is covered by something , say "[The list of visible things covering Helena's pair of breasts] [are] in the way."
	After biting Helena's pair of breasts, say "Helena gasps as your naughtily bite down on her nipples."
	After pinching Helena's pair of breasts, say "Helena squeals as you pinch her breasts[if Helena's pair of breasts is covered by something] through [the list of visible things covering Helena's pair of breasts][end if]."

	Section - Vagina

	[Kiss, Lick, Bite, Touch, Rub, Pinch, Fuck]
	Instead of kissing Helena's vagina when Helena's vagina is covered by something, say "[The list of visible things covering Helena's vagina] [are] in the way."
	After kissing Helena's vagina, say "You softly kiss her lower lips."
	Instead of licking Helena's vagina when Helena's vagina is covered by something, say "[The list of visible things covering Helena's vagina] [are] in the way."
	After licking Helena's vagina, say "Helena moans and squirms in pleasure as your tongue goes to work on her womanly parts."
	Instead of biting Helena's vagina when Helena's vagina is covered by something, say "[The list of visible things covering Helena's vagina] [are] in the way."
	After biting Helena's vagina, say "While eating Helena out, you decide to take a heftier bite. She squeals as you softly bite down on her womanly parts."
	After touching Helena's vagina, say "[if Helena's vagina is covered by something]You slide your fingers under [the list of visible things covering Helena's vagina] and let them[else]You let your fingers[end if] gently slide over her smooth pussy."
	After rubbing Helena's vagina, say "[if Helena's vagina is covered by something]You slide your fingers under [the list of visible things covering Helena's vagina] and [else]You [end if] rub her pussy as she moans with pleasure."
	After pinching Helena's vagina, say "[if Helena's vagina is covered by something]You slide your fingers under [the list of visible things covering Helena's vagina] and [else]You [end if] pinches her lips. She jerks with surprise."
	After fucking Helena's vagina with your penis, say "You gently steer your throbbing manhood towards Helena's waiting moist cave. You both moan and shiver with pleasure as it slides into her."
