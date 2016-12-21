Version 1/161203 of Simple Conversations by Fictitious Frode begins here.

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
			Say "[The noun] [don't] know what to say about [the second noun]." (A);
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

Example 281 (**): Farewell
Example 282 (**): Sweeney


Greeting/Good-Bye when conversation starts and ends



[TODO: A brief introduction on the various styles of conversation, converging on why we've chosen the approach we have.
Over time, IF has evolved into two main styles of conversation, either using a branching tree of options to converse about or a keyword based approach.

TODO: How the conversation model works

TODO: Examples of the conversation model in play]
