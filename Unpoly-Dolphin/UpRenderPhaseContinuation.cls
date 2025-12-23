"Filed out from Dolphin Smalltalk"!

WARenderPhaseContinuation subclass: #UpRenderPhaseContinuation
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!

UpRenderPhaseContinuation guid: (GUID fromString: '{463c1bdf-0e4b-4a28-ac49-47eb74d2e7e2}')!

UpRenderPhaseContinuation comment: ''!

!UpRenderPhaseContinuation categoriesForClass!Continuations! !

!UpRenderPhaseContinuation methodsFor!

documentClass

	^self requestContext request upTarget notNil
		ifTrue: [UpSelectiveRenderingHtmlDocument]
		ifFalse: [UpHtmlDocument]! !

!UpRenderPhaseContinuation categoriesForMethods!
documentClass!processing!public! !
!

