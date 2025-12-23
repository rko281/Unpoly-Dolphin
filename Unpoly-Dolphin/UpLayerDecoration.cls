"Filed out from Dolphin Smalltalk"!

UpDecoration subclass: #UpLayerDecoration
	instanceVariableNames: 'layer'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!

UpLayerDecoration guid: (GUID fromString: '{69f9d8aa-125e-4e7f-92fa-3b43c2689f57}')!

UpLayerDecoration comment: ''!

!UpLayerDecoration categoriesForClass!Base! !

!UpLayerDecoration methodsFor!

layer
	^layer!

layer: anObject
	layer := anObject!

renderContentOn: html

	"Each layer should have an up-main"

	html upMain: [self renderNextOn: html]!

upLayerDecoration

	^self! !

!UpLayerDecoration categoriesForMethods!
layer!accessing!private! !
layer:!accessing!private! !
renderContentOn:!public!rendering! !
upLayerDecoration!accessing!public! !
!

