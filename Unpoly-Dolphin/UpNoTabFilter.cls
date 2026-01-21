"Filed out from Dolphin Smalltalk"!

WARequestFilter subclass: #UpNoTabFilter
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!

UpNoTabFilter guid: (GUID fromString: '{ee6fdc08-b2f8-454d-98bd-d21f96ed3553}')!

UpNoTabFilter comment: ''!

!UpNoTabFilter categoriesForClass!Seaside-Core-Filter! !

!UpNoTabFilter methodsFor!

handleFiltered: aRequestContext 
	"Prevent callbacks from being opened in a new tab/window where specified"

	| request |

	request := aRequestContext request.

	^(request upTarget isNil and: [request fields includesKey: '_notab']) 
		ifTrue: [aRequestContext redirectTo: (aRequestContext request headerAt: 'referer')]
		ifFalse: [super handleFiltered: aRequestContext]! !

!UpNoTabFilter categoriesForMethods!
handleFiltered:!processing!public! !
!

