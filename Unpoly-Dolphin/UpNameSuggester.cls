"Filed out from Dolphin Smalltalk"!

UpComponent subclass: #UpNameSuggester
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!

UpNameSuggester guid: (GUID fromString: '{09b90122-6033-462b-9640-652b8b14f1f8}')!

UpNameSuggester comment: ''!

!UpNameSuggester categoriesForClass!Component! !

!UpNameSuggester methodsFor!

renderContentOn: html

	| random names |

	random := Random new.
	names := self class environment keys asOrderedCollection.

	html div: 
		[10 timesRepeat: 
			[| name |
			name := names at: (random next * names size) truncated + 1.
			html linkButton 
				beInfo;
				lightText;
				marginStart: 1;
				marginBottom: 2;
				callback: [self answer: name];
				with: name]]! !

!UpNameSuggester categoriesForMethods!
renderContentOn:!public! !
!

