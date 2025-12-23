"Filed out from Dolphin Smalltalk"!

Object subclass: #UpExampleDatabase
	instanceVariableNames: 'companies projects'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!

UpExampleDatabase guid: (GUID fromString: '{79ffc643-f301-4c93-bd35-3bfb2303237d}')!

UpExampleDatabase comment: ''!

!UpExampleDatabase categoriesForClass!Kernel-Objects! !

!UpExampleDatabase methodsFor!

addCompany: aCompany

	aCompany id: (companies inject: 0 into: [ :max :each | max max: each id]) + 1.
	^companies add: aCompany!

addProject: aProject

	aProject id: (projects inject: 0 into: [ :max :each | max max: each id]) + 1.
	aProject company addProject: aProject.
	^projects add: aProject!

companies

	^companies!

initialize

	| count |

	companies := SortedCollection new.
	count := 0.

	self class testData do: 
		[ :array || projCount |
		count := count + 1.
		projCount := 0.
		companies add: 
			(UpCompany new
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
				yourself)].

	projects := companies inject: SortedCollection new into: [ :all :each | all addAll: each projects; yourself]!

projects

	^projects!

removeCompany: aCompany

	aCompany copy projects do: [ :each | self removeProject: each].
	^companies remove: aCompany!

removeProject: aProject

	aProject company ifNotNil: [ :company | company removeProject: aProject].
	^projects remove: aProject! !

!UpExampleDatabase categoriesForMethods!
addCompany:!add/remove!public! !
addProject:!add/remove!public! !
companies!accessing!public! !
initialize!initializing!public! !
projects!accessing!public! !
removeCompany:!add/remove!public! !
removeProject:!add/remove!public! !
!

!UpExampleDatabase class methodsFor!

new

	^super new initialize!

testData

	^#( 
		#('Bergstrom, Schroeder and Senger' 'Theresa Square 56<N>15598 East Broderick<N>Macedonia' #(#('Matsoft' 65000) #('Toughjoyfax' 14000) #('Zamit' 117000)))
		#('Bins-Heller' 'Breanna Corner 41<N>26123 Bridgetteshire<N>Anguilla' #(#('Domainer' 80000) #('Prodder' 19000) #('Stronghold' 680000)))
		#('Feil-Davis' 'Lawanna Center 5<N>89180 Corenetown<N>Saint Kitts and Nevis' #(#('Bytecard' 150000) #('Mat Lam Tam' 42000) #('Viva' 131000)))
		#('Heidenreich, Hahn and Stroman' 'Braun Walks 29<N>14980-2387 New Jana<N>Lithuania' #(#('Cardguard' 59000) #('Redhold' 120000) #('Y-find' 147000)))
		#('Weimann Inc' 'Gutkowski Pass 77<N>31656-1179 West Ellis<N>United States Minor Outlying Islands' #(#('It' 121000) #('Solarbreeze' 29000) #('Subin' 22000)))
	)! !

!UpExampleDatabase class categoriesForMethods!
new!instance creation!public! !
testData!constants!private! !
!

