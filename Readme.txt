 Introduction
==============

The Big Hairy Audacious Goal for this framework is to make writing AIFs as 
simple as writing a lot of AFTER descriptions. To a large extent this is made
possible with the extensions in this framework, although a good game would 
still need some custom work to create good puzzles and interactions. A large 
part of this is made possible with the Consent extensions, which makes it easy 
to block player actions and give properly customized failure messages.

 The Features
==============

The extensions in the framework provides:
 * A variety of pre-made body parts ready for use, and easy creation of custom
   body parts as needed.
 * A framework to provide consent for actions affecting other actors, similar
   to how persuasion rules work.
 * Two different forms of clothing, depending on what the story needs.
 * The actions kissing, licking, biting, touching, rubbing, pinching and 
   masturbation, and the all important fucking, including the use of toys.

 Installation
==============

To install the extensions into Inform 7, use the File -> Install Extension
command inside Inform 7, navigate to the folder where you've unpacked the
extension files and select all the files apart from this readme. If you
have a previous version installed, you will be prompted to overwrite it.

In order to use the extensions in a story, you need to choose what style you
want to write and include the relevant extensions in your I7 project. You will
need one extension each for Actions and clothing. The Part Details section 
below will go into more detail about these, but for your first story I suggest 
using the following:

  Include Erotic Story Actions by Fictitious Frode.
  Include Outfits by Fictitious Frode.

All of the extensions have proper documentation, available from the Extensions
tab inside Inform. This includes proper instructions on how to activate the
features and examples. Erotic Story Actions, as the "main" extension, includes
in-depth examples and tutorials.

 Part Details
==============

The framework consists of several extensions, which can be grouped into three 
broad categories: Actions, Clothing and Foundation.

The Action extensions provide the necessary actions that allows players to
properly experience an adult erotic story.
 * Erotic Story Actions provides the necessary actions writing a story-style, 
   where each action performed is a "complete" action, similar to how ADRIFT
   games usually operate.
 * Kinky Story Actions is an early beta extension that is meant to complement 
   Erotic Story Actions with actions required for BDSM-inspired gameplay. This
   includes support for bondage, spanking and gagging.

The Clothing extensions provide two differing ways of providing clothing for 
characters in your story:
 * Outfits is a simple clothing option, where un-/dressing happens mostly
   "behind the scenes", or similarly abstracted. Supports having other actors
   react to the players outfit.
 * Garments is a layered clothing option which allows player to control the
   clothing of actors in detail.

The support extensions provide optional support for authors that want it.
 * Arousal provides a simplified system for keeping track of and altering
   the arousal level of actors.
 * Directionality automatically lists all exits from a room, stating the
   destination if it is known to the player.
 * Posturing is a stand-alone extension that allows characters to assume 
   positions (or postures), along with pre-defined furniture to do so on.
   
The Foundation extensions provide basic functionality, and are usually not 
necessary to directly include.
 * Body Parts provides the titular body parts, but also sets the foundations
   for both of the clothing systems.
 * Consent provides a method for "obtaining consent" from actors before 
   performing actions involving them, and printing custom failure message
   when consent is denied.
 * Ropework enables the use of rope in various forms, and is included by Kinky
   Story Actions.

 What is New?
==============

This is meant as an overview, please see individual extensions for details.

  2016-01-26:
 -------------
  * Release 6M62 of Inform broke some of the functionality in the framework, 
    which this release restores. 
  * The relationships model has been changed. Overlying no longer is the same
    as covering, but instead is the reversal of the underlying relation. All
    custom garments must be updated, but it is now easier to refer to blocking
    garments, by use of the over-/underlying relation.
  * Directionality is a handy tool, mainly for the author's convenience, to 
    automatically list exits from rooms, keeping track of which destinations
    are known to the player.
  * Some updates on future plans, the previously planned Sexual Simulator 
    System will be replaced by several smaller extensions that build on Sexual 
    Actions.
  * Posturing is the first of these extensions, and is presented in a beta
    release that's functionally complete, but not yet throughly tested.
  * Arousal is a the second of these, and provides support for arousal levels
    and orgasms that are harder to obtain for each one.

  2015-04-28:
 -------------
  The proper version 1 release of the framework. Changes include:
   * Sexual Actions renamed to Erotic Story Actions to better reflect the
     style of adventure best supported by the extension. Expanded to include
     the "rough" actions of pinching and biting, and strapons are included and
     integrated.
   * Consent added as a new foundation extension, and integrated with Erotic
     Story Actions.
   * Body Parts and Garments expanded with hair and mouth, and integrated with
     Erotic Story Actions.
   * Improved understanding of what the player means.
   * Bug-fixes all around.
   * Improved documentation, especially in Erotic Story Actions, which includes
     a short example adventure.
   * Early public beta for Ropework.

  2015-03-25:
 -------------
  Expanded public beta; first release for the Sexual Actions extensions (later
  renamed to Erotic Story Actions). Outfits had quite a few bug-fixes, and
  all the extensions had a large documentation upgrade.

  2015-01-05:
 -------------
  Early public beta; contained the Body Parts, Outfits and Garments 
  extensions.

 Future Plans
==============

These are some ideas I might develop in the future, but no promises:
 * Body Parts could do with some more standard parts, but is pretty much 
   complete as it stands.
 * Consent is complete.
 * Garments could do with support for shifting/opening/lifting. Support for a
   "dress" command that puts on a pre-defined set of garments.
 * Outfits might get a cascade system to go with dress/strip commands.
 * Erotic Story Actions to be expanded with Dance, Hug and Tickle.
 * The previously planned Sexual Simulator System will be replaced by several 
   smaller extensions that build on Sexual Actions.
 * Penetrations allows for penetrations that last across player actions.
 * Kinky Story Actions will implement BDSM functionality.
 * Cutscenes, to implement CYOA-like functionality.

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