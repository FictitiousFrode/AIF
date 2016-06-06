Version 2/150126 of Ropework by Fictitious Frode begins here.

"Makes rope available, that can be used to tie things. This is based on example 228, but modified and cleaned up."

Book 1 - Rope

Part 1.1 - Definitions

A rope is a kind of thing.
The specification of rope is "A rope is a magical thing in IF, and can be used to 'tie' attachable items together, which could possible hinder movement. It's also possible to pull on it, to see if the other end is movable."
[Attachment is the relation that governs what rope is fastened to.]
Attachment relates things to each other in groups. The verb to be stuck to means the attachment relation.
[Defining what can be attached]
A thing can be attachable. A thing is usually not attachable.

[Defnining free and tied.]
Definition: A thing is free if it is not tied.
Definition: A rope is free if the number of non-rope things stuck to it is less than 2.
Definition: A thing is tied if the number of things stuck to it is greater than 1.
[Definitions for movement]
Definition: A thing is hindering if it is stuck to the noun and it is not within the location.
Definition: Something is anchored if it is fixed in place or it is scenery or it is part of an anchored thing.
Definition: Something is draggable if it is not had by the player and it is not the player and it is not anchored.

[Some shortcuts:]
Definition: A thing is non-rope if it is not a rope.
Definition: A thing is secondary if it is not the noun.
Definition: A thing is pullable if it is not the noun and it is not the player.

To decide what room is the home of (item - a thing):
	If item is a door:
		Let front cut be the number of moves from the location to the front side of the item;
		Let back cut be the number of moves from the location to the back side of the item;
		If front cut is -1, let front cut be 999;
		If back cut is -1, let back cut be 999;
		If the location encloses the item, decide on the location;
		If front cut is greater than back cut, decide on the back side of the item;
		Decide on the front side of the item;
	Decide on the location of the item.

Part 1.2 - Descriptions

[Alter how rope is described in a room.]
Rule for writing a paragraph about a rope (called the coil) (This is the description of rope in room rule):
	If the coil is stuck to something which is in a room (called the next room) which is not the location:
		Let the way be the best route from the location to the next room;
		If the way is up or the way is down:
			Say "[The coil] runs [way][if next room is visited] into [the next room][end if]." (A);
		Otherwise:
			Say "[The coil] snakes across the floor [way][if next room is visited] towards [the next room][end if]." (B);
	Otherwise:
		Say "There is [a coil] here[if the coil is stuck to a visible non-rope thing], tied to [the list of non-rope visible things which are stuck to the coil][end if]." (C);

[Alter how items attached to rope is described in a room.]
Rule for writing a paragraph about a non-rope thing (called the anchor) which is stuck to a rope (called the coil) (This is the description of roped item in room rule):
	If the coil is in an adjacent room:
		Let the next room be the home of the coil;
		Let the way be the best route from the location to the next room;
		If the way is up or the way is down:
			Say "[The coil] runs [way] from [the anchor][if next room is visited] into [the next room][end if]." (A);
		Otherwise:
			Say "From [the anchor] runs [a coil], heading off toward [the way]." (B);
	Otherwise: [TODO: This needs looking into; also making it not reveal other rooms]
		If the coil is stuck to something which is not visible,
			say "[The coil] is tied to [the anchor][if the coil is stuck to something in an adjacent room (called the next room)], and from there runs off towards [the next room][end if]." (C);

[Alter how rope is described when carried.]
After printing the name of a rope (called the tied object) while taking inventory (this is the description of carried rope rule):
	If something non-rope is stuck to the tied object:
		Say " (attached to [the list of non-rope things which are stuck to the tied object])" (A);
	Otherwise:
		Say " (with both ends free)" (B);

[List what the rope is tied to when examined.]
Report examining a rope (called the cord) when something is stuck to the cord (this is the description of rope rule):
	Say "[The noun] [are] tied to [the list of secondary things which are stuck to the noun]." (A);

[Mention that something attached to a rope, is attached to a rope.]
Report examining something non-rope which is stuck to something secondary (this is the description of roped item rule):
	Say "[If the noun is the player][We][else][The noun][end if] [are] attached to [the list of secondary things stuck to the noun]." (A);
	
Book 2 - Actions

