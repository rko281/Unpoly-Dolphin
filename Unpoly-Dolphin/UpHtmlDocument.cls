"Filed out from Dolphin Smalltalk"!

WAHtmlDocument subclass: #UpHtmlDocument
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!

UpHtmlDocument guid: (GUID fromString: '{ffbdda3e-a15d-4b0d-bc74-0ce2ffe61949}')!

UpHtmlDocument comment: ''!

!UpHtmlDocument categoriesForClass!Document! !

!UpHtmlDocument methodsFor!

openTag: aString attributes: anAttributes closed: aBoolean

	anAttributes ifNotNil: [ :attr | attr at: #_tag_ ifPresent: [ :tag | tag upBefore]].

	^super openTag: aString attributes: anAttributes closed: aBoolean! !

!UpHtmlDocument categoriesForMethods!
openTag:attributes:closed:!private!writing! !
!

