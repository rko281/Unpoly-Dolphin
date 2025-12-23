"Filed out from Dolphin Smalltalk"!

UpDecoration subclass: #UpNotificationDecoration
	instanceVariableNames: 'div'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!

UpNotificationDecoration guid: (GUID fromString: '{1076a155-28d0-4286-8df5-e5d1bbcd0b13}')!

UpNotificationDecoration comment: ''!

!UpNotificationDecoration categoriesForClass!Base! !

!UpNotificationDecoration methodsFor!

anchorRight

	div upAnchored: 'right'!

div
	^div!

div: anObject
	div := anObject!

initialize

	super initialize.

	div := WAGenericTag tag: 'div'.
	div upFlashes: true!

renderContentOn: html

	html div 
		attributes: div attributes;
		with: self session popNotification.

	self renderNextOn: html! !

!UpNotificationDecoration categoriesForMethods!
anchorRight!initializing!public!rendering! !
div!accessing!public! !
div:!accessing!public! !
initialize!initializing!public! !
renderContentOn:!public!rendering! !
!

