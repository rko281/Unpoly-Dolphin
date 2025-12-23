"Filed out from Dolphin Smalltalk"!

Object subclass: #UpExampleModel
	instanceVariableNames: 'id name'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!

UpExampleModel guid: (GUID fromString: '{a927326b-49b2-40c9-a6e0-227f6f896090}')!

UpExampleModel comment: ''!

!UpExampleModel categoriesForClass!Kernel-Objects! !

!UpExampleModel methodsFor!

<= anotherExampleModel

	^anotherExampleModel name <= anotherExampleModel name!

= anotherExampleModel

	^anotherExampleModel notNil and: [self id = anotherExampleModel id]!

editorClass

	^self class editorClass!

hash

	^self id hash!

id
	^id!

id: anObject
	id := anObject!

matches: aString

	^aString match: self name!

name
	^name!

name: anObject
	name := anObject!

presenterClass

	^self class presenterClass!

updateFrom: anotherCompany

	self name: anotherCompany name! !

!UpExampleModel categoriesForMethods!
<=!comparing!public! !
=!comparing!public! !
editorClass!constants!public! !
hash!comparing!public! !
id!accessing!private! !
id:!accessing!private! !
matches:!public!testing! !
name!accessing!private! !
name:!accessing!private! !
presenterClass!constants!public! !
updateFrom:!operations!public! !
!

!UpExampleModel class methodsFor!

allCompanies

	| count |

	count := 0.

	^self testData collect: 
		[ :array || projCount |
		count := count + 1.
		projCount := 0.
		self new
			id: count;
			name: array first;
			address: array second expandMacros;
			addProjects: 
				(array third collect: 
					[ :projArray |
					UpProject new
						id: (count * 1000) + (projCount := projCount + 1);
						name: projArray first;
						budget: projArray second;
						yourself]);
			yourself]!

description

	^self subclassResponsibility!

editorClass

	^self subclassResponsibility!

presenterClass

	^self subclassResponsibility!

template

	^self subclassResponsibility!

testData

	^#( 
		#('Bergstrom, Schroeder and Senger' 'Theresa Square 56<N>15598 East Broderick<N>Macedonia' #(#('Matsoft' 65000) #('Toughjoyfax' 14000) #('Zamit' 117000)))
		#('Bins-Heller' 'Breanna Corner 41<N>26123 Bridgetteshire<N>Anguilla' #(#('Domainer' 80000) #('Prodder' 19000) #('Stronghold' 680000)))
		#('Feil-Davis' 'Lawanna Center 5<N>89180 Corenetown<N>Saint Kitts and Nevis' #(#('Bytecard' 150000) #('Mat Lam Tam' 42000) #('Viva' 131000)))
		#('Heidenreich, Hahn and Stroman' 'Braun Walks 29<N>14980-2387 New Jana<N>Lithuania' #(#('Cardguard' 59000) #('Redhold' 120000) #('Y-find' 147000)))
		#('Weimann Inc' 'Gutkowski Pass 77<N>31656-1179 West Ellis<N>United States Minor Outlying Islands' #(#('It' 121000) #('Solarbreeze' 29000) #('Subin' 22000)))
	)! !

!UpExampleModel class categoriesForMethods!
allCompanies!accessing!public! !
description!accessing!public! !
editorClass!constants!public! !
presenterClass!constants!public! !
template!accessing!public! !
testData!accessing!private! !
!

