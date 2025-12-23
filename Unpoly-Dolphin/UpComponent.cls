"Filed out from Dolphin Smalltalk"!

SBSComponent subclass: #UpComponent
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!

UpComponent guid: (GUID fromString: '{137e56d6-57f6-44f9-9689-1d69941fb205}')!

UpComponent comment: ''!

!UpComponent categoriesForClass!Component! !

!UpComponent methodsFor!

beLayerHost

	"Configure the receiver as the host component for opening new layers"

	self session layerHost: self!

isInLayer

	^self layer notNil!

layer

	^self upLayerDecoration ifNotNil: [ :layerDecoration | layerDecoration layer]!

layerContextAt: aSymbol

	^self layerContextAt: aSymbol ifAbsent: [self error: 'not found']!

layerContextAt: aSymbol ifAbsent: aBlock

	^self layer 
		ifNil: [aBlock value]
		ifNotNil: [ :layer | layer contextAt: aSymbol ifAbsent: aBlock]!

layerDecoration

	^self decoration isDecoration
		ifTrue: [self decoration upLayerDecoration]
		ifFalse: [nil]!

rendererClass

	^UpHtmlCanvas!

show: aComponent onAnswer: aBlock delegation: aDelegation
	self layer ifNotNil: [ :layer | aComponent addDecoration: (UpLayerDecoration new layer: layer)].

	^super show: aComponent onAnswer: aBlock delegation: aDelegation!

upLayerDecoration

	^self decoration ~~ self
		ifTrue: [self decoration upLayerDecoration]
		ifFalse: [nil]! !

!UpComponent categoriesForMethods!
beLayerHost!configuring!public! !
isInLayer!public!testing! !
layer!accessing!public! !
layerContextAt:!accessing!public! !
layerContextAt:ifAbsent:!accessing!public! !
layerDecoration!accessing!public! !
rendererClass!public!rendering! !
show:onAnswer:delegation:!delegation!public! !
upLayerDecoration!accessing!public! !
!

