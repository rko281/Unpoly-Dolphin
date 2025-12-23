"Filed out from Dolphin Smalltalk"!

WACookieOnlySessionTrackingStrategy subclass: #UpSessionTrackingStrategy
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!

UpSessionTrackingStrategy guid: (GUID fromString: '{4ba5c313-1eea-482a-8200-63267c04a164}')!

UpSessionTrackingStrategy comment: ''!

!UpSessionTrackingStrategy categoriesForClass!Tracking! !

!UpSessionTrackingStrategy methodsFor!

noHandlerFoundForKey: aString in: anApplication context: aRequestContext
	"Overridden to handle as an unauthorized request; this is trapped by an Unpoly event handler to force a full page redirect and refresh"

	| queryField |
	queryField := self queryFieldKeyFromContext: aRequestContext.
	aString = queryField ifFalse: [		"Don't delete the session cookie if we have an expired document halder.		Only delete the session cookie if we actually have an expired session."		self deleteSessionCookieOf: anApplication from: aRequestContext ].
	aRequestContext response
		status: WAResponse statusUnauthorized;
		respond! !

!UpSessionTrackingStrategy categoriesForMethods!
noHandlerFoundForKey:in:context:!public! !
!

