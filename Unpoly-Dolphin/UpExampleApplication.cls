"Filed out from Dolphin Smalltalk"!

UpExample subclass: #UpExampleApplication
	instanceVariableNames: 'searchValue'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!

UpExampleApplication guid: (GUID fromString: '{2d4f74f6-c105-4e9c-a5bb-5819df78b2da}')!

UpExampleApplication comment: ''!

!UpExampleApplication categoriesForClass!Component! !

!UpExampleApplication methodsFor!

add: aModel

	^self subclassResponsibility!

delete: aModel

	^self subclassResponsibility!

editorClass

	^self modelClass editorClass!

filteredList

	^self searchPattern
		ifNil: [self list]
		ifNotNil: [ :pattern | self list select: [ :each | each matches: pattern]]!

list

	^self subclassResponsibility!

modelClass

	^self subclassResponsibility!

newModel

	^self modelClass new!

newModelEditorLayer

	^UpLayer modal
		containing: 
			[self exampleWait. 
			self editorClass on: self newModel];
		placeholder: self editorClass asPlaceholder;
		onClosed: [ :event | self onEditorClosed: event model: event layer component model];
		onClosedReload: '.table';
		yourself!

onEditorClosed: closeEvent model: aModel

	(closeEvent isDismissal not and: [closeEvent value]) ifTrue: 
		[self add: closeEvent layer component model.
		self session notification: [ :html | html alert beSuccess; with: '<1s> saved successfully' << self modelClass description]]!

onPresenterClosed: closeEvent model: aModel

	closeEvent value = #deleted ifTrue: [self delete: aModel]!

presenterClass

	^self modelClass presenterClass!

presenterLayerFor: aModel

	^UpLayer modal
		containing: 
			[self exampleWait. 
			self presenterClass on: aModel];
		placeholder: self presenterClass asPlaceholder;
		onClosed: [ :closeEvent | self onPresenterClosed: closeEvent model: closeEvent layer component model];
		onClosedReload: '.table';
		yourself!

renderAdditionalColumnHeadingsOn: html!

renderAdditionalColumnsFor: aModel on: html!

renderContentOn: html

	self 
		renderHeaderOn: html;
		renderTableOn: html;
		renderPlaceholdersOn: html!

renderHeaderOn: html

	html row 
		alignItemsCenter;
		marginBottom: 4;
		gutterX: 2;
		with: 
			[html column variableWidth with: [html heading level2 with: 'All ', self class exampleName].
			html column smallVariableWidth with: 
				[html form
					class: 'd-inline-block';
					upAutoSubmit: true;
					upTarget: '.table';
					upWatchDelay: 500;
					with: 
						[html searchInput
							formControl;
							name: 'query';
							placeholder: 'Search…';
							autocomplete: 'off';
							on: #searchValue of: self;
							size: 17.
						html span class: 'search-spinner']].
			html column smallVariableWidth with: 
				[html linkButton
					bePrimary;
					showLayer: self newModelEditorLayer;
					with: 'New ', self modelClass description]]!

renderModel: aModel on: html

	html tableData: 
		[html anchor
			showLayer: (self presenterLayerFor: aModel);
			with: aModel name].

	self renderAdditionalColumnsFor: aModel on: html!

renderPlaceholdersOn: html

	UpCompanyPresenter new
		model: UpCompany template;
		renderAsPlaceholderOn: html.

	UpCompanyEditor new
		model: UpCompany template;
		renderAsPlaceholderOn: html.

	UpProjectPresenter new
		model: UpProject template;
		renderAsPlaceholderOn: html.

	UpProjectEditor new
		model: UpProject template;
		renderAsPlaceholderOn: html.!

renderTableOn: html

	html table
		class: 'table';
		with: 
			[html tableHead: 
				[html tableRow: 
					[html tableHeading: 'Name'.
					self renderAdditionalColumnHeadingsOn: html]].
			html tableBody: 
				[self filteredList do: 
					[:each | 
					html tableRow: 
						[self
							renderModel: each
							on: html ] ] ] ]!

searchPattern

	^(searchValue ifNil: ['']) isEmpty
		ifTrue: [nil]
		ifFalse: ['*', searchValue , '*']!

searchValue
	^searchValue!

searchValue: aString
	searchValue := aString.
	self exampleWait!

updateRoot: htmlRoot

	self beLayerHost.
	^super updateRoot: htmlRoot! !

!UpExampleApplication categoriesForMethods!
add:!add/remove!public! !
delete:!add/remove!public! !
editorClass!constants!public! !
filteredList!accessing!public! !
list!accessing!public! !
modelClass!constants!public! !
newModel!accessing!public! !
newModelEditorLayer!accessing!public! !
onEditorClosed:model:!event handling!public! !
onPresenterClosed:model:!event handling!public! !
presenterClass!constants!public! !
presenterLayerFor:!accessing!public! !
renderAdditionalColumnHeadingsOn:!private!rendering! !
renderAdditionalColumnsFor:on:!private!rendering! !
renderContentOn:!public!rendering! !
renderHeaderOn:!public!rendering! !
renderModel:on:!public!rendering! !
renderPlaceholdersOn:!public!rendering! !
renderTableOn:!public!rendering! !
searchPattern!accessing!public! !
searchValue!accessing!private! !
searchValue:!accessing!private! !
updateRoot:!accessing!public! !
!

!UpExampleApplication class methodsFor!

isAbstract
	^self name = #UpExampleApplication! !

!UpExampleApplication class categoriesForMethods!
isAbstract!public!testing! !
!

