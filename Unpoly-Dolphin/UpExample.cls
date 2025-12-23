"Filed out from Dolphin Smalltalk"!

UpComponent subclass: #UpExample
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!

UpExample guid: (GUID fromString: '{4e14ee13-05c3-412d-9583-fa2378b709b0}')!

UpExample comment: ''!

!UpExample categoriesForClass!Component! !

!UpExample class methodsFor!

allExamples

	^self allSubclasses reject: [ :each | each isAbstract]!

exampleName	^self subclassResponsibility!

exampleSource

	^self!

initializeSession: anUpSession!

isAbstract
	^self name = #UpExample!

ordering

	^SmallInteger maximum!

subPath

	^self subclassResponsibility! !

!UpExample class categoriesForMethods!
allExamples!accessing!public! !
exampleName!accessing!public! !
exampleSource!accessing!public! !
initializeSession:!initializing!public! !
isAbstract!public!testing! !
ordering!accessing!public! !
subPath!constants!public! !
!

