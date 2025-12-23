"Filed out from Dolphin Smalltalk"!

UpRootComponent subclass: #UpExamplesBrowser
	instanceVariableNames: 'currentExample examples'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!

UpExamplesBrowser guid: (GUID fromString: '{2bc76113-970c-4043-981b-66c0add4e13b}')!

UpExamplesBrowser comment: ''!

!UpExamplesBrowser categoriesForClass!Component! !

!UpExamplesBrowser methodsFor!

acceptToolbar

	| rq |

	rq := self requestContext request.
	self hasExampleDelay: (rq postFields at: 'extraLatency' ifAbsent: ['off']) = 'on'!

children	^Array with: currentExample!

defaultPath
	
	^WAUrl new path: {self class contextRoot. self exampleClasses first subPath}!

exampleClasses

	^UpExample allExamples sort: [ :a :b | a ordering = b ordering ifTrue: [a name <= b name] ifFalse: [a ordering < b ordering]]!

initialize

	super initialize.

	(self addDecoration: UpNotificationDecoration new) anchorRight.
			
	examples := IdentityDictionary new.
	self exampleClasses do: [ :each | each initializeSession: self session]!

initialRequest: request

	| url subPath |

	url := request url.
	subPath := url path last.
	subPath = self class contextRoot ifTrue: [^self requestContext redirectTo: self defaultPath].

	self navigateToExampleClass: 
		(self exampleClasses
			detect: [ :each |
				each subPath = subPath ]
			ifNone: [ self exampleClasses first ])!

navigateToExampleClass: aClass

	currentExample := (examples at: aClass ifAbsentPut: [aClass new])!

newSession

	self session unregister.
	self requestContext redirectTo: self defaultPath!

renderContentOn: html

	html div 
		class: 'example-browser';
		with: 
			[self renderNavigationBarOn: html.

			html container
				class: 'current-example';
				with: 
					[html main: 
						[self renderExampleOn: html] ].

			self renderToolbarOn: html]!

renderExampleOn: html

	currentExample ifNotNil: [html render: currentExample]!

renderNavigationBarOn: html	html navigationBar 
		expandMiddle;
		beLight;
		lightBackground;
		class: 'fixed-top';		with: 
			[html navigationBarBrand
				url: (WAUrl absolute: self class contextRoot);
				upFollow: true;
				with: 'Unpoly Demo'.
			html navigationBarNavigation:
				[self exampleClasses do: 
					[ :cls || item|
					item := html navigationLink.
					item 
						callback: [ self navigateToExampleClass: cls ];
						class: 'nav-item';
						upTarget: '.current-example';
						url: (WAUrl new path: {self class contextRoot. cls subPath});
						with: cls exampleName ]].
			html div 
				class: 'flashes-explainer'; 
				upAnchored: 'right'; 
				with: 'Notifications go here'].

	"Required - rferenced from example js"
	html div 
		id: 'new-version';
		attributeAt: 'hidden' put: true!

renderToolbarOn: html

	html navigationBar 
		expandMiddle;
		beLight;
		lightBackground;
		class: 'fixed-bottom';
		with: 
			[html navigationBarNavigation:
				[html navigationLink
					class: 'nav-item';
					upTarget: '.example-browser';
					upLocation: self defaultPath;
					callback: [ self newSession ];
					with: 'New Session' ].

				html space.

				html form
					upAutoSubmit: true;
					upTarget: '.fixed-bottom';
					with: 
						[html formGroup
							formCheck;
							marginTopAndBottom: 0;
							with: 
								[html formCheckbox
									name: 'extraLatency';
									id: 'configExtraLatency';
									on: #hasExampleDelay of: self; 
									with: 'Extra server delay']]]!

style	^currentExample style!

topLevelIdentifier

	^'.example-browser'!

updateRoot: htmlRoot

	super updateRoot: htmlRoot.

	htmlRoot title: 'Unpoly for Seaside' translated! !

!UpExamplesBrowser categoriesForMethods!
acceptToolbar!public!rendering! !
children!accessing!public! !
defaultPath!accessing!public! !
exampleClasses!accessing!public! !
initialize!initialization!public! !
initialRequest:!hooks!public! !
navigateToExampleClass:!accessing!public! !
newSession!operations!public! !
renderContentOn:!public!rendering! !
renderExampleOn:!public!rendering! !
renderNavigationBarOn:!public!rendering! !
renderToolbarOn:!public!rendering! !
style!hooks!public! !
topLevelIdentifier!accessing!public! !
updateRoot:!public!updating! !
!

!UpExamplesBrowser class methodsFor!

contextRoot	^'unpoly'!

initialize	self register!

openBrowser
	WebBrowser openOn: 'http://localhost:8080/', self contextRoot!

register

	^super register
		addLibrary: UpExamplesLibrary;
		yourself! !

!UpExamplesBrowser class categoriesForMethods!
contextRoot!accessing!public! !
initialize!class initialization!public! !
openBrowser!public!utilities! !
register!class initialization!public! !
!

