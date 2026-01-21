"Filed out from Dolphin Smalltalk"!

WACounter subclass: #UpCounter
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!

UpCounter guid: (GUID fromString: '{989d0219-cf17-4d74-bcd7-35bf8b50c559}')!

UpCounter comment: ''!

!UpCounter categoriesForClass!Misc! !

!UpCounter methodsFor!

decrease

	self exampleWait.
	self session notification: [ :html | html alert beDanger; with: 'Counter Decreased'].
	super decrease!

increase
	self exampleWait.
	self session notification: [ :html | html alert beSuccess; with: 'Counter Increased'].

	super increase!

renderContentOn: html

	| counter |

	html row with: 
		[(html columnUnits: 12)
			textCenter;
			with: [counter := html heading beUpTarget with: count]].

	html row: 
		[(html columnUnits: 6)
			textEnd;
			with: 
				[html linkButton 
					bePrimary;
					upTarget: counter;
					upTransition: 'cross-fade';
					upPreview: 'btn-spinner';
					callback: [ self increase ];
					with: '++'].

		(html columnUnits: 6)
			textStart; 
			with: 
				[html linkButton 
					beDanger; 
					upTarget: counter;
					upTransition: 'cross-fade';
					upPreview: 'btn-spinner';
					callback: [ self decrease ];
					with: '--']]!

rendererClass

	^UpHtmlCanvas! !

!UpCounter categoriesForMethods!
decrease!actions!public! !
increase!actions!public! !
renderContentOn:!public!rendering! !
rendererClass!public!rendering! !
!

