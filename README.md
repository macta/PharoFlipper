# PharoFlipper
A simple Pharo Smalltalk keyboard window flipper - use CTRL-1 to flip to the last recently used window (similar to ^tab in Windows and cmd-` in OSX.

To load use:

```
Metacello new
  repository: 'github://macta/PharoFlipper:main';
  baseline: 'PharoFlipper';
  load.
```

The default keboard shortcut can be altered with either of:
```
self keyboardShortcut: $1 control asShortcut.
self keyboardShortcut: $1 meta asShortcut.
```
