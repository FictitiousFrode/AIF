Version 1/180202 of Snippets by Fictitious Frode begins here.
"A collection of code snippets for common concepts."

Snippets ends here.

---- DOCUMENTATION ----

Chapter 1 - Using this Extension

The purpose of this extension is to provide an easily testable repository of code snippets that can inspire or be re-used.
Most of the snippets come in the examples, but there is some discussion of concepts in the main documentation.

To make full use this extension, you need to download and install it (which you probably have if you're reading this) and open it's extension documentation in the IDE.

Section 1.1 - Overview

Section 1.2 - Version History

2018-01-11 (Release 1)

	Secret Doors and Passages

Section 1.3 - Contact Info

The author of this extension can be reached in the following ways:

	Mail: fictitious.frode@gmail.com
	Blog: https://informedaif.wordpress.com/ is a blog dedicated to writing AIF with Inform 7, and is the official host of the extension. It contains both dicussions around AIF and tutorials on both Inform in general and this extension in particular.
	Reddit: https://www.reddit.com/r/AIFCentral/ is the subreddit for the AIF community, and the author checks this regularly.
	GitHub: https://github.com/FictitiousFrode/AIF Contains the latest version of the extension, possibly including functionality that hasn't been released yet.

Feedback of all varieties is welcome, but constructive criticism and discussion is the most appreciated, along with reports of bugs and other issues.
For support I would appreciate using public communication, so that other may learn from the request as well.

Chapter 2 - Secrets

Section 2.1 - Secret Doors and Passages

Having the player discover new passages is a staple of Interactive Fiction, often called secret doors although the passage doesn't need to be a door.

The standard Inform 7 rules has built-in support for this using the not well-documented "undescribed" property, which completely removes the thing in question from scope.
The "can't go through undescribed doors rule" uses this property to stop the player from passing through an undescribed door, and we can combine this with an external action triggering the availability of the passage.
This is shown in the Concealed Passages example.

Another approach to secret doors is something that is obviously present in the room but has obvious method of travel or opening, which would make the "openable" property of doors seem like a natural fit.
When we have a non-openable door connecting two rooms and try to go in the direction of the door, Inform correctly detects that the door is there.
Unfortunately it then tries to open that door which results in a "That isn't something we can open" message instead of "We can't go that way", which alerts the player to the presence of a secret door.
We can work around this with some alterations to the default rules, as seen in the Secret Doors example.


Regardless of which method is used to implement secret doors, they have the additional complication of being present in both rooms.
We therefore have to tailor both the description and appearance in room description according to where the player is.
It's often useful to understand different synonyms for the door depending on location as well.


Example: ** Concealed Passages

	*: "Concealed Passages"

	When play begins, say "A small snippet showing secret doors can be implemented using the undescribed property."

	Section - The World Model

	The Study is a room.
	"A small study is nestled in the east end of the library. A [massive desk] in the center of the room vies for attention with the [shelves] covering the northern wall. Tall [glass windows] cover the south and eastern walls, flooding the room in natural sunlight and providing a magnificent view of the sprawling garden outside."

	Some glass windows are scenery in Study.
	The description is "The tall windows lets the sun illuminate the room while affording a good view of the garden outside."
	Instead of opening glass windows, say "These windows aren't made for opening."

	Some shelves is scenery in Study.
	The description is "Massive shelves filled with all sorts of books cover the entire northern wall.[if dark passage is not undescribed] The middle shelf has swung open, revealing a dark passage behind."
	Understand "bookshelf" and "bookshelves" as shelves.

	A dark passage is a door. It is north of Study and south of Dark Hallway. It is open, not openable and undescribed.
	"A dark passage leads [if player is in Study]in[else]out[end if]side."

	Dark Hallway is a room.
	"[If dark passage is undescribed]Faint electrical light inset in the roof[else]A beam of bright light from the open passage to the south[end if] illuminates a brick-lined hallway descending into darkness."

	Understand "bright" as dark passage when the player is in Dark Hallway.

	Instead of going west in Study, say "You aren't ready to leave just yet."
	Instead of going inside in Study when dark passage is not undescribed, try going north.
	Instead of going outside in Dark Hallway when dark passage is not undescribed, try going south.
	Instead of going north in Dark Hallway, try going down.
	Instead of going down in Dark Hallway, end the story finally saying "Trundling down into darkness wasn't the best of ideas. You're eating by a grue."

	Section - Passage Activation

	A massive desk is a supporter in Study.
	The description is "A massive desk dominates the room. It's owner must be of the fastidious kind, as the only clutter on the desk is an ornamental statue depicting a bronze lion."

	A bronze lion statue is on massive desk. It is fixed in place.
	The description is "The statue depicts a male lion standing on its hind legs."

	Instead of pulling bronze lion statue, try pushing bronze lion statue.
	Instead of pushing bronze lion statue:
		If dark passage is undescribed:
			Say "The statue gives way ever so slightly and the bookshelves pivots silently into the room, revealing a dark passage behind.";
			Now the dark passage is described;
			The passage blocking happens in 1 turn from now;
		Otherwise:
			Say "You wriggle the statue back and forth but nothing happens.";

	At the time when the passage blocking happens:
		If the player can see dark passage, say "The cabinet slides back into place, closing off the dark passage.";
		Now the dark passage is undescribed;

	Test me with "n / x shelves / push shelves / x desk / x statue / push statue / g / g / enter passage / x passage / down"


Example: *** Secret Doors

	*: "Secret Doors"

	When play begins, say "A small snippet showing secret doors can be implemented using the unopenable property."

	Section - The World Model

	The Study is a room.
	"A small study is nestled in the east end of the library. A [massive desk] in the center of the room vies for attention with the [shelves] covering the northern wall. Tall [glass windows] cover the south and eastern walls, flooding the room in natural sunlight and providing a magnificent view of the sprawling garden outside."

	Some glass windows are scenery in Study.
	The description is "The tall windows lets the sun illuminate the room while affording a good view of the garden outside."
	Instead of opening glass windows, say "These windows aren't made for opening."

	Some shelves is a door. It is closed and not openable. It is north of Study and south of Dark Hallway.
	The description is "Massive shelves filled with all sorts of books cover the entire northern wall.[if shelves are open] The middle shelf has swung open, revealing a dark passage behind."
	Understand "bookshelf" and "bookshelves" as shelves.
	Understand "passage" as shelves when shelves are open.
	Understand "bright" as shelves when the player is in Dark Hallway.
	Understand "dark" as shelves when the player is in Study.

	Rule for writing a paragraph about shelves:
		Now shelves are mentioned;
		If shelves are open, say "A dark passage leads [if player is in Study]in[else]out[end if]side."

	Dark Hallway is a room.
	"[If shelves are open]Faint electrical light inset in the roof[else]A beam of bright light from the open passage to the south[end if] illuminates a brick-lined hallway descending into darkness."

	Instead of going west in Study, say "You aren't ready to leave just yet."
	Instead of going inside in Study when shelves are open, try going north.
	Instead of going outside in Dark Hallway when shelves are open, try going south.
	Instead of going north in Dark Hallway, try going down.
	Instead of going down in Dark Hallway, end the story finally saying "Trundling down into darkness wasn't the best of ideas. You're eating by a grue."

	Section - Passage Activation

	A massive desk is a supporter in Study.
	The description is "A massive desk dominates the room. It's owner must be of the fastidious kind, as the only clutter on the desk is an ornamental statue depicting a bronze lion."

	A bronze lion statue is on massive desk. It is fixed in place.
	The description is "The statue depicts a male lion standing on its hind legs."

	Instead of pulling bronze lion statue, try pushing bronze lion statue.
	Instead of pushing bronze lion statue:
		If shelves are closed:
			Say "The statue gives way ever so slightly and the bookshelves pivots silently into the room, revealing a dark passage behind.";
			Now the shelves are open;
			The shelf closing happens in 1 turn from now;
		Otherwise:
			Say "You wriggle the statue back and forth but nothing happens.";

	At the time when the shelf closing happens:
		If the player can see shelves, say "The cabinet slides back into place, closing off the dark passage.";
		Now the shelves are closed;

	Section - Adapting Default Rules

	The convert enter door into go rule does nothing when entering a closed unopenable door.

	Check an actor going through a closed door (this is the can't go through unopenable doors rule):
		If the door gone through is not openable:
			If the actor is the player, say "[text of can't go that way rule response (A)]";
			Stop the action;

	Test me with "n / x shelves / push shelves / x desk / x statue / push statue / g / g / enter passage / x passage / down"
