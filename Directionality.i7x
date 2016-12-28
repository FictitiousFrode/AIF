Version 2/161228 of Directionality by Fictitious Frode begins here.

"Provides automated listing of all exits from a room."

Include Epistemology by Eric Eve.

Carry out looking (This is the direction listing rule):
	Let known-exits be a list of text;
	Let unknown-exits be a list of text;
	Repeat with direction running through directions:
		Let destination be the room-or-door direction from location;
		If destination is a door:
			Let throughfare be destination;
			Let destination be the other side of destination from location;
			If destination is visited or destination is known, add "[Destination] is [direction] (through [throughfare])" to known-exits;
		Else:
			If destination is visited or destination is known, add "[Destination] is [direction]" to known-exits;
		If destination is not known and destination is unvisited, add "[direction]" to unknown-exits;
	If number of entries in known-exits is 0:
		If number of entries in unknown-exits is 0, say "There are no clear exits from here.";
		else say "There are exits [unknown-exits].";
	else:
		If number of entries in unknown-exits is 0, say "[Known-exits].";
		else say "[Known-exits]. There are also exits [unknown-exits].";

Directionality ends here.

---- DOCUMENTATION ----

Chapter 1 - Using this Extension

The main purpose for this extensions is for testing and development work, when room connections change and updating room descriptions can be easily forgotten.

To use this framework, you need to download and install it (which you probably have if you're reading this) and include it in your story:

*:
	Include Directionality by Fictitious Frode.

After printing the room description, Inform will now print a line listing all the exits from the current location.
If the player has knowledge of the destination by visiting it, the name will also be listed. 
Note that this does not check that the player knows that this exits leads to the destination.

Section 1.1 - Exploration

For games where the player is "exploring" an area that is know to the character, it's possible to set rooms as familiar, in order to have them show up in the destination listing.
Eric Eve's Epistemology extension is used to provide this support.

	The Library is north of the Hallway.
	The Hallway is familiar.

When determining wether an exit is known or unknown, it's not the exit that's being evaluated but the destination. 
This has some implications for rooms that are accessible from multiple directions, and shortcuts.

Secret/hidden connections are not handled, but is a point for future updates.

Section 1.2 - Version History

2015-01-26 (Release 1)

	Initial functionality.
	
Release 2 (In development)

	Incorporated Eric Eve's Epistemology instead of the custom 'known/unknown' property.
	Minor documentation changes.

Section 1.3 - Contact Info

The author of this extension can be reached in the following ways:

	Mail: fictitious.frode@gmail.com
	Blog: https://informedaif.wordpress.com/ is a blog dedicated to writing AIF with Inform 7, and is the official host of the extension. It contains both dicussions around AIF and tutorials on both Inform in general and this extension in particular.
	Reddit: https://www.reddit.com/r/AIFCentral/ is the subreddit for the AIF community, and the author checks this regularly.
	GitHub: https://github.com/FictitiousFrode/AIF Contains the latest version of the extension, possibly including functionality that hasn't been released yet.

Feedback of all varieties is welcome, but constructive criticism and discussion is the most appreciated, along with reports of bugs and other issues.
For support I would appreciate using public communication, so that other may learn from the request as well.

Example: * Directions to known and unknown rooms.

	Library is a room. "This is a library."
	Closet is inside from Library. "A small closet."
	Closet is familiar.
	Hallway is south of Library. "A long hallway."
	Bathroom is a room. "A public bathroom."
	A bathroom door is a door. A bathroom door is north of library and south of bathroom.

	Test me with "n / s / s / n"