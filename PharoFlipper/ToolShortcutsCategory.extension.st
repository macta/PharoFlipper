Extension { #name : #ToolShortcutsCategory }

{ #category : #'*PharoFlipper' }
ToolShortcutsCategory >> openPharoFlipper [
	<shortcut>
	
	^ KMKeymap
		  shortcut: PharoFlipper keyboardShortcut  
		  action: [ PharoFlipper flipToPreviousWindow ]
]
