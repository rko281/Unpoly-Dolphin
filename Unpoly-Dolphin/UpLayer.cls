"Filed out from Dolphin Smalltalk"!

WAObject subclass: #UpLayer
	instanceVariableNames: 'id mode componentBlock component context parent placeholder onClosed onClosedReload upDismissable'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!

UpLayer guid: (GUID fromString: '{3d497195-4ef4-46bd-8e78-33e03a5aeb52}')!

UpLayer comment: ''!

!UpLayer categoriesForClass!Unclassified! !

!UpLayer methodsFor!

beModal

	self mode: #modal!

bePopup

	self mode: #popup!

closeEventType

	^##(self) closeEventType!

component

	"The component to be shown in this layer.
	Either set directly or generated from the componentBlock each time the layer is opened"

	^component!

component: anObject

	"The component to be shown in this layer.
	Either set directly or generated from the componentBlock each time the layer is opened"

	component := anObject.
	component addDecoration: (UpLayerDecoration new layer: self)!

componentBlock

	"Private - aBlock (or other zero-arg valuable) which evaluates to an UpComponent to show in this layer.
	This is evaluated each time this layer is opened and the result stored in component"

	^componentBlock!

componentBlock: aBlock

	"Private - aBlock (or other zero-arg valuable) which evaluates to an UpComponent to show in this layer.
	This is evaluated each time this layer is opened and the result stored in component"

	componentBlock := aBlock!

configureAnchorTag: aWAAnchorTag

	aWAAnchorTag
		upLocation: false;
		upNoTab: true;  "<- since layers effectively follow call:answer: semantics opening in a new tab rarely makes sense. Idea: allow a non-layered alternative to be specified"
		upLayer: 'new ', self mode;
		upDismissEvent: self closeEventType;
		upOnOpened: self onOpenedSnippet;
		upOnDismissed: self onClosedSnippet;
		upOnError: self onErrorSnippet.

	self upDismissable ifNotNil: [ :value | aWAAnchorTag upDismissable: value].
	self placeholder ifNotNil: [ :upPlaceholder | aWAAnchorTag upPlaceholder: upPlaceholder].
	self context isEmpty ifFalse: [aWAAnchorTag upContext: self context asJson].

	self parent: aWAAnchorTag upComponent.
	aWAAnchorTag callback: [self show]!

containing: anUpComponentOrBlock

	"Configure the receiver to show either an UpComponent or to generate its component from a Block (or other zero-arg valuable) each time the layer is opened"

	anUpComponentOrBlock isBlock
	ifTrue: 
		[componentBlock := anUpComponentOrBlock.
		component := nil]
	ifFalse: 
		[self component: anUpComponentOrBlock.
		componentBlock := nil]!

context
	^context!

context: anObject
	context := anObject!

contextAt: aSymbol

	^self context at: aSymbol!

contextAt: aSymbol ifAbsent: aBlock

	^self context at: aSymbol ifAbsent: 
		[self parentLayer
			ifNil: [aBlock value]
			ifNotNil: [ :parentLayer | parentLayer contextAt: aSymbol ifAbsent: aBlock]]!

contextAt: aSymbol ifPresent: aBlock

	self context at: aSymbol ifPresent: [ :val | ^aBlock value: val].

	^self parentLayer ifNotNil: [ :parentLayer | parentLayer contextAt: aSymbol ifPresent: aBlock]!

contextAt: aSymbol put: aStringOrNil

	^aStringOrNil isNil
		ifTrue: [self context removeKey: aSymbol ifAbsent:[]]
		ifFalse: [self context at: aSymbol put: aStringOrNil]!

