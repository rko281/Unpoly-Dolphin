"Filed out from Dolphin Smalltalk"!

WAObject subclass: #UpEvent
	instanceVariableNames: 'type layer properties'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!

UpEvent guid: (GUID fromString: '{ff30c104-ce33-4db6-a515-db614773abc7}')!

UpEvent comment: ''!

!UpEvent categoriesForClass!Kernel-Objects! !

!UpEvent methodsFor!

displayOn: aStream

	aStream nextPutAll: 'type: '; nextPutAll: self type.
	self properties keysAndValuesDo: 
		[ :key :value |
		aStream 
			nextPutAll: '; ';
			nextPutAll: key;
			nextPutAll: ': ';
			print: value]
!

hasComponent

	^self properties includesKey: #component!

hasLayer

	^self layer notNil!

hasResult

	^self properties includesKey: #result!

hasTarget

	^self properties includesKey: #target!

initialize

	super initialize.

	self properties: IdentityDictionary new!

isDismissal

	^self type = 'up:layer:dismissed'!

layer

	^layer ifNil: 
		[self propertyAt: #layerID ifPresent: 
			[ :id | 
			layer := self session layerWithID: id]]!

layer: anUpLayerOrNil

	(layer := anUpLayerOrNil) isNil
		ifTrue: [self propertyAt: #layer put: nil; propertyAt: #layerID put: nil]
		ifFalse: [self propertyAt: #layer put: 'current' "we only support events on the current layer"; propertyAt: #layerID put: layer id]!

layerID

	^layer isNil 
		ifTrue: [self propertyAt: #layerID ifAbsent: [nil]]
		ifFalse: [layer id]!

parseResponseString: aString

	"Parse the reponse string. This is a Stringified array of 'key1,value1,key2,value2' etc.
	As a minimum it should contain the type of the event"

	| readStream |

	readStream := aString readStream.

	[readStream atEnd] whileFalse: 
		[| key value |
		key := (readStream upTo: $,) asSymbol.
		value := readStream upTo: $,.
		key = #type 
			ifTrue: [self type: value]
			ifFalse: [self propertyAt: key put: value]].

	self type isNil ifTrue: [self error: 'malformed response string']!

printOn: aStream

	aStream
		basicPrint: self;
		nextPut: $(;
		display: self;
		nextPut: $)!

properties
	^properties!

properties: anObject
	properties := anObject!

propertyAt: aSymbol

	^self properties at: aSymbol!

propertyAt: aSymbol ifAbsent: aBlock

	^self properties at: aSymbol ifAbsent: aBlock!

propertyAt: aSymbol ifPresent: aBlock

	^self properties at: aSymbol ifPresent: aBlock!

propertyAt: aSymbol put: aStringOrNil

	^aStringOrNil isNil
		ifTrue: [self properties removeKey: aSymbol ifAbsent:[]]
		ifFalse: [self properties at: aSymbol put: aStringOrNil]!

respond: aString

	"Assume plain text"

	self respond: aString contentType: WAMimeType textPlain

	!

respond: aString contentType: aMimeType

	self requestContext respond: 
		[ :response | 
		response 
			doNotCache;
			contentType: aMimeType.
		response stream nextPutAll: aString]!

target

	^self propertyAt: #target ifAbsent: [nil]!

target: aString

	self propertyAt: #target put: aString!

type
	^type!

type: aString

	type := aString!

value

	^self propertyAt: #value ifAbsent: [nil]!

value: anObject

	self propertyAt: #value put: anObject!

writeRelaxedJsonOn: aStream

	"Unpoly expects events in 'relaxed json' format, specifically no quotes on the keys.
	We also filter out any properties without a valid JSON representation"

	aStream 
		nextPutAll: '{type:'; 
		print: self type.

	self properties keysAndValuesDo: 
		[ :key :value |
		([value asJson] on: Error do: [ :exc | exc return: nil]) ifNotNil: 
			[ :json |
			aStream 
				nextPut: $,;
				nextPutAll: key;
				nextPut: $:;
				nextPutAll: json]].

	aStream nextPut: $}! !

!UpEvent categoriesForMethods!
displayOn:!printing!public! !
hasComponent!public!testing! !
hasLayer!public!testing! !
hasResult!public!testing! !
hasTarget!public!testing! !
initialize!initialize/release!public! !
isDismissal!public!testing! !
layer!accessing!public! !
layer:!accessing!public! !
layerID!accessing!public! !
parseResponseString:!parsing!private! !
printOn:!printing!public! !
properties!accessing!private! !
properties:!accessing!private! !
propertyAt:!accessing!public! !
propertyAt:ifAbsent:!accessing!public! !
propertyAt:ifPresent:!accessing!public! !
propertyAt:put:!accessing!public! !
respond:!public!responding! !
respond:contentType:!public!responding! !
target!accessing!public! !
target:!accessing!public! !
type!accessing!public! !
type:!accessing!public! !
value!accessing!public! !
value:!accessing!public! !
writeRelaxedJsonOn:!printing!public! !
!

!UpEvent class methodsFor!

fromResponseString: aString

	^self new
		parseResponseString: aString;
		yourself!

icon

	^Event icon!

type: typeString

	^self new
		type: typeString;
		yourself! !

!UpEvent class categoriesForMethods!
fromResponseString:!instance creation!public! !
icon!public! !
type:!instance creation!public! !
!

