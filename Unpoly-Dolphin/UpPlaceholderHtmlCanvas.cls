"Filed out from Dolphin Smalltalk"!

UpHtmlCanvas subclass: #UpPlaceholderHtmlCanvas
	instanceVariableNames: 'parentCanvas'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!

UpPlaceholderHtmlCanvas guid: (GUID fromString: '{d5dbc2c2-7736-4ee9-b40c-b0350a5152f2}')!

UpPlaceholderHtmlCanvas comment: ''!

!UpPlaceholderHtmlCanvas categoriesForClass!Canvas! !

!UpPlaceholderHtmlCanvas methodsFor!

brush: aBrush

	| placeholder | 

	(#('dt' 'dl' 'br' 'p') includes: aBrush tag) ifTrue: [^super brush: aBrush].
	((aBrush tag = 'div') and: [(aBrush attributes includesKey: 'class') not]) ifTrue: [^super brush: aBrush].

	(#('dd' 'h1' 'h2' 'h3' 'h4' 'h5' 'h6' ) includes: aBrush tag) ifTrue: [^super brush: (aBrush class: 'placeholder')].

	placeholder := super brush: UpPlaceholderTag new.
	placeholder tagBrush: aBrush.

	placeholder attributes: aBrush attributes.

	##(Dictionary new
		at: 'button' put: 'btn';
		yourself) at: aBrush tag ifPresent: [ :cls | placeholder class: cls].

	^placeholder!

parentCanvas
	^parentCanvas!

parentCanvas: anObject
	parentCanvas := anObject.
	context := parentCanvas context!

render: anObject

	^anObject isString 
		ifTrue: [parentCanvas span class: 'placeholder'; with: anObject]
		ifFalse: [super render: anObject]! !

!UpPlaceholderHtmlCanvas categoriesForMethods!
brush:!public! !
parentCanvas!accessing!private! !
parentCanvas:!accessing!private! !
render:!public! !
!

!UpPlaceholderHtmlCanvas class methodsFor!

_context: aRenderContext

	^self on: (UpHtmlCanvas _context: aRenderContext)!

on: html

	^self new 
		parentCanvas: html; 
		yourself! !

!UpPlaceholderHtmlCanvas class categoriesForMethods!
_context:!instance creation!private! !
on:!instance creation!public! !
!

