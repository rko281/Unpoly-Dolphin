"Filed out from Dolphin Smalltalk"!

UpExampleModel subclass: #UpCompany
	instanceVariableNames: 'address projects'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!

UpCompany guid: (GUID fromString: '{d76426a8-60e6-48d7-be78-492337434963}')!

UpCompany comment: ''!

!UpCompany categoriesForClass!Kernel-Objects! !

!UpCompany methodsFor!

addProject: aProject

	aProject company: self.

	^self projects add: aProject!

addProjects: aCollection

	^aCollection do: [ :each | self addProject: each]!

address
	^address!

address: anObject
	address := anObject!

matches: aString

	^(super matches: aString) or: [aString match: self address]!

projects
	^projects!

projects: anObject
	projects := anObject!

removeProject: aProject

	^self projects remove: aProject!

removeProject: aProject ifAbsent: aBlock

	^self projects remove: aProject ifAbsent: aBlock!

updateFrom: anotherCompany

	super updateFrom: anotherCompany.
	self address: anotherCompany address! !

!UpCompany categoriesForMethods!
addProject:!add/remove!public! !
addProjects:!add/remove!public! !
address!accessing!private! !
address:!accessing!private! !
matches:!public!testing! !
projects!accessing!private! !
projects:!accessing!private! !
removeProject:!add/remove!public! !
removeProject:ifAbsent:!add/remove!public! !
updateFrom:!operations!public! !
!

!UpCompany class methodsFor!

description

	^'Company'!

editorClass

	^UpCompanyEditor!

new

	^super new
		projects: OrderedCollection new;
		yourself!

presenterClass

	^UpCompanyPresenter!

template

	^self new
		name: 'Acme Corporation';
		address: '123 Some Street<N>Some Town<N>Somewhere' expandMacros;
		yourself! !

!UpCompany class categoriesForMethods!
description!constants!public! !
editorClass!constants!public! !
new!instance creation!public! !
presenterClass!constants!public! !
template!instance creation!public! !
!

