Version 1/150126 of Arousal by Fictitious Frode begins here.

"When writing Adult Interactive Fiction, it's best for actors to behave differently based on how aroused they are. This extension provides five levels of arousal, with methods to check and alter these. It also offers an entirely optional method to check whether a person succeeds in having an orgasm, a task that gets progressively harder with each orgasm they've had."

Section - Arousal

An arousal is a kind of value. The arousals are unaroused, slightly aroused, aroused, very aroused, orgasmic.
A person has an arousal. A person is usually unaroused.
A person has a number called orgasms. The orgasms of a person is usually 0.
A person has a number called orgasmic attempts. The orgasmic attempts of a person is usually 0.

To decide whether (P - a person) is (A - an arousal) or more:
	If the arousal of P is at least A, decide yes;
	Decide no;

To decide whether (P - a person) is (A - an arousal) or less:
	If the arousal of P is at most A, decide yes;
	Decide no;

[Increase the arousal of a person by one grade, with a maxmimum level]
To arouse (P - a person) up to (A - an arousal):
	If the arousal of P is less than A:
		Now the arousal of P is the arousal after the arousal of P;

[Increase the arousal of a person by one grade, without a maxmimum]
To arouse (P - a person):
	Arouse P up to (last value of arousal);

[Decrease the arousal of a person by one grade, with a maxmimum level]
To cool (P - a person) down to (A - an arousal):
	If the arousal of P is greater than A:
		Now the arousal of P is the arousal before the arousal of P;
	
[Decrease the arousal of a person by one grade, without a minimum]
To cool down (P - a person):
	Cool P down to (first value of arousal);

Section - Orgasms

[We want to make it so that every time a person orgasms, it's harder to achieve the next one.
The chance to succed is attempts : orgasms; the first orgasm is 'free'; the second is 50% at first attempt and 100% at second, third is 1/3 then 2/3, and so on.]
To decide whether (P - a person) orgasms:
	[Only orgasmic people can try to have an orgasm.]
	If P is not orgasmic, Decide no;
	Increase the orgasmic attempts of P by 1;
	Let X be the orgasmic attempts of P;
	Let Y be the orgasms of P + 1;
	If a random chance of X in Y succeeds:
		Increase the orgasms of P by 1;
		Now the orgasmic attempts of P is 0;
		Now the arousal of P is aroused;
		Decide yes;
	Decide no;

Arousal ends here.

---- DOCUMENTATION ----

Chapter - Using this Extension

When writing Adult Interactive Fiction, it's best for actors to behave differently based on how aroused they are. This extension provides five levels of arousal, with methods to check and alter these. It also offers an entirely optional method to check whether a person succeeds in having an orgasm, a task that gets progressively harder with each orgasm they've had.

Section - Arousals

The extension provides five leves of arousal. These are, in order:

	unaroused
	slightly aroused
	aroused
	very aroused
	orgasmic

These can be tested on in the usual ways; To test if a person has a specific arousal Inform knows implicitly which property of the person we're interest in sp "If Soandso is aroused" works wonders. However, if we're interested in a threshold value (at least aroused), then we need to specify which property to compare to, like "If the arousal of Soandso is at least aroused". This last can be painful to type too often, so we have two helping methods for comparison:

	If Soandso is aroused or more, ...
	If Soandso is aroused or less, ...

We also have some built in methods to help us alter the arousals easily:
	
	Arouse Person: Increases the arousal of the person by one level.
	Arouse Person to Level: Increases the arousal of the person by one level, but not past the level given.
	Cool down Person: Decreases the arousal of the person by one level.
	Cool Person down to Level: Decreases the arousal of the person by one level, but not past the level given.

This extension does not alter the arousal of a person in any way, that is left for the story author to decide. It's entirely fair to base alteration for certain actions on random chance; see the end of the enclosed Example.

Section - Orgasms

This extension includes a method that can be used to check whether a person orgasms, which can be called like this:

	If Soandso orgasms, ...

This does two things: It first assures that the arousal of the person is in fact orgasmic. If it is, it determines by random chance if the person can have an orgasm. This chance is defined by two factors; the number of the orgasm we're trying to achieve (Y) and the number of attempts to achieve it so far (X). If a chance of X in Y succeeds, this method will decide yes, reset the attempt counter and increase the orgasm target. If it fails, decides no and only increases the attempt counter, making next attempt easier. All other effects of the orgasm (such as reseting arousal, textual response, etc) is left to the story author.


In effect, the chance to orgasm will be:

	First Orgasm: 1/1
	Second Orgasm: 1/2, then 2/2
	Third Orgasm: 1/3, then 2/3, then 3/3

This might seem like low odds, but orgasm is likely to happen in the first 2 or 3 attempts for quite a while.

Section - Maintenance and Decay

Arousal is a fleeting thing, and the author might want to have actors that aren't participating slowly lose their edge. In order to pull this off properly, you should keep track of which actors have participated in the latest action which is outside the scope of this documentation.

The following has a small chance of lowering the arousal of the player each turn:

	Every turn:
		If a random chance of 1 in 10 succeeds, cool the player down to slightly aroused;

Chapter - Technical Notes

The inclusion of arousal and threshold for actions can be quite contentious, so this framework applies no restrictions and instead focuses on providing a framework for the story author to use as they see fit.

I'm much indebted to Mister Flibble's Magician's Nephew for the inspiration on how to handle arousal and orgasms.

Section - Integration with Other Parts of the Framework

Arousal is a standalone extension, but it's contents are aimed at incorporating with Erotic Story Actions. This incorporations is entirely up to the story author; see the included Example for some suggestions on how this can be done.

