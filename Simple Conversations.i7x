Version 1/161203 of Simple Conversations by Fictitious Frode begins here.

Include Epistemology by Eric Eve.

To shrug is a verb.

Volume 1 - Simple Conversations

Book 1.1 - Concepts

Part 1.1.1 - Conversations

[We could have used Inform's built-in 'topic' instead of creating a new type, but we need some extra data.
This also simplifies the actions as we can refer to things for both topics and specific things.]

[DEPRECATED A subject can be enabled or disabled. A subject is usually enabled.]
A subject can be repeatable or one-time. A subject is usually repeatable.

Part 1.1.2 - Conversation Responses

A person has a table-name called the conversations.
The conversations of a person is usually the Table of Default Conversations.

Table of Default Conversations
subject (a thing)	availability (a truth state)	cue (a text)	turn stamp (a number)	response (some text)
--	--	--	--	--

Part 1.1.3 - Knowledge

Book 1.2 - New Actions

Part 1.2.1 - Talking To

Talking to is an action applying to one thing.
[The specification of the talking to action is "Talking to engages a person in conversation, giving the player some options on subjects to talk about."]

Chapter 1.2.1a - Understanding

Understand "converse --/with [something]" as talking to.
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

[Go through the person's conversations, and see if there are any that are available and have a defined cue.]
Carry out an actor talking to someone (this is the conversation cueing rule):
	Let cues be a list of text;
	Repeat through conversations of the noun:
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

Talking to about is an action applying to one thing and one visible thing.

Chapter 1.2.2a - Understanding

Understand "talk --/to [something] about [any thing]" as talking to about.
Understand "talk --/to [something] about [any known thing]" as talking to about.
Understand "converse --/with [something] about [any thing]" as talking to about.
Understand "converse --/with [something] about [any known thing]" as talking to about.

[TODO:
Understand "think about [text]" as pondering.

Report pondering:
say "[no thoughts]"]

Chapter 1.2.2b - Check

[Make sure that we're talking to a person]
Check an actor talking to about something (this is the conversing about with inanimate objects rule):
	If the noun is not a person:
		Now the prior named object is nothing;
		If the actor is the player and the action is not silent:
			Say "[We] [don't] expect to get much response from [the noun]." (A);
		Stop the action;

[TODO: Make sure the conversation is enabled and response is available]
Check an actor talking to about something (this is the conversation viability rule):
	If the second noun is not known:
		If the action is not silent:
			If the actor is the player:
				Say "[We] [don't] know what to say about that." (A);
			Else if the player can see the actor:
				Say "[The noun] [shrug]." (B);
		Stop the action;

[TODO: Make sure the thing is in scope if not a conversation]

Chapter 1.2.2c - Carry Out

[TODO: Print the output, and toggle availability for one-time responses.]

Chapter 1.2.2d - Report

Report an actor talking to someone (this is the report specific conversation rule):
	If the actor is not the player:
		Say "[The actor] talks to [the noun] about [the second noun]." (A);

Book 1.3 - Action Integration

Part 1.3.1 - Asking

Part 1.3.2 - Telling

Part - Showing

Part - Giving

Part - Answering it That

Simple Conversations ends here.

---- DOCUMENTATION ----

Example 281 (**): Farewell
Example 282 (**): Sweeney

Feature wishlist:
Talk To Person:
Checks the responses of the person to see which topics are available, and which should be hinted at.

Talk To Person About Topic:
Check that the topic is available.
	-> "I wouldn't know what to say about that!"
Check that the person has a response, and the reponse is available:
	-> "They don't have anything to say about that."

Greeting/Good-Bye when conversation starts and ends



[TODO: A brief introduction on the various styles of conversation, converging on why we've chosen the approach we have.
Over time, IF has evolved into two main styles of conversation, either using a branching tree of options to converse about or a keyword based approach.

TODO: How the conversation model works

TODO: Examples of the conversation model in play]
