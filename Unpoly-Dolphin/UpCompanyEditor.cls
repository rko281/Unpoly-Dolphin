"Filed out from Dolphin Smalltalk"!

UpExampleEditor subclass: #UpCompanyEditor
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!

UpCompanyEditor guid: (GUID fromString: '{55e4f507-dc8a-460e-bb27-02ba6589d86c}')!

UpCompanyEditor comment: ''!

!UpCompanyEditor categoriesForClass!Component! !

!UpCompanyEditor methodsFor!

allModels

	^(self session properties at: #database) companies!

companyAddressErrorMessage

	self model address ifNotNil: [ :address | address isEmpty ifTrue: [^'can''t be blank']].
	^nil!

refreshErrorMessages

	super refreshErrorMessages.

	self companyAddressErrorMessage ifNotNil: [ :message | errorMessages at: #address put: message]!

renderFormFieldsOn: html

	self
		renderFieldSet:  [html label: 'Name'. html formTextInput on: #name of: self model]
		for: #name
		on: html.

	self
		renderFieldSet:  [html label: 'Address'. html formTextArea rows: 6; on: #address of: self model]
		for: #address
		on: html! !

!UpCompanyEditor categoriesForMethods!
allModels!accessing!public! !
companyAddressErrorMessage!accessing!private! !
refreshErrorMessages!operations!private! !
renderFormFieldsOn:!public!rendering! !
!

