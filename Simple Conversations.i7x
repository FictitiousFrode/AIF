Version 3/171120 of Simple Conversations by Fictitious Frode begins here.

Include Epistemology by Eric Eve.

Volume 0 - New Verbs

[These are the new verbs the framework uses; We put this in it's own volume in case anyone needs to rewrite it for compatibility:]
To greet is a verb.

Volume 1 - Simple Conversations

Book 1.1 - Concepts

Part 1.1.1 - Properties

Chapter 1.1.1a - Subjects (in place of Chapter 2 - Subject (for use without Threaded Conversation by Emily Short) in Epistemology by Eric Eve)

[Epistemology's subject has a slight flaw in being a thing, so we replace it with an object. We use the 'known' definition to mark subjects as enabled, and add a property to allow once-only responses.]
A subject is a kind of object.
The specification of a subject is "Something that conversations can refer to, but which has no real-world presence or functionality."

A subject can be one-time or repeatable.
A subject can be familiar or unfamiliar.

Definition: a subject is known if it is familiar or it is seen.
Definition: a subject is unknown if it is not known.

A thing can be one-time or repeatable.

Chapter 1.1.1b - Room Familiarity

A room can be familiar or unfamiliar.
A room is usually unfamiliar.
A room can be one-time or repeatable.

Definition: a room is known if it is familiar or it is visited.
Definition: a room is unknown if it is not known.

Chapter 1.1.1c - Current Interlocutor

[We keep track of the person we're interacting with]
The current interlocutor is an object that varies.
The current interlocutor is initially nothing.

To decide whether (conversationalist - an object) is greeted:
	If current interlocutor is nothing:
		Decide no;
	If current interlocutor is conversationalist:
		Decide yes;
	Decide no;

[The greeting is issued by the greeting action when a conversation starts, if it has a value.]
A person has some text called the greeting.
A person has some text called the goodbye.

Chapter 1.1.1d - Responses

[The default dialogue response is issued when talking about something that isn't recognized as a subject/thing, or when the person doesn't have an available response in their conversation table.]
A person has some text called the default dialogue response.

Part 1.1.2 - Dialogue

Chapter 1.1.2a - Dialogue Table

[Dialogue for subjects are stored in tables; each person should have their own table but it's possible to share.
Subject: The thing/subject being asked about
Availability: If the dialogue is available
Cue: If defined, printed as part of the 'talk to' action to hint at this subject
Turn stamp: The turn the subject was last talked about
Response: The textual response]

A person has a table-name called the dialogue.
The dialogue of a person is usually the Table of No Dialogue.

Table of No Dialogue
subject (an object)	availability (a truth state)	cue (a text)	turn stamp (a number)	response (some text)
--	--	--	--	--

Chapter 1.1.2b - Manipulating Cues

[Phrases for easily manipulating the cues in someones dialogue]

To update the cue of (subject - an object) for (conversationalist - a person) to (cue - some text):
	Repeat through dialogue of the conversationalist:
		If there is a subject entry and the subject entry is subject:
			Now cue entry is cue;
			Stop;
	[No update was performed, so try to add a new subject]
	If number of blank rows in dialogue of the conversationalist is 0:
		Say "ERROR: Dialogue table for [conversationalist] is full, unable to add [subject].";
	Else:
		Choose a blank row in dialogue of the conversationalist;
		Now availability entry is false;
		Now subject entry is subject;
		Now cue entry is cue;
		Now response entry is "";

To clear the cue of (subject - an object) for (conversationalist - a person):
	Repeat through dialogue of the conversationalist:
		If there is a subject entry and the subject entry is subject:
			Blank out the cue entry;
			Stop;

Chapter 1.1.2c - Manipulating Responses

[Phrases for easily manipulating the responses in someones dialogue]

To update the dialogue of (subject - an object) for (conversationalist - a person) to (response - some text):
	Repeat through dialogue of the conversationalist:
		If there is a subject entry and the subject entry is subject:
			Now response entry is response;
			Stop;
	[No update was performed, so try to add a new subject]
	If number of blank rows in dialogue of the conversationalist is 0:
		Say "ERROR: Dialogue table for [conversationalist] is full, unable to add [subject].";
	Else:
		Choose a blank row in dialogue of the conversationalist;
		Now availability entry is false;
		Now subject entry is subject;
		Now cue entry is "";
		Now response entry is response;

To clear the response of (subject - an object) for (conversationalist - a person):
	Repeat through dialogue of the conversationalist:
		If there is a subject entry and the subject entry is subject:
			Blank out the response entry;
			Stop;

Chapter 1.1.2d - Toggling Availability

[Phrases for easily manipulating the availability of subjects in someones dialogue]

To activate (subject - an object) for (conversationalist - a person):
	Repeat through dialogue of the conversationalist:
		If there is a subject entry and the subject entry is subject:
			Now availability entry is true;
			Stop;

To deactivate (subject - an object) for (conversationalist - a person):
	Repeat through dialogue of the conversationalist:
		If there is a subject entry and the subject entry is subject:
			Now availability entry is false;
			Stop;

Chapter 1.1.2e - Checking For Dialogue

To decide whether (subject - an object) has been conversed about with (conversationalist - a person):
	Repeat through dialogue of the conversationalist:
		If there is a subject entry and the subject entry is subject:
			If there is a turn stamp entry and the turn stamp entry > 0:
				Decide yes;
	Decide no;

Part 1.1.3 - Conversation Choices

[Status: In progress
Conversation choices is an option to use the cue entries in the dialogue table for creating menu driven conversations.]

Use conversation choices translates as (- Constant ENABLE_CONV_CHOICE; -).

Chapter 1.1.3a - Pending Conversations

[To keep track of the conversation in progress, we store the subjects]
The pending conversation is a list of objects that varies.

To decide whether conversation is pending:
	Unless conversation choices option is active:
		Decide no;
	If the pending conversation is empty:
		Decide no;
	If the current interlocutor is nothing:
		[NOTE - This shouldn't be possible, but we check regardless]
		Decide no;
	Decide yes;

Chapter 1.1.3b - Displaying the Conversation

[Go through the dialogue of the current interlocutor, printing any cues and building up the pending conversation]
To display the conversation choices:
	Let index be 1;
	Terminate the conversation;
	Repeat through dialogue of the current interlocutor:
		If there is a cue entry and there is an availability entry and the availability entry is true:
			If there is a cue entry and the cue entry is not default value of text and the subject entry is known:
				Add the subject entry to pending conversation;
				Say "[bracket][index][close bracket] [cue entry][line break]";
				Increment index;
	Unless index is 1:
		Say paragraph break;

Chapter 1.1.3c - Command Prompt

[NOTE We might want to change the command prompt variable, especially for when we implement the force choice option. TODO]

Chapter 1.1.1d - Termination

[Terminating the conversation is as simple as emptying the list]
To terminate the conversation:
	Truncate the pending conversation to 0 entries;

Book 1.2 - New Actions

Part 1.2.1 - Greeting

[Status: Complete]
Greeting is an action applying to one visible thing.
The specification of the greeting action is "Start the conversation with someone, marking them the current interlocutor."

Chapter 1.2.1a - Understand

[NOTE: more phrases would be useful]
Understand "greet [something]" as greeting.
Understand "hello --/there [something]" as greeting.
Understand "hi --/there [something]" as greeting.
Understand "hey --/there [something]" as greeting.

Does the player mean greeting a person: It is likely.
Does the player mean greeting the player: It is very unlikely.

Chapter 1.2.1b - Check

[Make sure that only the player initates the command]
Check an actor greeting (this is the only the player can say hello rule):
	Unless the actor is the player:
		If the noun is the player:
			Try the player greeting the actor;
			Stop the action;
		If the action is not silent:
			Say "There's no need to have [the actor] greet [the noun]." (A);
		Stop the action;

[Make sure that we're greeting something that can respond]
Check greeting (this is the greeting inanimate objects rule):
	Unless the noun provides the property dialogue and the noun provides the property greeting:
		Now the prior named object is nothing;
		If the actor is the player:
			Say "[We] [don't] expect to get much response from [the noun]." (A);
		Stop the action;

[Make sure we're not greeting someone we're already talking to]
Check greeting (this is the only greeting once rule):
	If the noun is greeted:
		If the action is not silent:
			Say "[We] [are] already talking to [the noun]." (A);
		Stop the action;

Chapter 1.2.1c - Carry Out

Carry out greeting (this is the carry out greeting rule):
	Unless the current interlocutor is nothing:
		Try taking leave of the current interlocutor;
	Now the current interlocutor is the noun;

Chapter 1.2.1d - Report

Report greeting (this is the report greeting rule):
	If the noun provides the property greeting and the greeting of the noun is not the default value of text:
		Say the greeting of the noun;
	Otherwise:
		If the player is the actor:
			Say "[We] [greet] [the noun]." (A);
		Else if the player can see the actor:
			Say "[The actor] [greet] [the noun]." (B);

Part 1.2.2 - Talking To

[Status: Complete
This is the main action for interacting with other characters in this extension. Checks the dialogue of the person to see which subjects are available, and which should be listed/hinted at.]

Talking to is an action applying to one visible thing.
The specification of the talking to action is "Engage someone in conversation, giving the player some options on subjects to talk about."

Chapter 1.2.2a - Understanding

Understand "converse --/with/to [something]" as talking to.
Understand "talk --/to/with [something]" as talking to.

Does the player mean talking to a person: It is likely.
Does the player mean talking to the current interlocutor: It is very likely.
Does the player mean talking to the player: It is very unlikely.

Chapter 1.2.2b - Check

[Make sure that we're talking to something that can respond]
Check an actor talking to (this is the talking to inanimate objects rule):
	Unless the noun provides the property dialogue and the noun provides the property greeting:
		Now the prior named object is nothing;
		If the actor is the player:
			Say "[We] [don't] expect to get much response from [the noun]." (A);
		Stop the action;

[Make sure the noun is greeted and set as current interlocutor]
Check an actor talking to (this is the greet before talking to rule):
	Unless the noun is greeted:
		Try the actor greeting the noun;

Chapter 1.2.2c - Carry Out

[Go through the person's dialogue options, and see if there are any that are available and have a defined cue.]
Carry out an actor talking to (this is the conversation cueing rule):
	If conversation choices option is active:
		Display the conversation choices;
		[If no entries were found, say goodbye]
		If the pending conversation is empty:
			Try the actor taking leave of the current interlocutor;
	Otherwise:
[DEBUG		Let index be 1;]
		Let cues be a list of text;
		Repeat through dialogue of the noun:
[DEBUG			Say "[index]: ";
			If there is a subject entry, say "[subject entry] ([if subject entry is known]known[else]unknown[end if]) ";
			If there is a availability entry, say "[if availability entry is not true]IN[end if]ACTIVE: ";
			If there is a cue entry, say "[cue entry] - ";
			If there is a response entry, say "[response entry]";
			Say line break;
			Increment index;]
			If there is a cue entry and there is an availability entry and the availability entry is true:
				If the subject entry is known, add the cue entry to cues;
		If the actor is the player:
			If the cues is empty:
				Say "[We] [can't] think of anything to talk to [the noun] about." (A);
			Else:
				Say "[We] [can] talk with [the noun] about [cues]." (B);

Chapter 1.2.2d - Report

Report an actor talking to (this is the report other conversations rule):
	If the actor is not the player:
		Say "[The actor] [talk] to [the noun]." (A);

Part 1.2.3 - Selecting

[Status: In progress
Selecting is the act of choosing a numbered response when conversation choices option is active.]

Selecting is an action applying to one number.

Chapter 1.2.3a - Understand

Understand "[number]" as selecting when conversation is pending.
Understand "say [number]" as selecting when conversation is pending.
Understand "select [number]" as selecting when conversation is pending.

Chapter 1.2.3b - Check

[Make sure a conversation is happening]
Check an actor selecting (this is the can only select when conversation is pending rule):
	Unless conversation is pending:
		If the player is the actor:
			Say "[We] [can] only select when talking with someone." (A);
		Else if the player can see the actor:
			Say "[The actor] [can] only select when talking with someone." (B);

[Make sure the number entered corresponds to an entry in the pending conversation]
Check an actor selecting (this is the select only valid options rule):
	Let choices be the number of entries in pending conversation;
	If the number understood is less than choices or the number understood is greater than choices:
		[NOTE: Choices will never be 0, based on the check above]
		Say "The [number understood] is not a valid option; please select a number between 1 and [choices]:[line break]";
		Display the conversation choices;
		Stop the action;

Chapter 1.2.3c - Carry Out

[Redirect to talking about the corresponding subject]
Carry out an actor selecting:
	Let selected be the number understood;
	Let subject be the entry selected of pending conversation;
	Try the actor talking to the current interlocutor about the subject;

Part 1.2.4 - Talking About

[Status: Complete
The act of actually talking to someone about a specific subject, using the dialogue table for responses.
Note that the understand phrases refer to 'any known', this will map to anywhere in the world model as long as that item is known.
Unknown items will be matched to the pondering about action below.]

Talking to it about is an action applying to one visible thing and one object.

Chapter 1.2.4a - Understanding

[Understand "talk --/to [something] about [any thing]" as talking to it about.]
Understand "talk to/with/-- [something] about [any known thing]" as talking to it about.
Understand "talk to/with/-- [something] about [any known subject]" as talking to it about.
Understand "talk to/with/-- [something] about [any known room]" as talking to it about.
Understand "converse with [something] about [any known thing]" as talking to it about.
Understand "converse with [something] about [any known subject]" as talking to it about.
Understand "converse with [something] about [any known room]" as talking to it about.

Does the player mean talking to a person about something: It is likely.
Does the player mean talking to the current interlocutor about something: It is very likely.
Does the player mean talking to the player about something: It is very unlikely.

Chapter 1.2.4b - Check

[Make sure that we're talking to a person]
Check an actor talking to something about (this is the talking with inanimate objects about it rule):
	Unless the noun provides the property dialogue:
		Now the prior named object is nothing;
		If the actor is the player:
			Say "[We] [don't] expect to get much response from [the noun]." (A);
		Stop the action;

[Make sure the noun is greeted and set as current interlocutor]
Check an actor talking to something about (this is the greet before talking to it about rule):
	Unless the noun is greeted:
		Try the actor greeting the noun;

[TODO Make sure that only the player is talking about]

[Redirect when conversation choices option is active]
Check an actor talking to something about (this is the can only talk about pending subjects rule):
	If conversation choices option is active:
		If second noun is listed in the pending conversation:
			[We don't really care if we arrived here by selection or directly]
			Continue the action;
		If conversation is pending:
			[Invalid choice in a pending conversation, reprint the choices]
			Let choices be the number of entries in pending conversation;
			Say "[regarding the second noun][Those] [are] not a valid option; please select a number between 1 and [choices]:[line break]" (A);
			Display the conversation choices;
		Otherwise:
			[Remind the player of how conversations work]
			Say the conversation redirection;
		Stop the action;

[Make sure the subject is known and dialogue is available
NOTE: This should never happen when conversation choices option is active, but we might want to add a check to be safe]
Check an actor talking to something about (this is the talking about known subjects rule):
	If the second noun is not known:
		Say "DEBUG - This shouldn't be needed?";
	Repeat through dialogue of the noun:
		If there is a subject entry and the second noun is the subject entry and the availability entry is true:
			Continue the action;
	If the action is not silent:
		If the actor is the player or the player can see the actor:
			If the noun provides the property default dialogue response and the default dialogue response of the noun is not the default value of text:
				Say "[default dialogue response of noun][paragraph break]" (A);
			Else:
				Say "[The noun] [don't] know what to say about [the second noun]." (B);
	Stop the action;

Chapter 1.2.4c - Carry Out

[Print the dialogue, log turn count and toggle availability for one-time dialogue.]
Carry out an actor talking to something about (this is the talking about subjects rule):
	Let index be 1;
	Repeat through dialogue of the noun:
[DEBUG		Say "[index]: ";
		If there is a subject entry, say "[subject entry] ([if subject entry is known]known[else]unknown[end if]) ";
		If there is a availability entry, say "[if availability entry is not true]IN[end if]ACTIVE: ";
		If there is a cue entry, say "[cue entry] - ";
		If there is a response entry, say "[response entry]";
		Say line break;
		Increment index;]
		If there is a subject entry and the second noun is the subject entry and the availability entry is true:
			Say "[response entry][paragraph break]" (A);
			Now turn stamp entry is the turn count;
			If the noun provides the property repeatable and the noun is not repeatable:
				Now the availability entry is false;
			Break;

[When using conversation choices, we want to continue the conversation]
Carry out an actor talking to something about (this is the continue conversations rule):
	If conversation choices option is active and the story has not ended:
		Try the actor talking to the noun;

Chapter 1.2.4d - Report

Report an actor talking to something about (this is the report specific conversation rule):
	If the actor is not the player:
		Say "[The actor] with [the noun] talks about [the second noun]." (A);

Part 1.2.5 - Pondering About Unknown Things

[If what the player writes isn't understood as a thing, we still want to catch and process it.]

Pondering to it about is an action applying to one thing and one topic.

Chapter 1.2.5a - Understanding

Understand "talk --/to/with [something] about [text]" as pondering to it about.
Understand "converse --/to/with [something] about [text]" as pondering to it about.

Chapter 1.2.5b - Check

[Make sure that we're talking to a person]
Check an actor pondering to something about something (this is the pondering with inanimate objects rule):
	Unless the noun provides the property dialogue and the noun provides the property greeting:
		Now the prior named object is nothing;
		If the actor is the player and the action is not silent:
			Say "[We] [don't] expect to get much response from [the noun]." (A);
		Stop the action;

Chapter 1.2.5c - Carry Out

Carry out an actor pondering to someone about something (this is the pondering unknown topics rule):
	If the actor is the player:
		If the noun provides the property default dialogue response and the default dialogue response of the noun is not the default value of text:
			Say "[default dialogue response of noun][paragraph break]" (A);
		Else:
			Say "[The noun] [don't] know what to say about that." (B);

Part 1.2.6 - Goodbyes

[Status: Complete]
Taking leave of is an action applying to one visible thing.

The specification of the taking leave of action is "End the conversation with someone, clearing the current interlocutor."

Chapter 1.2.6a - Understand

[NOTE: more phrases would be nice]
Understand "goodbye [something]" as taking leave of.
Understand "bye [something]" as taking leave of.
Understand "farewell [something]" as taking leave of.

Does the player mean taking leave of a person: It is likely.
Does the player mean taking leave of the current interlocutor: It is very likely.
Does the player mean taking leave of the player: It is very unlikely.

Chapter 1.2.6b - Check

[Make sure that only the player initates the command]
Check an actor taking leave of (this is the only the player can say goodbye rule):
	Unless the actor is the player:
		If the noun is the player:
			Try the player taking leave of the actor;
			Stop the action;
		If the action is not silent:
			Say "There's no need to have [the actor] take leave of [the noun]." (A);
		Stop the action;

[Make sure that we're taking leave of something that can respond]
Check taking leave of (this is the taking leave of inanimate objects rule):
	Unless the noun provides the property dialogue and the noun provides the property greeting:
		Now the prior named object is nothing;
		If the actor is the player:
			Say "[We] [don't] expect to get much response from [the noun]." (A);
		Stop the action;

[Make sure we're not taking leave of someone we're not already talking to]
Check taking leave of (this is the only taking leave of once rule):
	Unless the noun is greeted:
		If the action is not silent:
			Say "[We] [aren't] talking to [the noun]." (A);
		Stop the action;

Chapter 1.2.6c - Carry Out

Carry out taking leave of (this is the carry out taking leave rule):
	Now the the current interlocutor is nothing;
	Terminate the conversation;

Chapter 1.2.6d - Report

Report taking leave of (this is the report taking leave rule):
	If the noun provides the property goodbye and the goodbye of the noun is not the default value of text:
		Say the goodbye of the noun;
	Otherwise:
		If the player is the actor:
			Say "[We] [say] goodbye to [the noun]." (A);

Book 1.3 - Action Integration

Part 1.3.1 - Disabling Existing Interactions

The conversation redirection is initially "[bracket][If the noun is not nothing and the noun is a person][We] should [bold type]TALK TO[roman type] [regarding the noun]them about that instead[else]Use [bold type]TALK TO[roman type] to converse with other characters[end if][close bracket]".

Chapter 1.3.1a - Asking

Before an actor asking someone about (this is the disable asking about rule), say the conversation redirection instead;

Chapter 1.3.1b - Telling

Before an actor telling someone about (this is the disable telling about rule), say the conversation redirection instead;

Chapter 1.3.1c - Showing

Before an actor showing something to someone (this is the disable showing rule), say the conversation redirection instead;

Chapter 1.3.1d - Giving

Before an actor giving something to someone (this is the disable giving rule), say the conversation redirection instead;

Chapter 1.3.1e - Answering

Before an actor answering someone that (this is the disable answering rule), say the conversation redirection instead;

Chapter 1.3.1f - Commanding

Before asking someone to try doing something (this is the disable commanding rule), say the conversation redirection instead;

Part 1.3.2 - Adapting Existing Interactions

Chapter 1.3.2a - Going

Check someone going (this is the saying goodbye before leaving rule):
	If the actor is greeted:
		Try taking leave of the actor;


Check going (this is the saying goodbye before going rule):
	If the current interlocutor is a person:
		Try taking leave of the current interlocutor;

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

2017-04-01: Beta-2 (Release 2)

	Support for clearing cue and dialogue entries.

2017-09-07: Beta-3 (Release 3)

	Dialogue in Dialogue table is renamed response
	Subjects default to one-time instead of repeatable
	Option for choice-based conversation, take the cue as menu points
	Support for greetings, farewells, and forced conversations
	Option for talking with inanimate objects

Planned Features:

	A force-choice option for choice-based conversations

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

Section 2.1 - Subject-based Dialogue

Inform's default behavior is to allow conversation on text tokens, which handles just about anything the player types.
This approach has some downsides besides trying to decipher what the player actually means; we also don't have a simple way to apply properties to a topic.
The player's knowledge of conversation topics is one such thing that needs to be kept track of, which we do using Eric Eve's Epistemology extension with some minor modifications.
The 'subject' can be used for intangible subjects that have no physical representation, but we can also talk about specific rooms or things as long as they are 'known' (according to Epistemology's definition).
The property repeatable (or one-time) controls whether what we talk about should be disabled.
It's very important to make liberal use of 'understand' statements to link phrases the player might use to talk about the subject.

A subject isn't very interesting without a dialogue response for it from the other characters.
To facilitate this we use a table-based approach, which allows for both shared and individual dialogue options.
Each person has a 'dialogue' property which points to a table, which should look like the example below:

*:
	Library is a room.

	Bob is a person in Library.
	The dialogue of Bob is the Table of Bob's Dialogue.

	A conversation is a subject.
	Understand "conversations", "help --/on" and "talking" as conversation.

	Table of Bob's Dialogue
	subject (an object)	availability (a truth state)	cue (a text)	turn stamp (a number)	response (some text)
	conversation	true	"help on how to talk to other people"	--	"'You should try reading the documentation,' Bob answers. Not much help in that."

	Test me with "talk to bob / talk to bob about help".

The table needs to contain the following five columns:

	Subject: The subject (or any thing or room) the dialogue is for
	Availability: True/false to indicate whether the option is enabled
	Cue: If not blank, the text here is listed together to guide the player when using the 'talk to' action
	Turn stamp: The turn on which the dialogue was last talked about, or blank (--) if it's never been talked about
	Response: The text to output when talking about the option

It's also possible to write 'after talking to person about (subject/thing/room)' rules without suppressing the response.
Typically these would be to unlock the effects of talking about the subject, such as updating cues and making other dialogues available.

Each person also have their own default dialogue property, which will be used as the response to all subjects that are not listed in the dialogue table.
Only subjects that the player knows about (which is handled using Eric Eve's Epistemology extension) can be talked about in this manner.
Attempts to converse about an unknown thing will be caught by the pondering to it about action, which when the noun is a person will also use the default dialogue.

Section 2.2 - Choice-based Dialogue


TODO

*:
	Use conversation choices.
	A subject is usually one-time.
	A room is usually one-time.
	A thing is usually one-time.


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

Contained in this chapter is a technical description of all the new and altered mechanics for the extension, divided by type.
It's intended as a companion to the other chapters, although an experienced author could glean much of the previous information from this chapter alone.

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
	Response: The text to output when talking about the option.

Section 3.3 - Dialogue Phrases

The following phrases can be used to update the dialogues of a person, by altering the table that the dialogue property points to.

	UPDATE THE CUE OF (thing/subject/room) FOR (person) TO (text): Sets the cue text of the thing in the person's table to the given text. If the thing isn't listed in the table, it tries to find a blank row to insert a new row with no dialogue and 'false' availability. Often used after talking about something that no longer requires cueing.
	CLEAR THE CUE OF (thing/subject/room) FOR (person): Blanks out the cue of the thing in the person's table.
	UPDATE THE DIALOGUE OF (thing/subject/room) FOR (person) TO (text): Sets the dialogue text of the thing in the person's table to the given text. If the thing isn't listed in the table, it tries to find a blank row to insert a new row with the dialogue and 'false' availability.
	CLEAR THE DIALOGUE OF (thing/subject/room) FOR (person) : Blanks out the dialogue of the thing in the person's table. Rarely needed but provided for completion.
	ACTIVATE (thing/subject/room) FOR (person): Sets the availability of the thing in the person's table to true.
	DEACTIVATE (thing/subject/room) FOR (person): Sets the availability of the thing in the person's table to false.

It's also possible to check if something has been talked about with a given person:

	whether (thing/subject/room) HAS BEEN TALKED ABOUT TO (person): Checks if the turn stamp entry is filled in the person's dialogue table.

Example: ** Hard Rock - A conversational example

A short example showing how we can use both rooms, things and subjects in the dialogue table to form the conversation.

	*: "Hard Rock"

	Include Simple Conversations by Fictitious Frode.

	Cavern is a room.
	A mysterious chest is a container in cavern. It is closed, openable and fixed in place.
	A stone is in mysterious chest.

	Adam is a person in Cavern.

	Understand "this place" and "cave" as cavern.
	Some music is a subject.
	Understand "sound", "rock" and "roll" as music.

	The greeting of Adam is "'Hello there,' he greets you."
	The dialogue of Adam is the Table of Adam's Dialogue.

	Table of Adam's Dialogue
	subject (an object)	availability (a truth state)	cue (a text)	turn stamp (a number)	response (some text)
	cavern	true	"this place"	--	"'This is where I retreat to when the world gets to be too much,' he answers."
	mysterious chest	true	--	--	"'[if stone is known]It's just where I keep my rock collection[else]It wouldn't be much of a mystery if I told you that[end if],' he answers."
	stone	true	--	--	"'It's no longer rolling.'"
	music	true	--	--	"'Sometimes I like to bang [if stone is known]the stone[else]rocks[end if] against the cave walls.'"

	After talking to Adam about stone, update the cue of music for Adam to "rock 'n' roll music".

	Test me with "talk to adam / talk to adam about this place / talk to adam about chest / talk to adam about stone / open chest / talk to adam about chest / talk to adam about stone / close chest / talk to adam / talk to adam about rock / talk to adam about stone".

Example: ** Choices

TODO - Illustrate branching based on choices

When we are working with conversation choices we want subjects to deactivate after being talked about, which we can easily achieve by setting subjects to be usually one-time.
Similarly it might be a good idea to have subjects being unfamiliar as many of them are something to discover during a conversation and not something for the player to know or guess.

	*: "Choices"

	Include Simple Conversations by Fictitious Frode.
	Use conversation choices.
	A subject is usually one-time.
	A subject is usually unfamiliar.

Example: *** Buzzword - Communicating with inanimate objects

TODO - Set up an intercom you can talk to, where you need to have a password to be let in.

	*: "Buzzword"

	Include Simple Conversations by Fictitious Frode.
	Use conversation choices.
	A subject is usually one-time.
	A subject is usually unfamiliar.

	Office is a room.

	A small intercom is in Office. It is fixed in place.
	"A small intercom is mounted on the wall."
	The description is "A wire-mesh speaker/microphone with an activation button."

	Instead of pushing small intercom, try talking to it.
	Understand "use [small intercom]" and "activate [small intercom]" as talking to.

	The greeting of small intercom is "*buzz-crackle-hiss*[line break]'Passphrase please.[line break]*hiss-crackle-buzz".