Section - Version History

Section - Contact Info

The author of the framework can be reached in the following ways:

	* Mail: fictitious.frode@gmail.com
	* Blog: https://informedaif.wordpress.com/ is a blog dedicated to writing AIF with Inform 7, and is the official host of the framework. It contains both dicussions around AIF and tutorials on both Inform in general and this framework in particular.
	* Reddit: https://www.reddit.com/r/AIFCentral/ is the subreddit for the AIF community, and the author checks this regularly.

Feedback of all varieties is welcome, but constructive criticism and discussion is the most appreciated, along with reports of bugs and other issues. For support I would appreciate using public communication, so that other may learn from the request as well.

Example: *** Of Shirts and Bosoms - Showcasing Arousal for Actions and Descriptions

	[This is a modified excerpt from a work-in-progress story, and contains only the bare minimums to showcase how arousal can be used in both descriptions and actions.]

	Include Body Parts by Fictitious Frode.

	To say break: say line break.
	To say nobreak: say run paragraph on;
	To say gap: say paragraph break.

	Observation Lounge is a room. "At the top of the stairs lies a spacious room with a high ceiling, which spans up and outwards to form the dome of the entire building. The entire south wall is open towards the amphitheatre and it's arena floor, but a slight sheen reveals it to be a translucent window of sorts. A prominent room such as this must surely be a lounge reserved for special guests.[break]
	A couple of ornate chairs is placed before the window as an observation post, one of them occupied by a[short description of Elsa's clothing] woman."

	Elsa is a woman in Observation Lounge. "A[short description of Elsa's clothing] woman is lounging in an ornate chair. [one of]Her face lights up as you enter. 'Finally, some company in this dreary place. I hope you're here to bet on the fights, yes?'[or]'Back for some more games, I hope?'[stopping]".

	A white shirt is worn by Elsa. The description is "[describe white shirt]".
	The silver key is worn by Elsa. The description is "It's a silver key, worn on a chain."
	A pair of breasts is a part of every woman.

	To say short description of Elsa's clothing:
		If Elsa is wearing white shirt:
			Say " elegant";
		Else:
			Say " topless";

	To say describe white shirt:
		Say "It's a white shirt[nobreak]";
		If Elsa is wearing white shirt:
			If Elsa is slightly aroused or more:
				Say "primly buttoned up to her neck. The shirt fits tightly over her ample bosom";
			Else if Elsa is aroused:
				Say "with the top button undone. You can see the outline of her erect nipples through the tight fabric";
			Else if Elsa is very aroused:
				Say "with the top buttons undone to show off her ample cleavage";
			Else if Elsa is orgasmic:
				Say "with the top buttons undone, and the shirt pulled down to expose her heaving bosom";
			If silver key is worn by Elsa:
				If Elsa is very aroused or more, say ". A silver key dangles on a keychain between her ample breasts.";
				Else say ". You see a thin chain around her neck.";
			Else:
				Say ".";

	The description of Elsa's pair of breasts is "[describe Elsa's breasts]".
	The short description of Elsa's pair of breasts is "lightly tanned, with [if Elsa is aroused or more]erect[else]puffy[end if] nipples".
	To say describe Elsa's breasts:
		If Elsa is wearing white shirt:
			If Elsa is very aroused or less, say "Her bosom is covered by [a white shirt],[nobreak]";
			If Elsa is slightly aroused or more:
				Say "primly buttoned up to her neck";
			Else if Elsa is aroused:
				Say "with the top button undone. You can see the outline of her erect nipples through the tight fabric";
			Else if Elsa is very aroused:
				Say "with the top buttons undone to show off her ample cleavage";
			Else if Elsa is orgasmic:
				Say "She has pulled [the white shirt] down to expose her heaving bosom. It is [short description of the Elsa's pair of breasts]";
			[Now, describe the silver key chain]
			If silver key is worn by Elsa:
				If Elsa is very aroused or more, say ". A silver key dangles on a keychain between her ample breasts.";
				Else say ". You see a thin chain around her neck.";
			Else:
				Say ".";
		Else:
			Say "Her [if Elsa is very aroused or more]heaving[end if] breasts are [short description of Elsa's pair of breasts].";

	Instead of kissing Elsa:
		Say "You kiss Elsa[if Elsa is aroused or more], and she vigorously kisses you back[end if].";
		If a random chance of 2 in 3 succeed, arouse Elsa up to aroused.

	Instead of touching Elsa's pair of breasts:
		Say "You gently touch Elsa's [if Elsa is orgasmic]heaving [endif]bosom.";
		Arouse Elsa up to very aroused;

	Instead of rubbing Elsa's pair of breasts:
		Say "You rub her[nobreak]";
		If Elsa is wearing white shirt:
			If Elsa is orgasmic:
				Say "naked and erect nipples.";
			Else if Elsa is aroused or more:
				Say "erect nipples through her shirt.";
			Else:
				Say "nipples through her shirt.";
		Else:
			Say "naked[nobreak]";
			If Elsa is aroused or more say "and erect[nobreak]";
			Say "nipples.";
		If Elsa orgasms:
			End the story saying "She lets out a squeal of pleasure, and her entire body shakes as your expert hands on her delicate nipples brings her to orgasm.";
		Arouse Elsa;

	Persuasion rule for asking Elsa to try taking off white shirt: persuasion succeeds.
	
	Test observation with "x tits / x shirt".
	Test me with "test observation / touch tits / test observation / rub tits / test observation / rub tits / test observation / rub tits / test observation / elsa, remove shirt / test observation / kiss Elsa / touch tits / rub tits".
