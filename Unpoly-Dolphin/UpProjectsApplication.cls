"Filed out from Dolphin Smalltalk"!

UpExampleApplication subclass: #UpProjectsApplication
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!

UpProjectsApplication guid: (GUID fromString: '{d032f963-3e31-4a24-992c-664c04dc8d92}')!

UpProjectsApplication comment: ''!

!UpProjectsApplication categoriesForClass!Component! !

!UpProjectsApplication methodsFor!

add: aProject

	self database addProject: aProject!

delete: aProject

	self database removeProject: aProject!

list

	^self database projects!

modelClass

	^UpProject!

renderAdditionalColumnHeadingsOn: html

	html tableHeading: 'Company'!

renderAdditionalColumnsFor: aProject on: html

	html tableData: aProject company name! !

!UpProjectsApplication categoriesForMethods!
add:!adding!public! !
delete:!adding!public! !
list!accessing!public! !
modelClass!constants!public! !
renderAdditionalColumnHeadingsOn:!private!rendering! !
renderAdditionalColumnsFor:on:!private!rendering! !
!

!UpProjectsApplication class methodsFor!

exampleName
	^'Projects'!

ordering
	^40!

subPath
	^'projects'! !

!UpProjectsApplication class categoriesForMethods!
exampleName!constants!public! !
ordering!constants!public! !
subPath!constants!public! !
!

