"Filed out from Dolphin Smalltalk"!

WASession subclass: #UpSession
	instanceVariableNames: 'layers layerCount currentLayer notification'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!

UpSession guid: (GUID fromString: '{aeb669e1-25ae-4026-af0a-98ffa5117885}')!

UpSession comment: ''!

!UpSession categoriesForClass!Base! !

!UpSession methodsFor!

addLayer: aLayer

	^self layers add: aLayer!

createContinuationCache

	"Due to Unpoly performing partial updates on the client we may get callbacks from a link that was originally served long ago.
	Hence we need a much larger cache.

	Idea for improvement - use knowledge of partial updates to selectively preserve non-updated callbacks"

	^ WAHashCache
		initialSize: 7
		maximumSize: 2000
		maximumAbsoluteAge: 0
		maximumRelativeAge: 0
		overflowAction: WAHashCache removeRelativeOldest!

currentLayer

	^currentLayer contents!

currentLayer: anUpLayerOrNil

	currentLayer contents: anUpLayerOrNil!

currentLayerState

	^currentLayer!

handleFiltered: aRequestContext 

	"Select the requested layer"
	aRequestContext request isGet ifTrue: 
		[(aRequestContext request upContext ifNotNil: [ :ctx | ctx at: 'layerId' ifAbsent: [nil]])
			ifNil: [self currentLayer: nil]
			ifNotNil: [ :layerId | self currentLayer: (self layerWithId: layerId)]].

	^super handleFiltered: aRequestContext !

initialize

	super initialize.

	currentLayer := WAValueHolder new.
	layers := OrderedCollection new.
	layerCount := 0!

initializeFilters	super initializeFilters.	self addFilter: UpNoTabFilter new!

layers

	^layers!

layerWithId: aString

	^self layers detect: [ :each | each id = aString] ifNone: [nil]!

nextLayerId

	^'layer', (layerCount := layerCount + 1) asString!

notification: anObject

	"A renderable object to be shown as a notification.
	A canvas is passed as a parameter if anObject is a block.
	Add an UpNotificationDecoration to your root component to show this automatically"

	notification := anObject!

onLayerClosed: upEvent

	upEvent layer ifNotNil: 
		[ :layer | 
		(self removeLayer: layer) onLayerClosed: upEvent]!

onLayerOpened: upEvent

	upEvent layer ifNotNil: 
		[ :layer | 
		layer onLayerOpened: upEvent]!

popNotification

	^notification ifNotNil: 
		[ :poppedNotification |
		notification := nil.
		poppedNotification]!

removeLayer: aLayer

	^self layers remove: aLayer!

unknownRequest

	"Force a full-page refresh"

	self requestContext response
		status: WAResponse statusUnauthorized;
		respond! !

!UpSession categoriesForMethods!
addLayer:!add/remove!public! !
createContinuationCache!initialization!public! !
currentLayer!accessing!public! !
currentLayer:!accessing!public! !
currentLayerState!public! !
handleFiltered:!handling!public! !
initialize!initialization!public! !
initializeFilters!initialization!public! !
layers!accessing!public! !
layerWithId:!accessing!public! !
nextLayerId!accessing!public! !
notification:!accessing!public! !
onLayerClosed:!event handling!public! !
onLayerOpened:!event handling!public! !
popNotification!accessing!private! !
removeLayer:!add/remove!public! !
unknownRequest!handling!public! !
!

