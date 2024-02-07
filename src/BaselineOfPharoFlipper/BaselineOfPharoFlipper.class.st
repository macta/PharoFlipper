"
Baseline to load PharoFlipper. NOTE: does initialisation on load.
"
Class {
	#name : #BaselineOfPharoFlipper,
	#superclass : #BaselineOf,
	#category : #BaselineOfPharoFlipper
}

{ #category : #baselines }
BaselineOfPharoFlipper >> baseline: spec [

	<baseline>
	spec for: #common do: [ 
		spec
			package: 'PharoFlipper';
			postLoadDoIt: #installShortcut ]
]

{ #category : #baselines }
BaselineOfPharoFlipper >> installShortcut [ 

	PharoFlipper installShortcut
]
