"Filed out from Dolphin Smalltalk"!

UpComponent subclass: #UpRootComponent
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!

UpRootComponent guid: (GUID fromString: '{e57562fe-e080-45d7-82ed-eaea7f04df86}')!

UpRootComponent comment: ''!

!UpRootComponent categoriesForClass!Component! !

!UpRootComponent methodsFor!

addUnauthorizedRequestHandlerToRoot: htmlRoot

	"Private - When a callback is unmatched (e.g. expired) our tracking strategy responds with a 401 error. 
	The following ever handler then matches this and redirects to the expired page, forcing a full-page refresh
	This is necessary to avoid Unpoly only updating the target fragment of the originating button/link"

	htmlRoot addScript: 
'up.on(''up:request:loaded'', function (event) {
  if (event.response.status === 401) {
    // Close any layers
up.layer.dismissOverlays();
    // Force Unpoly to do a full reload
window.location.reload(true);
window.location = ''<1s>''
  }
})' << self expiredSessionUrl!

expiredSessionUrl

	"Answer the URL of the page to show when a session has expired.
	Default - just go back to the root"

	^self class contextRoot!

initialize
	super initialize.	
	self addDecoration: UpLayerHostDecoration new!

parentComponent

	^nil!

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

updateRoot: htmlRoot

	super updateRoot: htmlRoot.

	self shouldDisableUnpolyCaching ifTrue: [htmlRoot addScript: 'up.network.config.autoCache = function(request) {return false}'].

	self addUnauthorizedRequestHandlerToRoot: htmlRoot.

	"Ensure we always have a layer host"
	self beLayerHost! !

!UpRootComponent categoriesForMethods!
addUnauthorizedRequestHandlerToRoot:!private!updating! !
expiredSessionUrl!accessing!public! !
initialize!initialization!public! !
parentComponent!accessing!public! !
shouldDisableUnpolyCaching!public!testing! !
updateRoot:!public!updating! !
!

!UpRootComponent class methodsFor!

canBeRoot	^ true!

contextRoot	"Return a string representing the context root name (part of the URL) to access this	 component as a standalone application"	^self subclassResponsibility!

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

!UpRootComponent class categoriesForMethods!
canBeRoot!public!testing! !
contextRoot!accessing!public! !
register!public! !
!

