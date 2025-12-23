"Filed out from Dolphin Smalltalk"!

WASession subclass: #UpSession
	instanceVariableNames: 'layerHost layers notification'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!

UpSession guid: (GUID fromString: '{aeb669e1-25ae-4026-af0a-98ffa5117885}')!

UpSession comment: ''!

!UpSession categoriesForClass!Base! !

!UpSession methodsFor!

addLayer: aLayer

	aLayer parent: self topLayer.

	^self layers addLast: aLayer!

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

initialize

	super initialize.

	layers := OrderedCollection new!

layerHost

	"The UpComponent which hosts new layers"

	^layerHost!

layerHost: anUpComponent

	"The UpComponent which hosts new layers"

	layerHost := anUpComponent!

layers

	^layers!

layerWithID: aString

	^self layers detect: [ :each | each id = aString]!

nextLayerIdOn: html

	| id |

	"Skip the 'id' part"
	id := html nextId allButFirst: 2.

	^self layers isEmpty 
		ifTrue: ['layer', id]
		ifFalse: [self layers last id, '.', id]!

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

topLayer

	"A stack"

	^self layers isEmpty 
		ifTrue: [nil]
		ifFalse: [self layers last]!

unknownRequest

	"Force a full-page refresh"

	self requestContext response
		status: WAResponse statusUnauthorized;
		respond! !

!UpSession categoriesForMethods!
addLayer:!add/remove!public! !
createContinuationCache!initialization!public! !
initialize!initialization!public! !
layerHost!accessing!public! !
layerHost:!accessing!public! !
layers!accessing!public! !
layerWithID:!accessing!public! !
nextLayerIdOn:!accessing!private! !
notification:!accessing!public! !
onLayerClosed:!event handling!public! !
onLayerOpened:!event handling!public! !
popNotification!accessing!private! !
removeLayer:!add/remove!public! !
topLayer!accessing!public! !
unknownRequest!handling!public! !
!

