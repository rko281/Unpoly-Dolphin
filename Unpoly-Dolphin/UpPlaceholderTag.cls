"Filed out from Dolphin Smalltalk"!

WATagBrush subclass: #UpPlaceholderTag
	instanceVariableNames: 'tagBrush'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!

UpPlaceholderTag guid: (GUID fromString: '{77f739f0-193f-4b28-9c84-fa34c64f5d99}')!

UpPlaceholderTag comment: ''!

!UpPlaceholderTag categoriesForClass!Base! !

!UpPlaceholderTag methodsFor!

doesNotUnderstand: failedMessage

	"Ignore messages specific to the tagBrush's class"

	^(tagBrush class canUnderstand: failedMessage selector)
		ifTrue: [self]
		ifFalse: [super doesNotUnderstand: failedMessage]!

openTag
	"Restrict to appropriate attributes"
	| placeholderAttributes |

	placeholderAttributes := WAHtmlAttributes new.
	attributes keysAndValuesDo: 
		[ :key :value | 
		(#('class' 'cols' 'rows' ) includes: key) ifTrue: [placeholderAttributes at: key put: value]].

	(#('div' 'form' 'fieldset') includes: tagBrush tag) ifFalse: [placeholderAttributes addClass: 'placeholder'].
	self document openTag: self tag attributes: placeholderAttributes closed: self isClosed!

tag

	^(#('div' 'form' 'fieldset' 'a' 'dt' 'label' 'input' 'textarea') includes: tagBrush tag)
		ifTrue: [tagBrush tag]
		ifFalse: ['span']!

tagBrush
	^tagBrush!

tagBrush: anObject
	tagBrush := anObject! !

!UpPlaceholderTag categoriesForMethods!
doesNotUnderstand:!helpers!public! !
openTag!helpers!private! !
tag!accessing!public! !
tagBrush!accessing!private! !
tagBrush:!accessing!private! !
!

