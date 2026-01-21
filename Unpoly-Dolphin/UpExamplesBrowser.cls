"Filed out from Dolphin Smalltalk"!

UpComponent subclass: #UpExamplesBrowser
	instanceVariableNames: 'currentExample'
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

children	^self currentExample
		ifNil: [#()]
		ifNotNil: [ :child | Array with: child]!

currentExample

	^currentExample contents!

currentExample: anUpComponent

	currentExample contents: anUpComponent!

defaultPath
	
	^WAUrl new path: {self class contextRoot. self exampleClasses first subPath}!

exampleClasses

	^UpExample allExamples sort: [ :a :b | a ordering = b ordering ifTrue: [a name <= b name] ifFalse: [a ordering < b ordering]]!

initialize

	super initialize.

	(self addDecoration: UpNotificationDecoration new) anchorRight.
			
	self exampleClasses do: [ :each | each initializeSession: self session].
	currentExample := WAValueHolder new!

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

	self currentExample: aClass new!

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

	self currentExample ifNotNil: [ :child | html render: child]!

renderNavigationBarOn: html	html navigationBar 
		expandMiddle;
		beLight;
		lightBackground;
		class: 'fixed-top';		with: 
			[html navigationBarBrand
				url: (WAUrl absolute: self class contextRoot);
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

states

	^{currentExample}!

style	^self currentExample
		ifNil: [super style] 
		ifNotNil: [ :child | child style]!

updateRoot: htmlRoot

	super updateRoot: htmlRoot.

	htmlRoot title: 'Unpoly for Seaside' translated! !

!UpExamplesBrowser categoriesForMethods!
acceptToolbar!public!rendering! !
children!accessing!public! !
currentExample!accessing!public! !
currentExample:!accessing!public! !
defaultPath!accessing!public! !
exampleClasses!accessing!public! !
initialize!initialization!public! !
initialRequest:!hooks!public! !
navigateToExampleClass:!operations!public! !
newSession!operations!public! !
renderContentOn:!public!rendering! !
renderExampleOn:!public!rendering! !
renderNavigationBarOn:!public!rendering! !
renderToolbarOn:!public!rendering! !
states!accessing!public! !
style!hooks!public! !
updateRoot:!public!updating! !
!

!UpExamplesBrowser class methodsFor!

canBeRoot

	^true!

contextRoot	^'unpoly'!

initialize	self register!

register

	^super register
		addLibrary: UpExamplesLibrary;
		yourself! !

!UpExamplesBrowser class categoriesForMethods!
canBeRoot!class initialization!public! !
contextRoot!accessing!public! !
initialize!class initialization!public! !
register!class initialization!public! !
!