id

	^id ifNil: [self contextAt: #layerID ifAbsent: [nil]]!

id: anObject

	id := anObject.

	"Also store in the context"
	self contextAt: #layerID put: anObject!

initialize

	super initialize.

	context := Dictionary new!

mode

	"mode stores a Symbol specifying the type of layer to be opened:

		#modal	A modal dialog box
		#drawer	A drawer sliding in from the side
		#popup	A popup menu anchored to a link
		#cover	An overlay covering the entire screen"

	^mode!

mode: aSymbol

	"mode stores a Symbol specifying the type of layer to be opened:

		#modal	A modal dialog box
		#drawer	A drawer sliding in from the side
		#popup	A popup menu anchored to a link
		#cover	An overlay covering the entire screen"

	mode := aSymbol!

onClosed

	"A Block to be evaluated when the layer is closed.
	The single argument is the close event"

	^onClosed!

onClosed: aOneArgBlock

	"A Block to be evaluated when the layer is closed.
	The single argument is the close event"

	onClosed := aOneArgBlock!

onClosedReload

	"A reference to a page component to reload when this layer is closed.
	Must be preceeded by the appropriate character (# for id, . for class etc.)"

	^onClosedReload!

onClosedReload: aString

	"A reference to a page component to reload when this layer is closed.
	Must be preceeded by the appropriate character (# for id, . for class etc.)"

	onClosedReload := aString!

onClosedSnippet

	"Return a javascript snippet to be run when the receiver is closed on the client.
	This calls the layer close handler defined in UpLayerHostDecoration - this notifies the server which in turn answers the component to reload"

	^'upLayerClosed(event)'!

onErrorSnippet

	"Return a javascript snippet to be run when the receiver experiences an error - usually cancelled whilst opening"

	^'upLayerCancelled(''<1s>'')' << self id!

onLayerClosed: anUpEvent

	self component answer: anUpEvent.

	anUpEvent respond: self onClosedReload!

onLayerOpened: anUpEvent

	anUpEvent respond: self id!

onOpenedSnippet

	"Return a javascript snippet to be run when the receiver is opened on the client.
	This calls the layer close handler defined in UpLayerHostDecoration - this notifies the server which in turn sets the current layer id"

	^'upLayerOpened(event)'!

parent
	^parent!

parent: anObject
	parent := anObject!

parentLayer

	^self parent layer!

placeholder

	"A reference to a component to be shown as a placeholder in this layer whilst it is opening.
	May be nil"

	^placeholder!

placeholder: aString

	"A reference to a component to be shown as a placeholder in this layer whilst it is opening.
	May be nil"

	placeholder := aString!

show

	"Show this layer with the configured component.
	When the layer is closed evaluate resultBlock (if not nil) with the closing event"

	componentBlock isNil ifFalse: [self component: componentBlock value].

	self session addLayer: self.

	self topComponent call: component onAnswer: 
		[ :answer || closeEvent | 
		"If #answer: was invoked in response to the layer being dismissed (e.g. user clicked X button) then answer will be the actual dismissal event.
		If newComponent invoked #answer: itself then we must trigger an event to close the layer"
		(answer isKindOf: UpEvent)
		ifTrue: 
			[closeEvent := answer]
		ifFalse: 
			[closeEvent := 
				(UpEvent type: self closeEventType)
					layer: self;
					value: answer;
					yourself].

		onClosed isNil ifFalse: [onClosed value: closeEvent].
		closeEvent isDismissal ifFalse: [self requestContext respond: [ :response | response upEvent: closeEvent]]]!

topComponent

	^self parentLayer
		ifNil: [self parent]
		ifNotNil: [ :parentLayer | parentLayer topComponent]!

upDismissable

	"upDismissable optionally stores either:
	 - aString representing the dismiss controls on the layer
	 - aBoolean enabling/disabling whether the receiver can be dismissed

	Unpoly default behaviour is equivalent to true/all controls.

	https://unpoly.com/up-layer-new#up-dismissable"

	^upDismissable!

upDismissable: aStringOrBoolean

	"upDismissable optionally stores either:
	 - aString representing the dismiss controls on the layer
	 - aBoolean enabling/disabling whether the receiver can be dismissed

	Unpoly default behaviour is equivalent to true/all controls.

	https://unpoly.com/up-layer-new#up-dismissable"

	upDismissable := aStringOrBoolean! !

!UpLayer categoriesForMethods!
beModal!initialization!public! !
bePopup!initialization!public! !
closeEventType!constants!private! !
component!accessing!public! !
component:!accessing!public! !
componentBlock!accessing!private! !
componentBlock:!accessing!private! !
configureAnchorTag:!operations!private! !
containing:!initialization!public! !
context!accessing!private! !
context:!accessing!private! !
contextAt:!accessing!public! !
contextAt:ifAbsent:!accessing!public! !
contextAt:ifPresent:!accessing!public! !
contextAt:put:!accessing!public! !
id!accessing!public! !
id:!accessing!public! !
initialize!initialization!public! !
mode!accessing!private! !
mode:!accessing!private! !
onClosed!accessing!public! !
onClosed:!accessing!public! !
onClosedReload!accessing!public! !
onClosedReload:!accessing!public! !
onClosedSnippet!constants!public! !
onErrorSnippet!constants!public! !
onLayerClosed:!event handling!public! !
onLayerOpened:!event handling!public! !
onOpenedSnippet!constants!public! !
parent!accessing!public! !
parent:!accessing!public! !
parentLayer!accessing!public! !
placeholder!accessing!public! !
placeholder:!accessing!public! !
show!operations!public! !
topComponent!accessing!public! !
upDismissable!accessing!public! !
upDismissable:!accessing!public! !
!

!UpLayer class methodsFor!

closeEventType

	^'layer:closed'!

icon

	^Icon fromId: 16753 in: ShellLibrary default!

modal

	^self new 
		beModal;
		yourself!

popup

	^self new 
		bePopup;
		yourself! !

!UpLayer class categoriesForMethods!
closeEventType!constants!public! !
icon!public! !
modal!instance creation!public! !
popup!instance creation!public! !
!