[We need to make so the rope can be interacted with when it's attached to something in the player's location. This allows the rope to effectively be in several locations at once.]
After deciding the scope of the player:
	If something stuck to a rope (called the coil) is in the location, place the coil in scope.

[If the rope is attached to something we can see and touch, we can also touch the rope.]
A reaching inside rule:
	If the noun is a rope:
		Repeat with the anchor running through the list of visible thing stuck to the noun:
			If the anchor is touchable, allow access.

Book 2.1 - Tying

[Tying is defined in the standard rules, but blocked by default. We disable the block, and instead check that only rope can be tied to anchors.]
The block tying rule is not listed in the check tying it to rulebook.
Understand "Tie [something attachable] to [rope]" as tying it to.
Understand "Tie [rope] to [something attachable]" as tying it to (with nouns reversed).
To loop is a verb.
To knot is a verb.

Check an actor tying something to something (this is the check tying rope rule):
[Before tying something to a rope:]
	If the noun is stuck to the second noun, say "[The list of things stuck to the second noun] [are] already tied together." (A) instead;
	If the second noun is not free, say "[The second noun] [have] no free ends." (B) instead;
	If the noun is not attachable, say "[if the actor is the player][We][else][The Actor][end if] [cannot] realistically tie anything to [the noun]." (C) instead.

[The action itself is just updating the attachment relation.]
Carry out an actor tying something to something (this is the carry out tying rope rule):
	Now the noun is stuck to the second noun;

Report an actor tying something to something (this is the report tying rope rule):
	Say "[if the actor is the player][We][else][The Actor][end if] [loop] [the second noun] around [the noun] and [knot] firmly." (A);

[These improve out understanding of what the player means.]
Instead of an actor tying something to a non-rope tied thing (this is the append to rope rule):
	Let the coil be a random rope stuck to the second noun;
	Try the actor tying the noun to the coil.

Instead of an actor tying a non-rope tied thing to something (this is the append rope rule):
	Let the coil be a random rope stuck to the noun;
	Try the actor tying the second noun to the coil.

Instead of an actor tying a free non-rope thing to a free non-rope thing:
	If the actor carries a free rope (called the coil):
		Try the actor tying the noun to the coil;
		If the noun is stuck to the coil and the coil is free, try the actor tying the second noun to the coil;
	Otherwise:
		Say "[if the actor is the player][We][else][The Actor][end if] [lack] the requisite spare rope."

Book 2.2 - Untying

[We need a new action to reverse the tying action.]
Untying it from is an action applying to two things.
Understand "untie [something] from [something]" and "untie [something]" as untying it from.

Rule for supplying a missing second noun while untying something from:
	If the number of secondary things stuck to the noun is 0, say "[The noun] [are not] attached to anything." instead;
	If the noun is a rope:
		If the number of touchable non-rope things which are stuck to the noun > 1:
			Say "You'll have to say which thing you want to untie [the noun] from.";
			Rule fails;
		Otherwise:
			if the number of touchable non-rope things stuck to the noun is 0, say "You can't reach [the random non-rope thing stuck to the noun]." instead;
			let the tied object be a random touchable non-rope thing which is stuck to the noun;
			say "(from [the tied object])[line break]";
			now the second noun is the tied object;
	otherwise:
		if the noun is stuck to a rope (called the tied object):
			say "(from [the tied object])[line break]";
			now the second noun is the tied object.


Before untying a rope from something: try untying the second noun from the noun instead.

Before untying something from a rope:
	if the second noun is not held:
		say "(first picking up [the second noun])[line break]";
		try taking the second noun.

Check untying it from:
	unless the noun is stuck to the second noun or the second noun is stuck to the noun,
		say "[The noun] and [the second noun] are already not tied together." instead.

Carry out untying it from:
	now the noun is not stuck to the second noun.

Report untying it from:
	say "Untied."

Book 2.3 - Dragging

After reading a command: now every thing is unmentioned.

Before pulling something anchored: say "[The noun] is firmly anchored." instead.

Instead of pulling something tied:
	if the noun is unmentioned:
		say "The impulse is transmitted to [the list of pullable things stuck to the noun].";
		repeat with item running through pullable things stuck to the noun:
			say "[item]: [run paragraph on]";
			try pulling the item;
		if the noun is a rope and the noun is not within the location:
			if the number of non-rope hindering things is 0, move the noun to the location;
	otherwise:
		continue the action.

