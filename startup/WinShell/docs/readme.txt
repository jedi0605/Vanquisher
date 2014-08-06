============================================================================
xoblite -> an alternative shell based on Blackbox for Windows
Copyright © 2002-2005 Karl-Henrik Henriksson [qwilk]
Copyright © 2001-2004 The Blackbox for Windows Development Team
http://xoblite.net/ - #bb4win on irc.freenode.net
============================================================================

Dear end-user,

thank you for downloading xoblite. To get the most out of your new shell,
I also suggest you download bsetbg and the Blackbox font pack, both available
from the xoblite website -> http://xoblite.net/ (please note that I have
included bsetroot 1.8 with xoblite bb3 as the default styles all use it).

With that taken care of, I would like to apologize for the fact that due
to lack of time on my behalf, detailed xoblite documentation is *still* not
available when xoblite bb3 is released (I usually prioritize coding, while
documentation gets pushed aside "for a rainy day" <vbg>). However, the old
Blackbox for Windows 0.0.70 documentation is still available at
http://xoblite.net/docs/ , and if used along with the included changes_bb3.txt
and the online changes_bb1.txt/changes_bb2.txt descriptions this should be
enough to get you up and running.

If not, do not be afraid to ask someone on the Blackbox for Windows forums at
http://www.lostinthebox.com/index.php?f=2 (core related issues)
http://www.lostinthebox.com/index.php?f=4 (plugin related issues)
(but to answer your #1 question: No, you can *not* rename the .exe! <g>)

By the way, make sure you check out the eight styles I have included,
as they show off some of xoblite's features rather nicely (please note
that you can access your styles menu by mid clicking on the desktop).
And do not miss xoblite's unique *themes* functionality - hold down the
ALT key while mid clicking on the desktop to access your themes menu!

Finally, like most developers I love getting some (positive) feedback
every now and then, so if you like xoblite *PLEASE* tell me!!!
My email address is as follows (change applicable parts of the address):

                       qwilk_AT_xoblite_DOT_net

Please note that due to lack of time (as mentioned above), my response
time may be in the range "poor" to "infinity", however I'll try my best
to reply to your email(s). Just don't expect too much... =]

With that, I'll let you off the hook. Now go xoblite, and enjoy! :D

"Today is yesterday's tomorrow."

Karl -> qwilk 

============================================================================

xoblite bb3 | RC1 | 0.5.12.31 | December 31st, 2005

# Manual positioning of all UI elements (Toolbar+Systembar+Slit) using Ctrl+Drag is now supported! :D
# Numerous improvements to the built-in taskbar functionality:
    - The systembar.taskbar can now swap places with the toolbar.windowLabel! :D
      (i.e. making it possible to place the taskbar on the toolbar a la Fluxbox)
    - Taskbar button flashing is now supported (used by e.g. instant messaging applications)
    - Drag'n'drop of files onto task buttons is now supported
    - It is now configurable whether or not inactive task buttons should have a background drawn
    - Lots of new taskbar button mouse click commands (e.g. Alt+MidClick to shade/unshade)
# Introducing a xoblite style balloon tooltips replacement - xobloon notifications! =]
# Including a new advanced sticky windows plugin - Glue! :D
# Major improvements to the style parsing engine and new rendering options
    - Support for the new Blackbox 0.70 style syntax (including fallback to the original syntax for optimum compatibility) 8)
    - Support for dynamic resizing of the toolbar/systembar based on font size + menu marginWidths (configurable)
# Added support for menu [path] folder merging and wildcard search patterns
# Enhanced menu MidClick functionality (e.g. copy a complete bsetbg rootCommand for a wallpaper to the clipboard)
# New application environment variable ($Clipboard$) and core bro@ms (@xoblite MinimizeAll/RestoreAll)
# Apply styles by double clicking on .style files (assign extension to Blackbox.exe) or using Blackbox.exe <PathToStyle>
# Fixed the infamous/elusive crash on shutdown bug... :)
# Updated *box API support for improved plugin compatibility (e.g. BBTaskMenu and bbIconBox)
# Further streamlining of the code (executable only 299 kB despite all new functionality)
# Online documentation (will be available later, for now read the included changes.txt for details)
# New style - solid'n'pale - in addition to the tried'n'tested xoblite bb2 styles... ;)
# Lots of major and minor bug fixes and improvements

============================================================================

xoblite bb2 | RC3 | 0.4.12.23 | December 23rd, 2004

# Introducing xoblite *THEMES*! :D
    - A xoblite theme is a full set of configuration .rc files, plugins, styles and wallpapers located in a folder
    - Themes can be switched on the fly from the new "Themes" menu (by default Alt+MidClick on the desktop)
    - ...i.e. changing all aspects of the *box interface with a single click of a menu item! 8)
