"Filed out from Dolphin Smalltalk"!

UpExampleModel subclass: #UpProject
	instanceVariableNames: 'budget company'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!

UpProject guid: (GUID fromString: '{a2772a15-1389-4242-b79f-7db69a7a8aa4}')!

UpProject comment: ''!

!UpProject categoriesForClass!Kernel-Objects! !

!UpProject methodsFor!

budget
	^budget!

budget: anObject
	budget := anObject!

budgetString

	^self budget isNil 
		ifTrue: ['']
		ifFalse: [Locale default printFloat: self budget asFloat]!

budgetString: aString

	| validString |

	validString := aString select: [ :each | each isDigit or: [each = Locale default decimalSeparator first]].

	validString isEmpty 
		ifTrue: [self budget: nil]
		ifFalse: [self budget: ((Number readFrom: validString readStream) ifNotNil: [ :number | number asScaledDecimal: 2])]!

budgetStringWithCurrency

	^self currency, self budgetString!

company
	^company!

company: anObject
	company := anObject!

currency

	^Locale default currency!

updateFrom: anotherProject

	super updateFrom: anotherProject.

	self budget: anotherProject budget.

	self company ~= anotherProject company ifTrue: 
		[self company removeProject: self.
		anotherProject company addProject: self]! !

!UpProject categoriesForMethods!
budget!accessing!private! !
budget:!accessing!private! !
budgetString!accessing!public! !
budgetString:!accessing!public! !
budgetStringWithCurrency!accessing!public! !
company!accessing!private! !
company:!accessing!private! !
currency!accessing!public! !
updateFrom:!operations!public! !
!

!UpProject class methodsFor!

description

	^'Project'!

editorClass

	^UpProjectEditor!

new

	^super new
		budget: 0s2;
		yourself!

presenterClass

	^UpProjectPresenter!

template

	^self new
		name: 'Big Plan';
		budget: 1234.56s2;
		company: UpCompany template;
		yourself! !

!UpProject class categoriesForMethods!
description!accessing!public! !
editorClass!constants!public! !
new!instance creation!public! !
presenterClass!constants!public! !
template!instance creation!public! !
!