Before pulling something which is not visible:
	if the noun is anchored:
		say "[The noun] resists, for whatever reason." instead;
	otherwise:
		let space be the holder of the noun;
		let way be the best route from the space to the location;
		if the way is a direction:
			move the noun to the location;
			say "[The noun] [if the way is up]rises[otherwise]slides[end if] into view." instead;
		otherwise:
			move the noun to the location;
			say "[The noun] slides into view." instead.

Book 2.4 - Movement Restrictions

Before going a direction (called the way) when the player has something (called the link) which is stuck to something anchored (called the anchor):
	let the next room be the home of the anchor;
	if the next room is not a room, continue the action;
	if the next room is the location:
		if the link is stuck to at least two anchored things,
			say "You can't go far while you're carrying [the link] tied to [the list of anchored things stuck to the link]." instead;
	otherwise:
		let the safe way be the best route from the location to the next room;
		if the safe way is the way:
			if the player is not stuck to the anchor, say "(coiling up your rope again as you go...)";
		otherwise:
			if the safe way is a direction,
				say "While you have [the link] you can't really head any direction but [best route from the location to the next room]." instead;
			otherwise say "You're tied up here." instead.

Before going a direction (called the way) when the player is stuck to something anchored (called the anchor):
	let the next room be the home of the anchor;
	if the next room is not a room, continue the action;
	if the next room is the location:
		if the player is stuck to at least two anchored things,
			say "You can't go far while you're tied to [the list of anchored things stuck to the player]." instead;
	otherwise:
		if the best route from the location to the next room is the way:
			say "(coiling up your rope again as you go...)";
		otherwise:
			say "Your attachments prevent you going any way but [best route from the location to the next room]." instead.

[Sometimes, if the player is tied to a movable object, the moved object will move with him.]

After going somewhere when the player has something (called the link) which is stuck to something draggable:
	if the player is not stuck to the link:
		say "You drag along behind you [the list of draggable things which are stuck to the link].";
		now every draggable thing which is stuck to the link is in the location;
	continue the action.

Report going somewhere when the player is stuck to something draggable:
	say "You drag along behind you [the list of draggable things which are stuck to the player].";
	now every draggable thing which is stuck to the player is in the location.

Ropework ends here.

---- DOCUMENTATION ----

Chapter - Using this Extension

Rope is an incredibly powerful tool in an Interactive Fiction game, as the player can use it to many various effects. This extension enables the use of a generic "rope", which can be used to attach various objects.

Section - Definitions

The extension introduced a few terms to control how rope is handled:

	Attachable: A property of things to determine wether rope can be attached to it.
	Attachment relation: Controls which items are currently bound together with rope.
	Free/Tied: A thing is free if nothing is attached to it, and tied if it has something (including the rope) attached to it. A rope on the other hand is free if has less than two things stuck to it (i.e., it has a free end).
	Anchored: A thing that can't be pulled. Determined by the things fixed in place property (which is assumed by the scenery type). Also handles sub-parts of anchored things.
	Draggable: A thing that can be pulled along with the player, the reverse of anchored (excluding the player and items carried by the player).
	Non-rope: Any thing that isn't rope.

Section - Tying

Tying something to a rope is as simple as "Tie [something attachable] to [rope]", and it also supports the reverse. Similarly, "untie [something] from [something]" and "untie [something]" tries to untie the thing from the rope.

Section - Pulling and Dragging

Rope can be pulled on, which wil move non-anchored items towards the player. If the rope is attached to the player, and the player tries to move somewhere, any non-anchored items will be pulled along with the player. Anchored items will block the action however, both pulling and player movement.

Chapter - Technical Notes

This extension is heavily based on example 228, but modified and cleaned up. 

*Important*: There is one critical bug (which is inherited from the official example); using the 'ACTIONS' command will *completely* break handling of rope.

*Also Important*: Rope is a very tricky thing in IF, so it needs to be tested throughly to avoid letting the player perform unwanted actions.

Chapter - Integration with Other Parts of the Framework

Ropework is a standalone extension, but Kinky Story Actions makes use of it to enable bondage.

Section - Version History

Release 2 (v1.1)

	Improvements and optimizations to the code.
	Integration with body parts
	Improved documentation all around.

Section - Contact Info

