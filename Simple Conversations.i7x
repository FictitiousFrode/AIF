Version 2/161228 of Simple Conversations by Fictitious Frode begins here.

Include Epistemology by Eric Eve.

Volume 1 - Simple Conversations

Book 1.1 - Concepts

Part 1.1.1 - Subjects

[We use Epistemology's subject type, but add a property to allow once-only responses.
We use Epistemology's 'known' definition to mark subjects as enabled.]

A subject can be repeatable or one-time. A subject is usually repeatable.

Part 1.1.2 - Dialogue

Chapter 1.1.2a - Dialogue Table

[Dialogue for subjects are stored in tables; each person should have their own table but it's possible to share.
Subject: The thing/subject being asked about
Availability: If the dialogue is available
Cue: If defined, printed as part of the 'talk to' action to hint at this subject
Turn stamp: The turn the subject was last talked about
Dialogue: The textual response]

A person has a table-name called the dialogue.
The dialogue of a person is usually the Table of No Dialogue.

Table of No Dialogue
subject (a thing)	availability (a truth state)	cue (a text)	turn stamp (a number)	dialogue (some text)
--	--	--	--	--

Chapter 1.1.2b - Updating Cue

To update the cue of (subject - a thing) for (conversationalist - a person) to (cue - some text):
	Let updated be false;
	Repeat through dialogue of the conversationalist:
		If there is a subject entry and the subject entry is subject:
			Now cue entry is cue;
			Let updated be true;
	If updated is false:
		If number of blank rows in dialogue of the conversationalist is 0:
			Say "ERROR: Unable to insert [subject] into dialogue for [conversationalist] - table is full.";
		Else:
			Choose a blank row in dialogue of the conversationalist;
			Now availability entry is false;
			Now subject entry is subject;
			Now cue entry is cue;
			Now dialogue entry is "";

To clear the cue of (subject - a thing) for (conversationalist - a person):
	Repeat through dialogue of the conversationalist:
		If there is a subject entry and the subject entry is subject:
			Blank out the cue entry;

Chapter 1.1.2c - Updating Dialogue

To update the dialogue of (subject - a thing) for (conversationalist - a person) to (dialogue - some text):
	Let updated be false;
	Repeat through dialogue of the conversationalist:
		If there is a subject entry and the subject entry is subject:
			Now dialogue entry is dialogue;
			Let updated be true;
	If updated is false:
		If number of blank rows in dialogue of the conversationalist is 0:
			Say "ERROR: Unable to insert [subject] into dialogue for [conversationalist] - table is full.";
		Else:
			Choose a blank row in dialogue of the conversationalist;
			Now availability entry is false;
			Now subject entry is subject;
			Now dialogue entry is dialogue;

To clear the dialogue of (subject - a thing) for (conversationalist - a person):
	Repeat through dialogue of the conversationalist:
		If there is a subject entry and the subject entry is subject:
			Blank out the dialogue entry;

Chapter 1.1.2d - Toggling Availability

To activate (subject - a thing) for (conversationalist - a person):
	Repeat through dialogue of the conversationalist:
		If there is a subject entry and the subject entry is subject:
			Now availability entry is true;

To deactivate (subject - a thing) for (conversationalist - a person):
	Repeat through dialogue of the conversationalist:
		If there is a subject entry and the subject entry is subject:
			Now availability entry is false;

Chapter 1.1.2e - Checking For Dialogue

To decide whether (subject - a thing) has been talked about to (conversationalist - a person):
	Repeat through dialogue of the conversationalist:
		If there is a subject entry and the subject entry is subject:
			If there is a turn stamp entry and the turn stamp entry > 0, decide yes;
	Decide no;

Part 1.1.3 - Default Responses

[The default dialogue is issued when talking about something that isn't recognized as a subject/thing, or when the person doesn't have an available dialogue in their conversation table.]
A person has some text called the default dialogue.

Book 1.2 - New Actions

Part 1.2.1 - Talking To

[Talking to checks the responses of the person to see which subjects are available, and which should be hinted at.]

Talking to is an action applying to one thing.
The specification of the talking to action is "Talking to engages a person in conversation, giving the player some options on subjects to talk about."

Chapter 1.2.1a - Understanding

Understand "talk --/to [something]" as talking to.

Chapter 1.2.1b - Check

[Make sure that we're talking to a person]
Check an actor talking to something (this is the talking to inanimate objects rule):
	If the noun is not a person:
		Now the prior named object is nothing;
		If the actor is the player and the action is not silent:
			Say "[We] [don't] expect to get much response from [the noun]." (A);
		Stop the action;

Chapter 1.2.1c - Carry Out

[Go through the person's dialogue options, and see if there are any that are available and have a defined cue.]
Carry out an actor talking to someone (this is the conversation cueing rule):
	Let cues be a list of text;
	Repeat through dialogue of the noun:
		If there is a cue entry and there is an availability entry and the availability entry is true:
			If the subject entry is known, add the cue entry to cues;
	If the actor is the player:
		If the cues is empty:
			Say "[We] [can't] think of anything to talk to [the noun] about." (A);
		Else:
			Say "[We] [can] talk with [the noun] about [cues]." (B);

Chapter 1.2.1d - Report

Report an actor talking to someone (this is the report conversations rule):
	If the actor is not the player:
		Say "[The actor] talks to [the noun]." (A);

Part 1.2.2 - Talking About

[Talk to a person about a specific subject; checking the dialogue for a response.]

Talking to it about is an action applying to one thing and one visible thing.

Chapter 1.2.2a - Understanding

[Understand "talk --/to [something] about [any thing]" as talking to it about.]
Understand "talk --/to [something] about [any known thing]" as talking to it about.

Chapter 1.2.2b - Check

[Make sure that we're talking to a person]
Check an actor talking to about something (this is the conversing about with inanimate objects rule):
	If the noun is not a person:
		Now the prior named object is nothing;
		If the actor is the player and the action is not silent:
			Say "[We] [don't] expect to get much response from [the noun]." (A);
		Stop the action;

[Make sure the subject is known and dialogue is available]
Check an actor talking to about something (this is the conversation viability rule):
	If the second noun is not known:
		If the action is not silent:
			If the actor is the player or the player can see the actor:
				If the default dialogue of the noun is the default value of text:
					Say "[The noun] [don't] know what to say about [the second noun]." (A);
				Else:
					Say "[default dialogue of noun][paragraph break]" (B);
		Stop the action;

Chapter 1.2.2c - Carry Out

[Print the dialogue, log turn count and toggle availability for one-time dialogue.]
Carry out talking to someone about something (this is the conversation rule):
	Repeat through dialogue of the noun:
		If there is a subject entry and the second noun is the subject entry and the availability entry is true:
			Say "[dialogue entry][paragraph break]" (A);
			Now turn stamp entry is the turn count;
			If the subject is one-time, now the availability entry is false;

Chapter 1.2.2d - Report

Report an actor talking to someone (this is the report specific conversation rule):
	If the actor is not the player:
		Say "[The actor] talks to [the noun] about [the second noun]." (A);

Part 1.2.3 - Pondering About Unknown Things

[If what the player writes isn't understood as a thing, we still want to catch and process it.]

Pondering to it about is an action applying to one thing and one topic.

Chapter 1.2.3a - Understanding

Understand "talk --/to [something] about [text]" as pondering to it about.
Understand "converse --/with [something] about [text]" as pondering to it about.

Chapter 1.2.3b - Check

[Make sure that we're talking to a person]
Check an actor pondering to something about something (this is the pondering with inanimate objects rule):
	If the noun is not a person:
		Now the prior named object is nothing;
		If the actor is the player and the action is not silent:
			Say "[We] [don't] expect to get much response from [the noun]." (A);
		Stop the action;

Chapter 1.2.3c - Carry Out

Carry out an actor pondering to someone about something (this is the pondering unknown topics rule):
	If the actor is the player:
		If the default dialogue of the noun is the default value of text:
			Say "[The noun] [don't] know what to say about that." (A);
		Else:
			Say "[default dialogue of noun][paragraph break]" (B);

Book 1.3 - Action Integration

The conversation redirection is initially "[We] should 'talk to' them about it instead.";

Part 1.3.1 - Asking

Check an actor asking someone about a topic:
	Say the conversation redirection;
	Stop the action;

Part 1.3.2 - Telling

Check an actor telling someone about a topic:
	Say the conversation redirection;
	Stop the action;

Part 1.3.3 - Showing

Check an actor showing something to someone:
	Say the conversation redirection;
	Stop the action;

Part 1.3.4 - Giving

Check an actor giving something to someone:
	Say the conversation redirection;
	Stop the action;

Simple Conversations ends here.

---- DOCUMENTATION ----

Chapter 1 - Using this Extension

To use this framework, you need to download and install it (which you probably have if you're reading this) and include it in your story:

*:
	Include Simple Conversations by Fictitious Frode.

By including this extension, you will disable the 'ask', 'tell', 'give' and 'show' actions.
In their place you get two new actions, 'talk to person' and 'talk to person about subject'.
These are covered in greater detail in chapter 2.

This extension makes use of Eric Eve's Epistemology extension to provide subjects and keep track of the player's knowledge.
It's bundled with Inform and should already be installed for you.

Section 1.1 - Documentation Overview

The documentation will cover the following subjects:

	Chapter 1: A short overview of the extension.
	Chapter 2: Techniques and guidelines on how to create simple conversations.
	Chapter 3: A complete technical reference for everything added or changed with this extension.

The following examples are included:

	A: Hard Rock - A conversational example

Section 1.2 - Version History

2016-12-23: Beta-1 (Release 1)

	Table-based dialogue options for subjects.
	Individual default dialogue responses for each person.
	Availability for both subjects and individual dialogues can be toggled.
	Support for runtime alterations to dialogues.
	
Release 2 (In Development)

	Support for clearing cue and dialogue entries.

Section 1.3 - Contact Info

The author of this extension can be reached in the following ways:

	Mail: fictitious.frode@gmail.com
	Blog: https://informedaif.wordpress.com/ is a blog dedicated to writing AIF with Inform 7, and is the official host of the extension. It contains both dicussions around AIF and tutorials on both Inform in general and this extension in particular.
	Reddit: https://www.reddit.com/r/AIFCentral/ is the subreddit for the AIF community, and the author checks this regularly.
	GitHub: https://github.com/FictitiousFrode/AIF Contains the latest version of the extension, possibly including functionality that hasn't been released yet.

Feedback of all varieties is welcome, but constructive criticism and discussion is the most appreciated, along with reports of bugs and other issues.
For support I would appreciate using public communication, so that other may learn from the request as well.

Chapter 2 - Simple Conversations

When dealing with other characters in Interactive Fiction one of the key challenges is conversations.
Because the player is free to converse about anything that strikes their fancy, a good conversation system must both understand what topic the player is referring to and have a response for it.
Over time two main styles of conversation has evolved; the keyword conversation approach which underlies Inform's default conversation actions, or using a branching tree of conversation subjects.
This extension implements the first approach, simplifying the four default actions ('ask', 'tell', 'give' and 'show') down to the simple 'talk to' and 'talk to about'.

Conceptually we divide the conversation model into two parts, subjects to talk about and the dialogue options of other characters.
The next two sections will provide detail on how to use these

Section 2.1 - Subjects

Inform's default behavior is to allow conversation on text tokens, which handles just about anything the player types.
This approach has some downsides besides trying to decipher what the player actually means; we also don't have a simple way to apply properties to a topic.
The player's knowledge of conversation topics is one such thing that needs to be kept track of, which we do using Eric Eve's Epistemology extension.
This includes a 'subject' type which we extend with a property marking it the subject is repeatable (the default) or something you can only ask a person about once.
It's very important to make liberal use of 'understand' statements to link phrases the player might use to talk about the subject.

Section 2.2 - Dialogues

A subject isn't very interesting without a dialogue response for it from the other characters.
To facilitate this we use a table-based approach, which allows for both shared and individual dialogue options.
Each person has a 'dialogue' property which points to a table, which should look like the example below:


*:
	Library is a room.
	Bob is a person in Library. Bob's dialogue is the Table of Bob's Dialogue.
	
	A conversation is a subject.
	Understand "conversations", "help --/on" and "talking" as conversation.
	
	Table of Bob's Dialogue
	subject (a thing)	availability (a truth state)	cue (a text)	turn stamp (a number)	dialogue (some text)
	conversation	true	"help on how to talk to other people"	--	"'You should try reading the documentation,' Bob answers. Not much help in that."
	
	Test me with "talk to bob / talk to bob about help".

It's important that the table contains the following five columns:

	Subject: The subject (or any other thing) the dialogue is for
	Availability: True/false for if the option is enabled
	Cue: If not blank, the text here is listed together to guide the player when using the 'talk to' action
	Turn stamp: The turn on which the dialogue was last talked about, or blank (--) if it's never been talked about
	Dialogue: The text to output when talking about the option
	
It's also possible to write 'after talking to person about subject' rules.
Typically these would be to unlock the effects of talking about the subject, such as updating cues and making other dialogues available.

Section 2.3 - Changing Dialogues

Dialogue is seldom static, and the author has a few options on how to alter conversations.
As the dialogues are stored in a table, all the regular table operators in Inform can be used.
These can be rather cumbersome for updating single values though, so some phrases are provided to simplify matters.
The most common update is changing the availability of a dialogue, which is done with the 'ACTIVATE/DEACTIVE subject FOR person' phrases.
Similarly it's also possible to update the cue and dialogue itself, using the 'UPDATE THE CUE/DIALOGUE OF subject FOR person TO text' phrases.
Note that if you try to update the cue or dialogue for a subject that doesn't exist, these phrases try to create a new record in the table if there is room.
These are covered in more details in section 3.3

When the story moves to a new act it's often necessary to make larger alterations to dialogue.
For these occasions you can have a separate table of dialogue for each act, and use the 'when scene begins' rule to change the dialogue of the actors to refer to a new table.

Chapter 3 - Technical Reference

Section 3.1 - New Kind: Subject

Subject is a new kind which is defined by Eric Eve's Epistemology extension, to represent intangible knowledge that the player might want to talk to other characters about.
By default every subject is familiar to the player, which allows it to be talked about.
For subjects representing knowledge the player learns during play, you should state that it is initially 'not familiar' and update it at the appropriate time.
Subjects can also be repeatable (the default) or one-time, which determines if the dialogue is disabled after talking about it.
This should be mainly used for dialogue options that have some lasting effect on the world model.
It's also very important to use understand phrases to link the subject to the various words the player might use to refer to the knowledge.

Section 3.2 - The Dialogue Table

Dialogue is stored in table form for each person, which allows us to keep track of dialogue for each person individually while still being flexible.
It's very important that the table contains the following five columns:

	Subject: Can contain any thing in the story world. Will only be matched against the players query if the thing is 'known', according to the Epistemology extension.
	Availability: A simple flag to determine if the person has knowledge about the subject. For subjects that are not repeatable, this will be toggled to false after talking about it.
	Cue: Used to populate the results of the 'talk to' action which cues the player to subjects.
	Turn stamp: Used to keep track of which dialogue options have been talked about, storing the turn number it was previously talked about.
	Dialogue: The text to output when talking about the option.

Section 3.3 - Phrases for Updating Values and Deciding On

The following phrases can be used to update the dialogues of a person, by altering the table that the dialogue property points to.

	UPDATE THE CUE OF (thing) FOR (person) TO (text): Sets the cue text of the thing in the person's table to the given text. If the thing isn't listed in the table, it tries to find a blank row to insert a new row with no dialogue and 'false' availability. Often used after talking about something that no longer requires cueing.
	CLEAR THE CUE OF (thing) FOR (person): Blanks out the cue of the thing in the person's table.
	UPDATE THE DIALOGUE OF (thing) FOR (person) TO (text): Sets the dialogue text of the thing in the person's table to the given text. If the thing isn't listed in the table, it tries to find a blank row to insert a new row with the dialogue and 'false' availability.
	CLEAR THE DIALOGUE OF (thing) FOR (person) : Blanks out the dialogue of the thing in the person's table. Rarely needed but provided for completion.
	ACTIVATE (thing) FOR (person): Sets the availability of the thing in the person's table to true.
	DEACTIVATE (thing) FOR (person): Sets the availability of the thing in the person's table to false.

It's also possible to check if something has been talked about with a given person:

	whether (thing) HAS BEEN TALKED ABOUT TO (person): Checks if the turn stamp entry is filled in the person's dialogue table.

Example: ** Hard Rock - A conversational example

	*: "Hard Rock"
	
	Include Simple Conversations by Fictitious Frode.
	
	Cavern is a room. Understand "this place" as cavern.
	A mysterious chest is a a closed container in cavern. It is fixed in place.
	A stone is in mysterious chest.

	Adam is a person in Cavern. Adam's dialogue is the Table of Adam's Dialogue.
	
	Some music is a subject. Understand "sound", "rock" and "roll" as music.
	
	Table of Adam's Dialogue
	subject (a thing)	availability (a truth state)	cue (a text)	turn stamp (a number)	dialogue (some text)
	cavern	true	"this place"	--	"'This is where I retreat to when the world gets to be too much,' he answers."
	mysterious chest	true	--	--	"'[if stone is known]It's just where I keep my rock collection[else]It wouldn't be much of a mystery if I told you that[end if],' he answers."
	stone	true	--	--	"'It's no longer rolling.'"
	music	true	--	--	"'Sometimes I like to bang the stone against the cave walls.'"
	
	After talking to Adam about stone, update the cue of music for Adam to "rock 'n' roll music".
	
	Test me with "talk to adam / talk to adam this place / talk to adam about chest / talk to adam about stone / open chest / talk to adam about stone / talk to adam about rock".
