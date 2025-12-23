"Filed out from Dolphin Smalltalk"!

WAInitialRenderLoopContinuation subclass: #UpInitialRenderLoopContinuation
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!

UpInitialRenderLoopContinuation guid: (GUID fromString: '{1157d99c-949d-453d-9748-9b13a95212e1}')!

UpInitialRenderLoopContinuation comment: ''!

!UpInitialRenderLoopContinuation categoriesForClass!Continuations! !

!UpInitialRenderLoopContinuation methodsFor!

basicPerformAction	| root |	root := self session properties at: #presenter ifAbsentPut: [self createRoot].	self prepareRoot: root! !

!UpInitialRenderLoopContinuation categoriesForMethods!
basicPerformAction!processing!public! !
!

