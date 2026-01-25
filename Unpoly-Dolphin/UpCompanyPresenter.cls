"Filed out from Dolphin Smalltalk"!

UpExamplePresenter subclass: #UpCompanyPresenter
	instanceVariableNames: 'companyProjects'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!

UpCompanyPresenter guid: (GUID fromString: '{3d8ddd74-459f-4c98-9c35-ff7e4cf35618}')!

UpCompanyPresenter comment: ''!

!UpCompanyPresenter categoriesForClass!Component! !

!UpCompanyPresenter methodsFor!

children

	^super children, {self companyProjects}!

companyProjects

	^companyProjects ifNil: [companyProjects := UpCompanyProjects on: self model]!

renderContentOn: html
	
	super renderContentOn: html.

	html definitionList with: 
		[html definitionTerm marginBottom: 1; with: 'Name'.
		html definitionData marginBottom: 2; with: self model name.
		html definitionTerm marginBottom: 1; with: 'Address'.
		html definitionData marginBottom: 2; with: [html withLineBreaks: (self model address ifNil: ['-'])]].

	html div 
		id: 'projects';
		with: [html render: self companyProjects]! !

!UpCompanyPresenter categoriesForMethods!
children!accessing!public! !
companyProjects!accessing!public! !
renderContentOn:!public!rendering! !
!

