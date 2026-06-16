"Filed out from Dolphin Smalltalk"!

SSWFileLibrary subclass: #UpBootstrap5Library
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!

UpBootstrap5Library guid: (GUID fromString: '{003d7c9e-e3d9-4b25-a4a7-f8da6b3380ea}')!

UpBootstrap5Library comment: ''!

!UpBootstrap5Library categoriesForClass!Libraries! !

!UpBootstrap5Library methodsFor!

cssunpolybootstrap5CssContent

	##(Pragma css: 'css/unpoly.bootstrap5.css').

	^'up-modal .container,up-modal .container-fluid,up-drawer .container,up-drawer .container-fluid,up-popup .container,up-popup .container-fluid{padding-left:0;padding-right:0;max-width:none}'!

jsbootstrapbundleminJsContent

	##(Pragma javascript: 'js/bootstrap.bundle.min.js').

	^SBSDeploymentLibrary basicNew jsbootstrapbundleminJsContent! !

!UpBootstrap5Library categoriesForMethods!
cssunpolybootstrap5CssContent!public! !
jsbootstrapbundleminJsContent!public! !
!

