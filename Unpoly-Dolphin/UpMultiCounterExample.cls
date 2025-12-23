"Filed out from Dolphin Smalltalk"!

UpComponentExample subclass: #UpMultiCounterExample
	instanceVariableNames: 'counters'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!

UpMultiCounterExample guid: (GUID fromString: '{04402780-be84-4b2d-bc01-775dae396cb3}')!

UpMultiCounterExample comment: ''!

!UpMultiCounterExample categoriesForClass!Component! !

!UpMultiCounterExample methodsFor!

componentClass
	^UpMultiCounter!

renderDescriptionOn: html

	html text: 'The Seaside Multi-Counter example enhanced with Bootstrap and Unpoly.'! !

!UpMultiCounterExample categoriesForMethods!
componentClass!constants!public! !
renderDescriptionOn:!public!rendering! !
!

!UpMultiCounterExample class methodsFor!

exampleName
	^'Multi-Counter'!

ordering
	^20!

subPath
	^'multicounter'! !

!UpMultiCounterExample class categoriesForMethods!
exampleName!constants!public! !
ordering!constants!public! !
subPath!constants!public! !
!

