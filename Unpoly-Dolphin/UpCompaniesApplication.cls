"Filed out from Dolphin Smalltalk"!

UpExampleApplication subclass: #UpCompaniesApplication
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!

UpCompaniesApplication guid: (GUID fromString: '{2a2fcf4d-bbe1-4fdd-86ee-114a82b42e95}')!

UpCompaniesApplication comment: ''!

!UpCompaniesApplication categoriesForClass!Component! !

!UpCompaniesApplication methodsFor!

add: aCompany

	self database addCompany: aCompany!

delete: aCompany

	self database removeCompany: aCompany!

list

	^self database companies!

modelClass

	^UpCompany! !

!UpCompaniesApplication categoriesForMethods!
add:!add/remove!public! !
delete:!add/remove!public! !
list!accessing!public! !
modelClass!constants!public! !
!

!UpCompaniesApplication class methodsFor!

exampleName
	^'Companies'!

initializeSession: anUpSession

	anUpSession properties at: #database put: UpExampleDatabase new!

ordering
	^30!

subPath
	^'companies'! !

!UpCompaniesApplication class categoriesForMethods!
exampleName!constants!public! !
initializeSession:!initializing!public! !
ordering!constants!public! !
subPath!constants!public! !
!

