"Filed out from Dolphin Smalltalk"!

UpExampleEditor subclass: #UpProjectEditor
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!

UpProjectEditor guid: (GUID fromString: '{d7995cd5-295f-4baf-b0a0-cee7829b3dcd}')!

UpProjectEditor comment: ''!

!UpProjectEditor categoriesForClass!Component! !

!UpProjectEditor methodsFor!

allCompanies

	^(self session properties at: #database) companies!

allModels

	^(self session properties at: #database) projects!

budgetErrorMessage

	self model budget isNil ifTrue: [^'is not a number'].
	self model budget < 100 ifTrue: [^'must be greater than or equal to 100'].

	^nil!

companyErrorMessage

	^self model company isNil 
		ifTrue: ['can''t be blank']
		ifFalse: [nil]!

isFromCompanyPresenter

	^self layerContextAt: 'from-company' ifAbsent: [false]!

nameSuggester

	^UpLayer popup
		containing: UpNameSuggester new;
		onAnswer: [ :name | self model name: name];
		onClosedReload: '#name-field';
		yourself!

newCompanyLayer

	^UpLayer modal
		containing: 
			[UpCompanyEditor on: UpCompany new];
		onClosed: [ :event | self onNewCompanyEditorClosed: event];
		onClosedReload: '#company';
		yourself!

onNewCompanyEditorClosed: closeEvent

	| newCompany |

	(closeEvent isDismissal not and: [closeEvent value]) ifTrue: 
		[newCompany := closeEvent layer component model.
		self database addCompany: newCompany.
		self model company: newCompany]!

refreshErrorMessages

	super refreshErrorMessages.

	self budgetErrorMessage ifNotNil: [ :message | errorMessages at: #budget put: message].
	self companyErrorMessage ifNotNil: [ :message | errorMessages at: #company put: message]!

renderFormFieldsOn: html

	self
		renderFieldSet:  
			[html label: 'Name'. 
			html inputGroup:
				[html formTextInput 
					id: 'name-field';
					on: #name of: self model.
				html linkButton
					beOutline;
					beSecondary;
					showLayer: self nameSuggester in: self;
					with: 'Suggest Name']]
		for: #name
		on: html.

	self isFromCompanyPresenter ifFalse:  
		[self
			renderFieldSet:  
				[html label: 'Company'. 
				html inputGroup: 
					[html formSelect
						id: 'company';
						labels: [ :each | each ifNil: ['<select a company>'] ifNotNil: [ :company | company name]];
						list: ({nil}, self allCompanies);
						selected: self model company;
						callback: [ :value | self model company: value ] .
					html linkButton
						beOutline;
						beSecondary;
						showLayer: self newCompanyLayer in: self;
						with: 'New Company']]
			for: #company
			on: html].

	self
		renderFieldSet:  
			[html label: 'Budget'. 
			html inputGroup: 
				[html formTextInput on: #budgetString of: self model.
				html inputGroupAppend: [html inputGroupText: self model currency]]]
		for: #budget
		on: html! !

!UpProjectEditor categoriesForMethods!
allCompanies!accessing!public! !
allModels!accessing!private! !
budgetErrorMessage!accessing!private! !
companyErrorMessage!accessing!private! !
isFromCompanyPresenter!public!testing! !
nameSuggester!accessing!public! !
newCompanyLayer!accessing!public! !
onNewCompanyEditorClosed:!event handling!public! !
refreshErrorMessages!operations!private! !
renderFormFieldsOn:!public!rendering! !
!

