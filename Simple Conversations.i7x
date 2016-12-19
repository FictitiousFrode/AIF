Version 1/161203 of Simple Conversations by Fictitious Frode begins here.

Volume 1 - Simple Conversations

Book 1.1 - Concepts

[We use Inform's built-in 'topic' instead of creating a new type.]

Part 1.1.1 - Responses

A person has a table-name called the conversation responses.
The conversation responses of a person is usually the Table of Default Responses.

Table of Default Responses
topic	reponse (some text)	availability (a truth state)	cue (a text)	turn stamp (a number)
--	--	--	--	--

Part 1.1.2 - Knowledge

Book 1.2 - New Actions

Part 1.2.1 - Conversing With

Conversing with is an action applying to one thing.
[The specification of the conversing with action is "Conversing with engages a person in conversation, giving the player some options on topics to talk about."]

Chapter 1.2.1a - Understanding

Understand "converse --/with [something]" as conversing with.
Understand "talk --/to [something]" as conversing with.

Chapter 1.2.1b - Check

[Make sure that we're talking to a person]
Check an actor conversing with something (this is the conversing with inanimate objects rule):
	If the noun is not a person:
		Now the prior named object is nothing;
		If the actor is the player and the action is not silent:
			Say "[We] [don't] expect to get much response from [the noun]." (A);
		Stop the action;

Chapter 1.2.1c - Carry Out

[Go through the person's responses, and see if there are any that are available and have a defined cue.]
Carry out an actor conversing with someone (this is the conversation cueing rule):
	Let cues be a list of text;
	Repeat through conversation responses of the noun:
		If there is a cue entry and there is an availability entry and the availability entry is true:
			Add the cue entry to cues;
	If the actor is the player:
		If the cues is empty:
			Say "[We] [can't] think of anything to talk to [the noun] about." (A);
		Else:
			Say "[We] [can] talk with [the noun] about [cues]." (B);


Chapter 1.2.1d - Report

Report an actor conversing with someone (this is the report conversations rule):
	If the actor is not the player:
		Say "[The actor] talks to [the noun].";

Part 1.2.2 - Conversing About

Conversing with it about is an action applying to one thing and one topic.

Chapter 1.2.2a - Understanding

Understand "talk --/to [someone] about [text]" as conversing with it about.
Understand "converse --/with [someone] about [text]" as conversing with it about.

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
