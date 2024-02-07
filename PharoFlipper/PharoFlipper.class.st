"
I am a singleton that handles basic LRU window flipping by hooking a global shortcut key and looking at the list of SystemWindows in the World.

The default keboard shortcut can be altered with:
`self keyboardShortcut: $1 meta asShortcut
"
Class {
	#name : #PharoFlipper,
	#superclass : #Object,
	#classInstVars : [
		'lastWindowIndex',
		'lastFlipTimestamp',
		'keyboardShortcut'
	],
	#category : #PharoFlipper
}

{ #category : #internal }
PharoFlipper class >> flipToPreviousWindow [

	| prevWindowIndex |
	
	prevWindowIndex := self hasLastFlipTimedOut
		                   ifTrue: [ 2 ]
		                   ifFalse: [ self lastWindowIndex + 1 ].

	self updateSwitchIndex: prevWindowIndex.

	(self systemWindows at: prevWindowIndex ifAbsent: [ ^self ]) activate 
]

{ #category : #internal }
PharoFlipper class >> hasLastFlipTimedOut [

	^ (Time millisecondsSince: self lastFlipTimestamp) > 1000
		            
]

{ #category : #internal }
PharoFlipper class >> installShortcut [
	"Add Flipper to the global shortcut registry - not sure if this is the optimal way, copying how Iceberg does it with an extention to tools and then forcing the keyboard repository to reset"
	<script>
	
	KMRepository reset
]

{ #category : #accessing }
PharoFlipper class >> keyboardShortcut [

	^ keyboardShortcut ifNil: [ self keyboardShortcut: $1 alt asShortcut ]
]

{ #category : #accessing }
PharoFlipper class >> keyboardShortcut: aShortcut [

	^ keyboardShortcut := aShortcut
]

{ #category : #accessing }
PharoFlipper class >> lastFlipTimestamp [

	^ lastFlipTimestamp ifNil: [ lastFlipTimestamp := Time millisecondClockValue ]
]

{ #category : #accessing }
PharoFlipper class >> lastWindowIndex [

	^ lastWindowIndex ifNil: [ lastWindowIndex := 2 ]
]

{ #category : #internal }
PharoFlipper class >> systemWindows [

	^ self currentWorld submorphs select: #isSystemWindow
]

{ #category : #internal }
PharoFlipper class >> updateSwitchIndex: anInteger [	            

	lastFlipTimestamp := Time millisecondClockValue.
	lastWindowIndex := anInteger 
]
