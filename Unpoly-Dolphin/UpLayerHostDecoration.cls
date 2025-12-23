"Filed out from Dolphin Smalltalk"!

UpDecoration subclass: #UpLayerHostDecoration
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!

UpLayerHostDecoration guid: (GUID fromString: '{6ffc61e7-ab73-41ef-89e4-e9a5ab3d7d42}')!

UpLayerHostDecoration comment: ''!

!UpLayerHostDecoration categoriesForClass!Base! !

!UpLayerHostDecoration methodsFor!

renderContentOn: html

	self 
		renderLayerOpenedFunctionOn: html;
		renderLayerClosedFunctionOn: html;
		renderLayerCancelledFunctionOn: html;
		renderNextOn: html.!

renderLayerCancelledFunctionOn: html

	| function script |

	function := JSFunction named: 'upLayerCancelled' arguments: #('id').

	script := html javascript.
	script 
		fetchCallback: [ :string | self session onLayerClosed: (UpEvent fromResponseString: string)]
		then: '(response => response.text()).then(toReload => {if (toReload !!== '''') {up.reload(toReload)}})'
		values: {html javascript alias: '[''type'',''cancelled'',''layerID'',id]'}
		method: 'POST'.
	
	function add: script.
	html script: function!

renderLayerClosedFunctionOn: html

	| function script |

	function := JSFunction named: 'upLayerClosed' arguments: #('event').

	script := html javascript.
	script 
		fetchCallback: [ :string | self session onLayerClosed: (UpEvent fromResponseString: string)]
		then: '(response => response.text()).then(toReload => {if (toReload !!== '''') {up.reload(toReload)}})'
		values: {html javascript alias: '([''type'',event.type].concat(Object.entries(event.layer.context))).concat(typeof event.value === "string" ? (["value",event.value]) : (Object.entries(event.value)))'}
		method: 'POST'.
	
	function add: script.
	html script: function!

renderLayerOpenedFunctionOn: html

	| function script |

	function := JSFunction named: 'upLayerOpened' arguments: #('event').

	script := html javascript.
	script 
		fetchCallback: [ :string | self session onLayerOpened: (UpEvent fromResponseString: string)]
		then: '(response => response.text()).then(layerId => {up.layer.current.id = layerId})'
		values: {html javascript alias: '[''type'',event.type].concat(Object.entries(event.layer.context))'}
		method: 'POST'.		
	
	function add: script.
	html script: function! !

!UpLayerHostDecoration categoriesForMethods!
renderContentOn:!public!rendering! !
renderLayerCancelledFunctionOn:!private!rendering! !
renderLayerClosedFunctionOn:!private!rendering! !
renderLayerOpenedFunctionOn:!private!rendering! !
!

