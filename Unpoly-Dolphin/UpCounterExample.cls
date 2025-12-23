"Filed out from Dolphin Smalltalk"!

UpComponentExample subclass: #UpCounterExample
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!

UpCounterExample guid: (GUID fromString: '{cd94d72a-1d05-4107-8d5f-623a889f6b7c}')!

UpCounterExample comment: ''!

!UpCounterExample categoriesForClass!Component! !

!UpCounterExample methodsFor!

componentClass

	^UpCounter!

renderDescriptionOn: html

	html 
		paragraph: 'The venerable Seaside Counter example enhanced with Bootstrap and Unpoly.'; 
		paragraph: [html withLineBreaks: 'The counter is configured as an Unpoly target which is updated without refreshing the entire page.<N>This also prevents the address bar updating with the full Seaside URL.' expandMacros]; 
		paragraph: [html withLineBreaks: 'Note this removes the ability to update the counter with the Back/Forward buttons.<N>Thus the counter behaves like the JQuery Counter example but without needing any JQuery in the Seaside code' expandMacros]! !

!UpCounterExample categoriesForMethods!
componentClass!constants!public! !
renderDescriptionOn:!public!rendering! !
!

!UpCounterExample class methodsFor!

exampleName
	^'Counter'!

ordering
	^10!

subPath
	^'counter'! !

!UpCounterExample class categoriesForMethods!
exampleName!constants!public! !
ordering!constants!public! !
subPath!constants!public! !
!