# New $CurrentTheme$ application env. variable -> no hard-coded paths -> fully portable and distributable themes! :D
# Automatic version checking and updating of the core + plugins, including periodic checking! ("AutoUpdate") :D
# Font drop shadow support for all core user interface elements
# Built-in command scripting support (@Script)
# Lots of cool new core bro@ms, including LoadPlugin/UnloadPlugin, CheckForUpdates and PausedRestart... 8)
# Write protection (preventing changes to the configuration from being saved to disk - useful when distributing themes!)
# Three exclusive new menu bullets: Triple, Comment and Grid! :D
# Menu separators (inserted automatically for [path] trees, can be inserted manually using [separator])
# Right click on menu items to e.g. open up the chosen folder in Explorer, open the chosen (not the current)
     style in your preferred editor, or set an image as wallpaper using bsetbg
# Mid click on a menu [exec] or [style] item to copy the path of the item to the clipboard
# Mousewheel scrolling of menus taller than the screen + substantially faster regular scrolling
# Improved menu rendering and support for integer and string editing menu items
# Second generation slit puzzle positioning - each plugin row/column is now centered horizontally/vertically! :D
# Manual positioning of the slit using Drag/Ctrl+Drag is now fully supported
# Lots of new SystemBar features, including a Bars+Icons mode and a button to toggle the SysTray shown/hidden
# Updated system tray functionality, including support for external system tray plugins (e.g. BBTray)
# Support for the following new style parameters... 8)
    - menu.bullet: Triple/Comment/Grid (see above)
    - menu.separator.color: (see above)
    - slit: / slit.color: / slit.colorTo:
    - toolbar.borderWidth: / menu.borderWidth: / slit.borderWidth:
    - toolbar.borderColor: / menu.borderColor: / slit.borderColor:
# Substantially improved rendering performance for sunken gradients + pixel perfect rendering of bevels... =]
# Integrated DDE functionality (i.e. loading the BBDDE plugin is no longer required)
# Send bro@ms from external applications using Blackbox.exe -broam <string> :D
# "Safe mode": Hold down the control key to disable loading of plugins at startup... :)
# Updated *box API support for improved plugin compatibility
# Faster restarts and better value substitution mechanisms thanks to improved core data buffering
# Improved support for malformed configuration/style parameter formatting
# Substantial streamlining of the code (executable only 289 kB despite all new functionality!) :D
# Online documentation (will be available later, for now read the included changes.txt for details)
# Updated xoblite bb1 styles + new styles x-ashes and qtopia
# Lots of major and minor bug fixes and improvements

============================================================================

xoblite bb1 | 0.3.8.29 | August 29th, 2003

# *Much* improved plugin architecture:
  - Plugin handling (load/unload) is now performed using the menu (no more manual editing of plugins.rc)! :D
  - Improved ease-of-use (no more "&-loading") and faster restarts with updated plugins
  - More error resilient + user friendly error messages... <g>
# Integrated slit with unique experimental "Puzzle" plugin positioning... 8)
# Integrated systembar with new placement options (e.g. DockedToSlit), updated icon mode with
  saturation/hue, MinimizeAllWindows and RestoreAllWindows using X1/X2 click on the taskbar, etc.
# The toolbar and the systembar can now be resized using the mousewheel!
# All core UI elements (toolbar/systembar/slit) can now be temporarily moved using Ctrl+Drag
# Much improved menu rendering, better looking bullets and bool indicators + "Alternative bullets" mode
# New "Styles" menu that can be opened instead of the Workspaces menu when mid clicking the desktop
# Lots of new configuration options in extensions.rc
# Most settings are now configurable from the core menus and saved to blackbox.rc / extensions.rc
  on change instead of at restart, once again keeping manual .rc editing to a minimum!
# Visibility for the toolbar/systembar/slit/plugins can now be toggled using the menu
# Support for multiple users, each with a different set of configuration files
# Support for global and application environment variables -> no hard-coded paths! :D
# Better style parsing, including basic font substitution and improved wildcard support
# New style settings: menu.frame.bulletColor, menu.hilite.bulletColor, window.button.pressed.picColor,
  menu.indicator, menu.indicator.color and menu.indicator.colorTo (all fully backwards compatible!) 8)
# Miscellaneous workarounds for better compatibility with Windows 9x/ME... :P
# Uses a subset of the Blackbox for Windows API -> compatible with most of the available plugins
# Online documentation (will be available later, for now read the included changes.txt for details)
# qwilk style bonanza! -> x-coal, liquid concrete, elyts, colour-blind and seaworthy...
# ...and an updated font pack with fixed gelly, glisp and glisp-bold fonts! 8)
# Lots of major and minor bug fixes, fixed mem leaks, new features + a new xoblite icon! =]

============================================================================

XOBLITE IS PROVIDED "AS IS" WITHOUT WARRANTY OF ANY KIND. THE AUTHORS
DISCLAIM ALL WARRANTIES, EITHER EXPRESS OR IMPLIED, INCLUDING THE
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.
IN NO EVENT SHALL THE AUTHORS OR ITS SUPPLIERS BE LIABLE FOR ANY DAMAGES
WHATSOEVER INCLUDING DIRECT, INDIRECT, INCIDENTAL, CONSEQUENTIAL,
LOSS OF BUSINESS PROFITS OR SPECIAL DAMAGES, EVEN IF THE AUTHORS OR ITS
SUPPLIERS HAVE BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES.

Additional license information can be found at
http://xoblite.net/license.html

============================================================================
