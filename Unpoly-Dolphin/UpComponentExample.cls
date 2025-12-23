"Filed out from Dolphin Smalltalk"!

UpExample subclass: #UpComponentExample
	instanceVariableNames: 'component'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!

UpComponentExample guid: (GUID fromString: '{06ab7218-dea2-4b8c-b85f-8d5b7815165e}')!

UpComponentExample comment: ''!

!UpComponentExample categoriesForClass!Component! !

!UpComponentExample methodsFor!

componentClass

	^self subclassResponsibility!

exampleSource

	^(self componentClass>>#renderContentOn:) sourceCode!

initialize

	super initialize.
	component := self componentClass new!

renderContentOn: html

	self renderDescriptionOn: html.

	html row
		alignItemsCenter;
		marginTop: 4;
		marginBottom: 4;
		gutterX: 2;
		with: 
			[html column variableWidth with: [html render: component]].

	html break;break.
	html heading level2; with: 'Smalltalk source code'.
	html horizontalRule.
	html preformatted style: 'width: 100%'; with: [html code dataAttributeAt: 'highlighted' put: 'yes'; with: self exampleSource]!

renderDescriptionOn: html

	self subclassResponsibility! !

!UpComponentExample categoriesForMethods!
componentClass!constants!public! !
exampleSource!accessing!public! !
initialize!initialize/release!public! !
renderContentOn:!public!rendering! !
renderDescriptionOn:!public!rendering! !
!

!UpComponentExample class methodsFor!

isAbstract
	^self name = #UpComponentExample! !

!UpComponentExample class categoriesForMethods!
isAbstract!public!testing! !
!

