 Introduction
==============

The Big Hairy Audacious Goal for the Erotic Storytelling extension is to make
writing AIFs as simple as writing the descriptions of responses and objects.
The actions and layered clothing model provided by the Erotic Storytelling 
extension goes a long way to accomplishing this goal, although a good game 
would still need some custom work to create good puzzles and interactions.

 The Features
==============

The extensions in the framework provides:
 * A system for layered clothing with body parts, including templates for
   both body parts and garments. Supports transparent and shiftable clothing.
 * Erotic actions that take clothing level and decency threshold of the location
   into consideration:
	- hugging a person
	- kissing a person
	- dancing with a person
	- touching a body part
	- rubbing a body part
	- pinching a body part
	- tickling a body part
	- spanking a body part
	- licking a body part
    - biting a body part
	- fucking a body part
 * A framework to provide consent for actions affecting other actors, similar
   to how persuasion rules work.
 * Optional framework for arousal based consent, similar to TADS libraries.
 * A model of simple conversations.

 Installation
==============

To install the extensions into Inform 7, use the File -> Install Extension
command inside Inform 7, navigate to the folder where you've unpacked the
extension files and select all the files apart from this readme. If you
have a previous version installed, you will be prompted to overwrite it.

In order to use the extensions in a story, you need to include the extensions
you want for your story. A full inclusion would look like this:

  Include Erotic Storytelling by Fictitious Frode.
  Include Simple Conversations by Fictitious Frode.
  Include Directionality by Fictitious Frode.

All of the extensions have proper documentation, available from the Extensions
tab inside Inform. This includes proper instructions on how to activate the
features and examples. Erotic Storytelling also includes an in-depth tutorial.

 Part Details
==============

 * Erotic Storytelling contains the functionality that is specific for the 
   adult parts of the game, including the layered clothing model and actions.
 * Template is an example of how a story can be organized.
 * Simple Conversations lets you define a list of subjects that your actors
   can have corresponding dialogue for. Supports varying the availability of
   dialogue options and cueing the player to viable subjects.
 * Directionality is a helper extension that automatically lists all visible 
   exits from a room, stating the destination if it is known to the player.

 What is New?
==============

Each individual extension has a more detailed log of changes.

  2016-12-01: Beta-1
 -------------
  * The previous framework has been completely reworked and rewritten, and
    the release history has been updated to only include the remake.

 Future Plans
==============

These are some ideas for future development:
 * Ropework
 * Posturing
 * Lasting Penetrations
 * Numerical Arousal (NACS)

 Contact Info
==============

The author of the framework can be reached in the following ways:
 * Mail: fictitious.frode@gmail.com
 * Blog: https://informedaif.wordpress.com/ is a blog dedicated to writing AIF
   with Inform 7, and is the official host of the framework. It contains both
   dicussions around AIF and tutorials on both Inform in general and this 
   framework in particular.
 * Reddit: https://www.reddit.com/r/AIFCentral/ is the subreddit for the AIF
   community, and the author checks this regularly.

Feedback of all varieties is welcome, but constructive criticism and discussion
is the most appreciated, along with reports of bugs and other issues. For
support I would appreciate using public communication, so that other may learn
from the request as well.

 Uninstalling
==============

To uninstall the framework (or perform cleanup of old versions) navigate to the
Inform folder, usually found in "My Documents" on windows or a similar location
on Mac and Linux. This contains an "Extensions" folder, which again contains
one folder for each author. Find the "Fictitious Frode" folder, and either
delete the whole folder to remove all the extensions, or enter it and remove
the extensions that are unwanted.