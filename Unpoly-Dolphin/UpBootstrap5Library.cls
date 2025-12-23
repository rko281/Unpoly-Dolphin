"Filed out from Dolphin Smalltalk"!

SBSFileLibrary subclass: #UpBootstrap5Library
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!

UpBootstrap5Library guid: (GUID fromString: '{003d7c9e-e3d9-4b25-a4a7-f8da6b3380ea}')!

UpBootstrap5Library comment: ''!

!UpBootstrap5Library categoriesForClass!Libraries! !

!UpBootstrap5Library methodsFor!

cssunpolybootstrap5Css
	^ WAFileLibraryResource
		filepath: 'css/unpoly.bootstrap5.css'
		mimeType: (WAMimeType main: 'text' sub: 'css')
		cacheDuration: (Duration days: 0 hours: 0 minutes: 30 seconds: 0)
		contents: (GRDelayedSend receiver: self selector: #cssunpolybootstrap5CssContent)!

cssunpolybootstrap5CssContent

	^'up-modal .container,up-modal .container-fluid,up-drawer .container,up-drawer .container-fluid,up-popup .container,up-popup .container-fluid{padding-left:0;padding-right:0;max-width:none}'!

selectorsToInclude	^#(#cssunpolybootstrap5Css)! !

!UpBootstrap5Library categoriesForMethods!
cssunpolybootstrap5Css!public! !
cssunpolybootstrap5CssContent!public! !
selectorsToInclude!accessing!public! !
!

