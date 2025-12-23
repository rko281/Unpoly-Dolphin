"Filed out from Dolphin Smalltalk"!

UpComponent subclass: #UpExamplePresenter
	instanceVariableNames: 'model'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!

UpExamplePresenter guid: (GUID fromString: '{e835218a-f036-4131-a7f8-51e0363ee4d1}')!

UpExamplePresenter comment: ''!

!UpExamplePresenter categoriesForClass!Component! !

!UpExamplePresenter methodsFor!

delete

	self exampleWait.
	self answer: #deleted!

edit

	| editor |

	editor := self editorClass on: self model copy.

	self show: editor onAnswer: 
		[ :confirmed |
		confirmed ifTrue: 
			[self exampleWait.
			self model updateFrom: editor model.
			self session notification: [ :html | html alert beSuccess; with: '<1s> saved successfully' << editor model class description]]]!

editorClass

	^self model editorClass!

model
	^model!

model: anObject
	model := anObject!

renderContentOn: html

	html row
		alignItemsCenter;
		marginBottom: 4;
		with: 
			[html column variableWidth with: [html heading level2 with: '<1s> #<2p>' << {self model class description. self model id}].
			html column 
				smallVariableWidth
				with: 
					[html linkButton 
						bePrimary; 
						upPreview: 'main-spinner';
						callback: [self edit];
						with: 'Edit'.
					html linkButton 
						beDanger;
						upConfirm: 'Really delete?';
						upPreview: 'btn-spinner';
						callback: [self delete];
						with: 'Delete']]! !

!UpExamplePresenter categoriesForMethods!
delete!operations!public! !
edit!operations!public! !
editorClass!accessing!public! !
model!accessing!private! !
model:!accessing!private! !
renderContentOn:!public!rendering! !
!

!UpExamplePresenter class methodsFor!

on: anUpExampleModel

	^self new
		model: anUpExampleModel;
		yourself! !

!UpExamplePresenter class categoriesForMethods!
on:!instance creation!public! !
!

