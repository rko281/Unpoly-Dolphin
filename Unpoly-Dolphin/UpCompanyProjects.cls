"Filed out from Dolphin Smalltalk"!

UpProjectsApplication subclass: #UpCompanyProjects
	instanceVariableNames: 'company'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!

UpCompanyProjects guid: (GUID fromString: '{d0804999-2c5d-43d4-8a24-89ae47698900}')!

UpCompanyProjects comment: ''!

!UpCompanyProjects categoriesForClass!Component! !

!UpCompanyProjects methodsFor!

company
	^company!

company: anObject
	company := anObject!

list

	^self company projects!

newModel

	^super newModel
		company: self company;
		yourself!

newModelEditorLayer

	^super newModelEditorLayer
		contextAt: 'from-company' put: true;
		yourself!

presenterLayerFor: aProject

	^(super presenterLayerFor: aProject)
		contextAt: 'from-company' put: true;
		yourself!

renderAdditionalColumnHeadingsOn: html

	html tableHeading: 'Budget'!

renderAdditionalColumnsFor: aProject on: html

	html tableData
		align: 'right';
		with: aProject budgetStringWithCurrency!

renderHeaderOn: html

	html row 
		alignItemsCenter;
		marginBottom: 2;
		gutterX: 2;
		with: 
			[html column variableWidth with: [html heading level4 with: self class exampleName].
			html column smallVariableWidth with: 
				[html linkButton
					bePrimary;
					beSmall;
					showLayer: self newModelEditorLayer in: self;
					with: 'Add ', self modelClass description]]!

renderPlaceholdersOn: html

	"Not required"! !

!UpCompanyProjects categoriesForMethods!
company!accessing!private! !
company:!accessing!private! !
list!accessing!public! !
newModel!accessing!public! !
newModelEditorLayer!accessing!public!rendering! !
presenterLayerFor:!accessing!public!rendering! !
renderAdditionalColumnHeadingsOn:!private!rendering! !
renderAdditionalColumnsFor:on:!private!rendering! !
renderHeaderOn:!public!rendering! !
renderPlaceholdersOn:!public!rendering! !
!

!UpCompanyProjects class methodsFor!

isAbstract

	"Not really abstract but needs excluding from the list of examples"

	^true!

on: anUpCompany

	^self new
		company: anUpCompany;
		yourself! !

!UpCompanyProjects class categoriesForMethods!
isAbstract!public!testing! !
on:!instance creation!public! !
!

