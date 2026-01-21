"Filed out from Dolphin Smalltalk"!

SBSHtmlCanvas subclass: #UpHtmlCanvas
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!

UpHtmlCanvas guid: (GUID fromString: '{3de5d6cf-5475-4653-abcb-a780f7b7b27a}')!

UpHtmlCanvas comment: ''!

!UpHtmlCanvas categoriesForClass!Canvas! !

!UpHtmlCanvas methodsFor!

brush: aBrush

	aBrush upInitialize.

	^super brush: aBrush!

text: aString 

	self document isRendering ifTrue: [super text: aString]!

upCurrentComponent

	^context upCurrentComponent!

upMain: aBlock
	self div 
		upMain: true;
		with: aBlock! !

!UpHtmlCanvas categoriesForMethods!
brush:!accessing!public! !
text:!public!tags! !
upCurrentComponent!accessing!public! !
upMain:!public!tags! !
!

!UpHtmlCanvas class methodsFor!

_context: aRenderContext
	^super context: aRenderContext!

context: aRenderContext
	^(aRenderContext upOverrideRendererClass ifNil: [self]) _context: aRenderContext! !

!UpHtmlCanvas class categoriesForMethods!
_context:!instance creation!private! !
context:!instance creation!public! !
!