The author of the framework can be reached in the following ways:

	* Mail: fictitious.frode@gmail.com
	* Blog: https://informedaif.wordpress.com/ is a blog dedicated to writing AIF with Inform 7, and is the official host of the framework. It contains both dicussions around AIF and tutorials on both Inform in general and this framework in particular.
	* Reddit: https://www.reddit.com/r/AIFCentral/ is the subreddit for the AIF community, and the author checks this regularly.

Feedback of all varieties is welcome, but constructive criticism and discussion is the most appreciated, along with reports of bugs and other issues. For support I would appreciate using public communication, so that other may learn from the request as well.

Example: ** Learning the Ropes - A short example of ropes in action.

	Use full-length room descriptions.

	The Fallow Field is a room. "The very land is gloomy, the earth plowed into untended rows that yield no fruit, shadowed by the castle to the north. A chasm, no doubt the product of some upheaval of the earth, opens before your feet.". An oak stump is fixed in place in the Field. "From an oak stump, a few hopeful shoots grow."

	A hempen rope is a rope in the field. It is stuck to the oak stump and the wooden chest. The stump is attachable. The description of hempen rope is "It's a rope made of hemp."

	The Chasm is below the Field. "Your person is most uncomfortably pressed on every side by the closeness of the walls; to which you may add as a further inconvenience, that the irregularity of the floor making it difficult to walk upright." An iron key is in the Chasm. "An iron key nestles in the cleft of earth, its age indicated by its implausibly great size."

	The wooden chest is an attachable closed openable container in the Chasm. The description of the wooden chest is "A handsome, solid case not long committed to its dank enclosure, or it would long since have rotted." Rule for printing the name of the wooden chest when the chest is not handled: say "deadweight". Understand "dead" or "weight" or "deadweight" as the chest. Before pulling the wooden chest: now the chest is handled.

	In the chest is a heavy dagger. The description of the dagger is "Set with red jewels and of a wicked aspect."

	Before going down from the Field when the player is not stuck to something anchored:
		say "You don't quite dare simply leap into the darkness without some anchor." instead.

	Before going down from the Field:
		let anchor be a random anchored thing which is stuck to the player;
		say "You lower yourself gingerly, hoping that [the anchor] holds your weight..."

	Before going up from the Chasm:
		if the player cannot touch a rope which is stuck to an anchored thing which is in the Field, say "And how, precisely, do you mean to do that?" instead.

	The Castle Hall is north of the Field. "All is desolate: the great hall has no roof, nor is there any glass in the windows. A staircase without banister ascends inside the wall to a musician's gallery without song."

	The Musician's Gallery is above the Castle Hall. "Of its former cheery aspect only this remains to the Gallery: that chevrons of red and yellow are painted on the wall. But as these are streaked with rain and grime, the banister pulled away, the roof open to the sky, and the corners made a nesting place for birds, the consolation thereby afforded is but slight."

	The pointed door is north of the Musician's Gallery and south of the Sinister Attic. It is a closed locked openable door. "A pointed door of particularly grim and uninviting aspect leads north." The pointed door is lockable and attachable. The description of the pointed door is "A door coming to a gothic point and fitted with iron fittings of great strength. The handle looks particularly well-attached." The iron key unlocks the pointed door.

	A rule for reaching inside the Musician's Gallery:
		allow access.

	A rule for reaching inside the Sinister Attic:
		allow access.

	Instead of opening the pointed door for the first time:
		say "When you rattle at the door, there arises from beyond a terrible shrill noise as though something beyond exults in its imminent release."

	After opening the trapped pointed door when the player can see the pointed door:
		say "Thousands of bats fly from the pointed door, attacking you!";
		end the story.

	After opening the pointed door when the player cannot see the pointed door: now the pointed door is untrapped; continue the action.

	The pointed door can be trapped or untrapped. The pointed door is trapped.

	Before pulling the pointed door: try opening the pointed door instead.

	The player is attachable.

	After going to the sinister attic:
		say "You have arrived at the goal of your quest!";
		end the story finally.

	Test me with "x rope / pull rope / get chest / untie rope from chest / tie rope to me / down / get key / up / untie rope from stump / north / up / unlock pointed door with key / open it / tie rope to door / down / pull rope / up / north".

	Test death with "x rope / pull rope / get chest / untie rope from chest / tie rope to me / down / get key / up / untie rope from stump / north / up / unlock pointed door with key / open it / g"
