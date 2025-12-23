"Filed out from Dolphin Smalltalk"!

WAMultiCounter subclass: #UpMultiCounter
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!

UpMultiCounter guid: (GUID fromString: '{1b7f9b82-e36a-45e4-ae7e-62bc2c79c39f}')!

UpMultiCounter comment: ''!

!UpMultiCounter categoriesForClass!Misc! !

!UpMultiCounter methodsFor!

initialize

	super initialize.

	counters := (1 to: 9) collect: [:each | UpCounter new]!

renderContentOn: html

	html row: 
		[counters do: 
			[ :each | 
			(html columnUnits: 4 size: #small)
				textCenter;
				marginBottom: 2;
				with: [ html render: each ]]]!

rendererClass

	^UpHtmlCanvas! !

!UpMultiCounter categoriesForMethods!
initialize!initialization!public! !
renderContentOn:!public!rendering! !
rendererClass!public!rendering! !
!

