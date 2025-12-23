"Filed out from Dolphin Smalltalk"!

UpExample subclass: #UpIntroduction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!

UpIntroduction guid: (GUID fromString: '{0abf18c3-6f80-4297-afae-70cbf129ce1c}')!

UpIntroduction comment: ''!

!UpIntroduction categoriesForClass!Component! !

!UpIntroduction methodsFor!

renderContentOn: html

	html heading level2 with: 'Unpoly'.

	html paragraph: 
		[html anchor
			url: 'https://unpoly.com/';
			with: 'Unpoly'.
		html text: ' is an '.
		html anchor
			url: 'https://blog.teamtreehouse.com/unobtrusive-javascript-important';
			with: 'unobtrusive Javascript'.
		html text: ' framework for applications that render on the server. It allows your views to do things that are not normally possible in HTML, such as having links '.
		html anchor
			url: 'https://unpoly.com/up.link';
			with: 'update only fragments of a page'.
		html text: ', or '.
		html anchor
			url: 'https://unpoly.com/up.layer';
			with: 'opening links in modal dialogs.'].

	html paragraph: 'Unpoly can give your server-side application fast and flexible frontends that feel like a single-page application (SPA). It also preserves the resilience and simplicity of the server-side programming model.'.


	html heading level2 with: 'Unpoly for Seaside'.

	html paragraph: 
		[html anchor
			url: 'https://github.com/rko281/Unpoly-Dolphin';
			with: 'Unpoly for Seaside'.
		html text: ' is an add-on library for '.
		html anchor
			url: 'https://github.com/rko281/Seaside';
			with: 'Seaside'.
		html text: ' which provides easy access to Unpoly''s core features using familiar Smalltalk and Seaside code patterns.'].

	html paragraph: 
		[html text: 'Use the naviation bar to browse some simple examples. These include Unpoly versions of the familiar Seaside Counter examples plus a Seaside conversion of the Unpoly '.
		html anchor
			url: 'https://demo.unpoly.com/';
			with: 'Companies and Projects'.
		html text: ' demo applications.']! !

!UpIntroduction categoriesForMethods!
renderContentOn:!public! !
!

!UpIntroduction class methodsFor!

exampleName
	^'Introduction'!

ordering
	^0!

subPath
	^'introduction'! !

!UpIntroduction class categoriesForMethods!
exampleName!constants!public! !
ordering!constants!public! !
subPath!constants!public! !
!

