"Filed out from Dolphin Smalltalk"!

SBSComponent subclass: #UpComponent
	instanceVariableNames: 'parent'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!

UpComponent guid: (GUID fromString: '{137e56d6-57f6-44f9-9689-1d69941fb205}')!

UpComponent comment: ''!

!UpComponent categoriesForClass!Component! !

!UpComponent methodsFor!

expiredSessionUrl

	"Answer the URL of the page to show when a session has expired.
	Default - just go back to the root"

	^self class contextRoot!

initialize

	super initialize.

	self isRoot ifTrue: [self addDecoration: UpRootComponentDecoration new]!

isInLayer

	^self layerDecoration notNil!

isRoot

	"Am I a root application?
	Default - if I can be a root, I am"

	^self class canBeRoot!

layer

	"Answer the UpLayer in which the receiver exists or nil if none"

	^self layerDecoration ifNotNil: [ :layerDecoration | layerDecoration layer]!

layerContextAt: aSymbol

	^self layerContextAt: aSymbol ifAbsent: [self error: 'not found']!

layerContextAt: aSymbol ifAbsent: aBlock

	^self layer 
		ifNil: [aBlock value]
		ifNotNil: [ :layer | layer contextAt: aSymbol ifAbsent: aBlock]!

layerDecoration

	"Answer the UpLayerDecoration wrapping the receiver (either directly or in its parent hierarchy) or nil if none"

	^self decoration upLayerDecoration ifNil: 
		[parent isNil ifFalse: [parent layerDecoration]]!

rendererClass

	^UpHtmlCanvas!

renderWithContext: aRenderContext

	"UpComponents need to traverse their parents for later detection"

	parent := aRenderContext upCurrentComponent.
	aRenderContext upCurrentComponent: self.
	[super renderWithContext: aRenderContext] ensure: [aRenderContext upCurrentComponent: parent]!

shouldDisableUnpolyCaching

	"Answer whether the receiver should disable all Unpoly caching.
	By default caching is DISABLED.
	The reasoning is that Seaside workflow typically involves callbacks with side-effects so caching is undesirable.
	Disabling caching also disables preloading of links which can be dangerous where following a link invokes a callaback causing a state change on the server.

	Override to return false to enable default Unpoly caching; note you may then need to set the following on individual elements to prevent unsafe behaviour:
		upCache:
		upPreload:
		upMethod: 

	https://unpoly.com/caching
	https://unpoly.com/preloading"

	^true!

show: aComponent onAnswer: aBlock delegation: aDelegation
	self layer ifNotNil: [ :layer | layer component: aComponent].

	^super show: aComponent onAnswer: aBlock delegation: aDelegation!

upLayerDecoration

	"Polymorphic with WADecoration"

	^nil! !

!UpComponent categoriesForMethods!
expiredSessionUrl!accessing!public! !
initialize!initialization!public! !
isInLayer!public!testing! !
isRoot!public!testing! !
layer!accessing!public! !
layerContextAt:!accessing!public! !
layerContextAt:ifAbsent:!accessing!public! !
layerDecoration!accessing!public! !
rendererClass!public!rendering! !
renderWithContext:!private!rendering! !
shouldDisableUnpolyCaching!public!testing! !
show:onAnswer:delegation:!delegation!public! !
upLayerDecoration!accessing!private! !
!

!UpComponent class methodsFor!

contextRoot
	"Return a string representing the context root name (part of the URL) to access this component as a standalone application"	^self error: 'root component classes must implement contextRoot'!

openBrowser
	WebBrowser openOn: 'http://localhost:8080/', self contextRoot!

register

	| app decorators |

	app := WAAdmin register: self asApplicationAt: self contextRoot.

	app
		addLibrary: SBSDeploymentLibrary;
		addLibrary: UpDeploymentLibrary;
		addLibrary: UpBootstrap5Library.

	"UpDeploymentLibrary breaks the standard Seaside toolbar (needs investigating)"
	decorators := app preferenceAt: #rootDecorationClasses.
	app preferenceAt: #rootDecorationClasses put: (decorators reject: [:each | each key = #WAToolDecoration]).

	^app 
		sessionClass: UpSession;
		preferenceAt: #renderPhaseContinuationClass put: UpRenderPhaseContinuation;
		preferenceAt: #initialContinuationClass put: UpInitialRenderLoopContinuation;
		preferenceAt: #trackingStrategy put: UpSessionTrackingStrategy new;
		yourself! !

!UpComponent class categoriesForMethods!
contextRoot!accessing!public! !
openBrowser!public!utilities! !
register!public! !
!

