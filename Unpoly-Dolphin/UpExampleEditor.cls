"Filed out from Dolphin Smalltalk"!

UpComponent subclass: #UpExampleEditor
	instanceVariableNames: 'model errorMessages'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!

UpExampleEditor guid: (GUID fromString: '{0195a731-d034-43ee-b0bf-2c34957106d0}')!

UpExampleEditor comment: ''!

!UpExampleEditor categoriesForClass!Component! !

!UpExampleEditor methodsFor!

accept

	| isValid isValidating |

	self refreshErrorMessages.

	isValidating  := self requestContext request isUpValidating.
	isValid := errorMessages isEmpty.

	(isValidating not and: [isValid]) ifTrue: [self answer: true]!

allModels

	^self subclassResponsibility!

cancel

	self answer: false!

initialize

	super initialize.

	self initializeErrorMessages!

initializeErrorMessages

	errorMessages := IdentityDictionary new!

model
	^model!

model: anObject
	model := anObject!

nameErrorMessage

	self model name ifNotNil: 
		[ :name | 
		name isEmpty ifTrue: [^'can''t be blank'].
		(self allModels anySatisfy: [ :each | each ~= self model and: [each name match: name]]) ifTrue: [^'has already been taken']].

	^nil!

refreshErrorMessages

	self initializeErrorMessages.

	self nameErrorMessage ifNotNil: [ :message | errorMessages at: #name put: message]!

renderContentOn: html

	html heading
		level2;
		marginBottom: 4;
		with: (self model id ifNil: ['New <1s>'] ifNotNil: [ :id | 'Edit <1s> ', id displayString]) << self model class description.

	html form
		upValidate: true;
		upDisable: true;
		upPreview: 'btn-spinner';
		with: 
			[self renderFormFieldsOn: html.

			html div
				displayFlex;
				marginTop: 4;
				alignItemsCenter;
				with: 
					[html div 
						flexGrow: 1;
						with: 
							[html formButton
								beSubmit;
								bePrimary;
								callback: [self accept];
								with: 'Save'].
					html div with: 
							[html linkButton
								upPreview: 'main-spinner';
								class: 'btn-outline-secondary';
								callback: [self cancel];
								with: 'Cancel']]]!

renderFieldSet: aBlock for: aSymbol on: html 

	| fieldSet |

	fieldSet := html fieldSet id: aSymbol.

	(errorMessages at: aSymbol ifAbsent: [nil]) 
	ifNil: 
		[fieldSet with: aBlock]
	ifNotNil: 
		[ :errorMessage | 
		fieldSet with:
			[html div
				class: 'field_with_errors';
				with: aBlock.
			html small 
				class: 'form-text form-error';
				with: errorMessage]]!

renderFormFieldsOn: html

	self subclassResponsibility! !

!UpExampleEditor categoriesForMethods!
accept!operations!public! !
allModels!accessing!private! !
cancel!operations!public! !
initialize!initializing!public! !
initializeErrorMessages!initializing!private! !
model!accessing!private! !
model:!accessing!private! !
nameErrorMessage!accessing!private! !
refreshErrorMessages!operations!private! !
renderContentOn:!public!rendering! !
renderFieldSet:for:on:!private!rendering! !
renderFormFieldsOn:!public!rendering! !
!

!UpExampleEditor class methodsFor!

on: anUpExampleModel

	^self new
		model: anUpExampleModel;
		yourself! !

!UpExampleEditor class categoriesForMethods!
on:!instance creation!public! !
!

