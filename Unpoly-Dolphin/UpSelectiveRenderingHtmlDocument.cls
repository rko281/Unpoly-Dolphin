"Filed out from Dolphin Smalltalk"!

UpHtmlDocument subclass: #UpSelectiveRenderingHtmlDocument
	instanceVariableNames: 'renderingDepth silencedStream classesToRender idsToRender callbackKeys targetChanged'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!

UpSelectiveRenderingHtmlDocument guid: (GUID fromString: '{d1fee359-cec3-4a37-854d-cd7033c3e605}')!

UpSelectiveRenderingHtmlDocument comment: ''!

!UpSelectiveRenderingHtmlDocument categoriesForClass!Document! !

!UpSelectiveRenderingHtmlDocument methodsFor!

_addClassToRender: aString

	classesToRender isNil 
		ifTrue: [classesToRender := OrderedCollection with: aString]
		ifFalse: [classesToRender add: aString].

	^aString!

_addIdToRender: aString

	idsToRender isNil 
		ifTrue: [idsToRender := OrderedCollection with: aString]
		ifFalse: [idsToRender add: aString].

	^aString!

addClassToRender: aString

	"Request that the html class aString is always rendered regardless of what was requested"

	(idsToRender isNil and: [classesToRender isNil]) ifFalse: 
		[targetChanged := true.
		self _addClassToRender: aString].

	^aString!

addIdToRender: aString

	"Request that the id aString is always rendered regardless of what was requested"

	(idsToRender isNil and: [classesToRender isNil]) ifFalse: 
		[targetChanged := true.
		self _addIdToRender: aString].

	^aString!

close

	self removeUnusedCallbacks.

	targetChanged ifTrue: [self requestContext response headerAt: 'X-Up-Target' put: self upTargetString].
	
	super close!

closeTag: aString
	self isRendering ifFalse: [^self].

	super closeTag: aString.
	self decrementRenderingDepth!

decrementRenderingDepth

	renderingDepth := renderingDepth - 1.
	renderingDepth = 0 ifTrue: [self stopRendering]!

isRendering

	^renderingDepth notNil!

open: aRoot

	classesToRender := idsToRender := nil.
	targetChanged := false.
	callbackKeys := OrderedCollection new.

	self parseReloadHeader.
	(classesToRender isNil and: [idsToRender isNil])
	ifTrue: 
		[self startRendering]
	ifFalse: 
		[self stopRendering.
		self requestContext response headerAt: 'Vary' put: 'X-Up-Target'].

	^super open: aRoot!

openTag: aString attributes: anAttributes closed: aBoolean
	| tag |

	tag := anAttributes ifNotNil: [ :attr | attr at: #_tag_ ifAbsent: [nil]].

	self isRendering
	ifTrue: 
		[renderingDepth  := renderingDepth  + 1]
	ifFalse: 
		[(self shouldRenderAttributes: anAttributes) ifFalse: [^self].
		self startRendering].
	super openTag: aString attributes: anAttributes closed: aBoolean.

	tag isNil ifFalse: [tag callbackKey ifNotNil: [ :key | callbackKeys add: key]].
	aBoolean ifTrue: [self decrementRenderingDepth]!

parseReloadHeader

	| reloadHeader readStream |

	reloadHeader := self requestContext request headerAt: 'X-Up-Target'.
	readStream := reloadHeader readStream.

	[readStream atEnd] whileFalse: 
		[| next |
		next := readStream upTo: $,.
		next first = $. 
			ifTrue: [self _addClassToRender: next allButFirst]
			ifFalse: [next first = $# ifTrue: [self _addIdToRender: next allButFirst]].
		readStream skipSeparators]!

removeUnusedCallbacks

	root context callbacks removeKeysNotIn: callbackKeys!

shouldRenderAttributes: anAttributes

	anAttributes isNil ifTrue: [^false].

	"Always render"
	(anAttributes includesKey: 'up-flashes') ifTrue: [^true].

	classesToRender notNil ifTrue: 
		[(anAttributes at: 'class' ifAbsent: [nil]) ifNotNil: 
			[ :cls | 
			(cls isConcatenatedHtmlAttributeValue
				ifTrue: [classesToRender anySatisfy: [ :each | cls includes: each]]
				ifFalse: [classesToRender includes: cls]) ifTrue: [^true]]].

	idsToRender notNil ifTrue: 
		[(anAttributes at: 'id' ifAbsent: [nil]) ifNotNil: 
			[ :id | 
			(idsToRender includes: id) ifTrue: [^true]]].

	^false!

startRendering

	renderingDepth := 1.
	silencedStream isNil ifFalse: [stream := silencedStream]!

stopRendering

	renderingDepth := nil.
	silencedStream := stream.
	stream := NullStream new!

upTargetString

	| writeStream |

	writeStream := WriteStream on: (String new: 32).

	idsToRender isNil ifFalse: 
		[idsToRender do: [ :each | writeStream nextPut: $#; nextPutAll: each] separatedBy: [writeStream nextPutAll: ', ']].
	
	classesToRender isNil ifFalse: 
		[idsToRender isNil ifFalse: [writeStream nextPutAll: ', '].
		classesToRender do: [ :each | writeStream nextPut: $.; nextPutAll: each] separatedBy: [writeStream nextPutAll: ', ']].

	^writeStream contents! !

!UpSelectiveRenderingHtmlDocument categoriesForMethods!
_addClassToRender:!adding!private! !
_addIdToRender:!adding!private! !
addClassToRender:!adding!public! !
addIdToRender:!adding!public! !
close!initialization!public! !
closeTag:!public!writing! !
decrementRenderingDepth!helpers!private! !
isRendering!public!testing! !
open:!initialization!public! !
openTag:attributes:closed:!public!writing! !
parseReloadHeader!helpers!private! !
removeUnusedCallbacks!helpers!private! !
shouldRenderAttributes:!private!testing! !
startRendering!helpers!private! !
stopRendering!helpers!private! !
upTargetString!helpers!private! !
!

