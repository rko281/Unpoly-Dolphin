"Filed out from Dolphin Smalltalk"!

UpExamplePresenter subclass: #UpProjectPresenter
	instanceVariableNames: 'project'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!

UpProjectPresenter guid: (GUID fromString: '{b9f79cf7-0617-4ca3-aa53-5560839232f8}')!

UpProjectPresenter comment: ''!

!UpProjectPresenter categoriesForClass!Component! !

!UpProjectPresenter methodsFor!

renderContentOn: html

	super renderContentOn: html.

	html definitionList id: 'project'; with: 
		[html definitionTerm marginBottom: 1; with: 'Name'.
		html definitionData marginBottom: 2; with: self model name.
		html definitionTerm marginBottom: 1; with: 'Company'.
		html definitionData marginBottom: 2; with: 
			[html anchor
				upNoTab: true;
				upPlaceholder: UpCompanyPresenter asPlaceholder;
				callback: [self viewCompany];
				with: self model company name].
		html definitionTerm marginBottom: 1; with: 'Budget'.
		html definitionData marginBottom: 2; with: self model budgetStringWithCurrency]!

viewCompany

	self exampleWait.

	self show: (UpCompanyPresenter on: self model company) onAnswer: 
		[ :result | 
		result = #deleted ifTrue: 
			[self database removeCompany: self model company.
			self answer]]! !

!UpProjectPresenter categoriesForMethods!
renderContentOn:!public!rendering! !
viewCompany!public!rendering! !
!

