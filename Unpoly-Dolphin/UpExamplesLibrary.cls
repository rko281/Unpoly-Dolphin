"Filed out from Dolphin Smalltalk"!

SSWFileLibrary subclass: #UpExamplesLibrary
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!

UpExamplesLibrary guid: (GUID fromString: '{f55ad951-61c3-4bd7-b98a-b7d1522120ad}')!

UpExamplesLibrary comment: ''!

!UpExamplesLibrary categoriesForClass!Libraries! !

!UpExamplesLibrary methodsFor!

cssunpolyexamplesCssContent

	##(Pragma css: 'css/unpoly.examples.css').

	^'
 :root {
	 --bs-font-sans-serif: ''Roboto'', sans-serif;
	 --bs-font-monospace: ''Roboto Mono'', monospace;
}
 a {
	 --bs-link-decoration: none;
}
 .navbar {
	 --bs-navbar-padding-x: 1rem;
}
.up-current {
	 color: #000;
}
 body {
	 margin: 5.5rem 1.5rem 7rem 1.5rem;
	 overflow-y: scroll;
}
.container {
  width: 100%;
  max-width: 1200px;
  margin: 0 auto;
  padding: 0 1rem;
}
 p {
	 margin-bottom: 0.8rem;
}
 b, strong, th {
	 font-weight: 500;
}
 .field_with_errors {
	 display: contents;
}
 .input-group .field_with_errors {
	 display: inline-block;
	 flex: 1 1 auto;
}
 .field_with_errors:not(form.up-active .field_with_errors) label {
	 color: #dc3545;
}
 .field_with_errors:not(form.up-active .field_with_errors) input,.field_with_errors:not(form.up-active .field_with_errors) textarea,.field_with_errors:not(form.up-active .field_with_errors) select {
	 border-color: #dc3545;
}
 .form-error:not(form.up-active .form-error) {
	 color: #dc3545;
}
 .form-group {
	 margin-bottom: 1rem;
}
 .btn {
	 text-align: center;
}
 .btn.btn-sm {
	 min-width: 50px;
}
 .btn:not(.btn-sm) {
	 min-width: 75px;
}
 up-popup {
	 z-index: 1070;
}
 up-popup.tour-hint {
	 margin: 12px;
}
 up-popup.tour-hint code {
	 white-space: nowrap;
}
 up-popup-content {
	 line-height: 1.3;
}
 up-popup-content p {
	 margin-bottom: 0.7rem;
}
 up-popup-content :not(.popup-spinner):last-child {
	 margin-bottom: 0;
}
 up-modal-box {
	 padding: 1.8rem 2rem;
}
 up-modal-content :last-child {
	 margin-bottom: 0;
}
 up-modal-content > *:last-child {
	 margin-bottom: 0;
}
 #tasks {
	 max-width: 650px;
	 margin: 0 auto;
}
 .task {
	 position: relative;
	 display: flex;
	 align-items: center;
	 gap: 1rem;
	 border: 1px solid #dee2e6;
	 padding: 0.5rem 1rem;
}
 .task:first-child {
	 border-top-left-radius: 0.375rem;
	 border-top-right-radius: 0.375rem;
}
 .task:last-child {
	 border-bottom-left-radius: 0.375rem;
	 border-bottom-right-radius: 0.375rem;
}
 .task + .task {
	 border-top: none;
}
 .task-item.-done .task-item--text {
	 text-decoration: line-through;
}
 .task-item.-done .task-item--toggle:after {
	 content: ''✔'';
	 position: absolute;
	 width: 100%;
	 height: 100%;
	 font-size: 1.2em;
	 line-height: 1.3em;
	 text-align: center;
}
 .task-item.-previewing {
	 color: #6c757d;
}
 .task-item[draggable=true] {
	 cursor: move;
}
 .task-item--toggle {
	 flex: 0 0 auto;
	 width: 1.5em;
	 height: 1.5em;
	 display: inline-block;
	 border-radius: 4em;
	 border: 1px solid #adb5bd;
	 position: relative;
}
 .task-item--text {
	 flex: 1 1 0;
	 padding: 0.375rem 0;
}
 .task-item--edit {
	 flex: 0 0 auto;
}
 .task-item.-dragging {
	 cursor: move;
	 cursor: -webkit-grabbing;
	 cursor: -moz-grabbing;
}
 .task.-dropping {
	 border-bottom-color: #0d6efd !!important;
	 border-bottom-width: 3px;
	 margin-bottom: -2px;
}
 .task-form {
	 gap: 0;
	 display: grid;
	 grid-template-columns: 1fr auto;
	 grid-template-rows: auto;
	 grid-template-areas: "input save" "error error";
	 align-items: center;
	 column-gap: 1rem;
}
 .task-form:focus {
	 outline: none !!important;
}
 .task-form--input {
	 grid-area: input;
}
 .task-form--input:focus {
	 box-shadow: none !!important;
}
 .task-form--save {
	 grid-area: save;
}
 .task-form--error {
	 margin-top: 0.25rem;
	 grid-area: error;
}
 .fragment-explainer {
	 background-color: white;
	 padding: 0.95rem 1.2rem 1rem;
	 position: fixed;
	 z-index: 2500;
	 bottom: 0;
	 left: 0;
	 width: 100vw;
	 border-top: 1px solid #adb5bd;
	 box-shadow: 0 -2px 8px rgba(0, 0, 0, 0.1);
	 display: flex;
	 gap: 0.6rem 1.7rem;
	 flex-wrap: wrap;
	 line-height: 1.35;
	 justify-content: flex-start;
	 align-items: center;
}
 .fragment-explainer--cell {
	 flex: 0 1 auto;
	 min-width: calc(min(100px, 13vw));
}
 .fragment-explainer--cell a {
	 text-decoration: underline;
}
 .fragment-explainer--label {
	 margin-bottom: 4px;
	 font-size: 0.8em;
	 font-weight: 500;
	 text-transform: uppercase;
	 color: #444;
}
 #config {
	 display: grid;
	 grid-template-columns: auto auto auto;
	 column-gap: 1em;
}
 .new-fragment {
	 position: relative;
}
 .new-fragment:after {
	 transition: all 750ms ease-out;
	 content: '''';
	 position: absolute;
	 left: 0;
	 top: 0;
	 right: 0;
	 bottom: 0;
	 background-color: rgba(255, 204, 34, 0);
	 outline: 10px solid rgba(255, 204, 34, 0);
	 z-index: 1;
}
 .new-fragment.inserted:after {
	 background-color: rgba(255, 204, 34, 0.6);
	 outline: 10px solid rgba(255, 204, 34, 0.6);
}
 .click-bubble {
	 box-sizing: border-box;
	 position: fixed;
	 border-style: solid;
	 border-color: #f29;
	 border-radius: 50%;
	 animation: click-bubble 0.3s ease-out;
	 z-index: 999999;
}
 @keyframes click-bubble {
	 0% {
		 opacity: 0.8;
		 width: 0.5em;
		 height: 0.5em;
		 margin: -0.25em;
		 border-width: 0.5em;
	}
	 100% {
		 opacity: 0.1;
		 width: 6em;
		 height: 6em;
		 margin: -3em;
		 border-width: 0.2em;
	}
}
 .tour-dot {
	 margin: 0 0.4rem;
	 display: inline-block;
	 vertical-align: middle;
	 width: 10px;
	 height: 10px;
	 border-radius: 50%;
	 background: #0f0;
	 cursor: pointer;
	 box-shadow: 0 0 0 4px rgba(0, 255, 0, 0.3);
	 font-size: 0;
}
 .tour-dot:hover {
	 animation: none;
}
 .tour-dot[overlay-only] {
	 display: none;
}
 up-modal .tour-dot[overlay-only], up-drawer .tour-dot[overlay-only] {
	 display: inline-block;
}
 .tour-dot.viewed {
	 animation: none;
	 filter: grayscale(100%);
	 opacity: 0.6;
}
 #new-version {
	 position: fixed;
	 top: 0.75rem;
	 right: 1rem;
	 z-index: 1050;
}
 [up-flashes], .flashes-explainer {
	 position: fixed;
	 top: 0.4rem;
	 right: 1rem;
	 z-index: 1050;
}
 [up-flashes] .alert, .flashes-explainer .alert {
	 padding: 0.5rem 0.7rem;
	 margin: 0;
}
 .flashes-explainer {
	 padding: 0.5rem 0.7rem;
	 border: 1px solid rgba(0, 0, 0, 0.1);
	 color: #666;
	 border-radius: 0.25rem;
}
 #new-version:not([hidden]) + .flashes-explainer {
	 display: none;
}
 .placeholder {
	 opacity: 0.1;
	 border-radius: 15px;
}
 .btn-spinner {
	 display: inline-block;
	 vertical-align: middle;
	 width: 1em;
	 aspect-ratio: 1;
	 position: relative;
	 margin-top: -0.15em;
}
 .btn-spinner:after {
	 content: '''';
	 position: absolute;
	 left: 0;
	 top: 0;
	 right: 0;
	 bottom: 0;
	 border: 2px solid rgba(255, 255, 255, 1.0);
	 border-bottom-color: rgba(255, 255, 255, 0.2);
	 border-radius: 50%;
	 box-sizing: border-box;
	 animation: rotation 1s linear infinite;
	 opacity: inherit;
}
 .btn:has(.btn-spinner) {
	 text-align: center;
}
 .popup-spinner {
	 display: inline-block;
	 vertical-align: middle;
	 width: 2.5rem;
	 aspect-ratio: 1;
	 position: relative;
	 margin: 0.5rem 3rem 6rem 0.5rem;
}
 .popup-spinner:after {
	 content: '''';
	 position: absolute;
	 left: 0;
	 top: 0;
	 right: 0;
	 bottom: 0;
	 border: 2px solid rgba(13, 202, 240, 1.0);
	 border-bottom-color: rgba(13, 202, 240, 0.2);
	 border-radius: 50%;
	 box-sizing: border-box;
	 animation: rotation 1s linear infinite;
	 opacity: inherit;
}
 .main-spinner {
	 display: inline-block;
	 vertical-align: middle;
	 width: 6rem;
	 aspect-ratio: 1;
	 position: relative;
	 position: absolute;
	 top: 50%;
	 left: 50%;
	 transform: translate(-50%, -50%);
}
 .main-spinner:after {
	 content: '''';
	 position: absolute;
	 left: 0;
	 top: 0;
	 right: 0;
	 bottom: 0;
	 border: 3px solid rgba(13, 202, 240, 1.0);
	 border-bottom-color: rgba(13, 202, 240, 0.2);
	 border-radius: 50%;
	 box-sizing: border-box;
	 animation: rotation 1s linear infinite;
	 opacity: inherit;
	 transition: opacity 0.3s ease-in;
	 opacity: 1;
}
 @starting-style {
    .main-spinner:after {
        opacity: 0.1
    }
}

 main:has(>.main-spinner) {
    position: relative;
    opacity: 1;
    filter: grayscale(0%)
}

 main:has(>.main-spinner)>*:not(.main-spinner) {
    transition: opacity 0.3s ease-out, filter 0.3s ease-out;
    opacity: 0.4;
    filter: grayscale(100%)
}
 .placeholder-wave {
	 transition: opacity 0.2s ease-in;
	 opacity: 1;
}
 @starting-style {
	 opacity: 0.5;
}
 @keyframes rotation {
	 0% {
		 transform: rotate(0deg);
	}
	 100% {
		 transform: rotate(360deg);
	}
}
 input[type=search].up-active {
	 background-image: repeating-linear-gradient(-45deg, transparent, transparent 1rem, rgba(200, 230, 255, 0.3) 1rem, rgba(200, 230, 255, 0.3) 2rem);
	 background-size: 2000% 2000%;
	 animation: barberpole 200s linear infinite;
}
 @keyframes barberpole {
	 100% {
		 background-position: -1000% 1000%;
	}
}
 '!

jsunpolyexamplesJsContent

	##(Pragma javascript: 'js/unpoly.examples.js').

	^
'// Unpoly //////////////////////////////////////////////////////////////////////////////////////////////////////////////

//= require unpoly
//= require unpoly-bootstrap5

// Accelerate all links so the demo feels snappy.
// We still assign out [up-follow] manually so there''s less magic for demo viewers.
up.link.config.instantSelectors.unshift(''a[href]'')
up.link.config.preloadSelectors.unshift(''a[href]'')

// We use a .form-group to contain each (label, input, error, help) tuple.
// Unpoly can use this to only update the affected a group when validating.
up.form.config.groupSelectors.unshift(''.form-group'')

// Since we''re rendering instant loading state for all interactions in the demo,
// wait longer until we show the progress bar.
up.network.config.lateTime = 1250

// Enable more logging for curious users.
up.log.enable()


// Tour /////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// Gray out tour dots once clicked.
up.on(''up:link:follow'', ''.tour-dot'', (event, element) => { element.classList.add(''viewed'') })


// Fragment explainer //////////////////////////////////////////////////////////////////////////////////////////////////

up.compiler(''.fragment-explainer'', function(container) {
  let lastFragment = document.documentElement

  let targetExplainer = container.querySelector(''.fragment-explainer--target'')
  let revealTarget = container.querySelector(''.fragment-explainer--reveal'')
  let requestExplainer = container.querySelector(''.fragment-explainer--request'')
  let rttExplainer = container.querySelector(''.fragment-explainer--rtt'')

  return [
    up.on(''up:fragment:inserted'', (_event, fragment) => {
      if (fragment.matches(''[up-hungry]'')) return
      if (fragment.querySelector(''.placeholder'')) return
      if (fragment.matches(''up-modal, up-modal main, up-drawer, up-drawer main, up-popup, up-popup main'')) fragment = up.layer.current.getBoxElement()
      lastFragment = fragment
      targetExplainer.innerText = up.fragment.toTarget(fragment, { verify: false })
      if (config.showFragments.checked) showInsertedFlash(lastFragment)
    }),

    up.on(revealTarget, ''click'', (event) => {
      up.event.halt(event)
      showInsertedFlash(lastFragment)
    }),

    up.on(''up:link:follow up:form:submit'', ({ renderOptions }) => {
      let method = up.util.normalizeMethod(renderOptions.method)
      requestExplainer.innerText = `${method} ${renderOptions.url}`
    }),

    up.on(''up:fragment:loaded'', ({ request, response, revalidating }) => {
      if (revalidating) return

      let rtt = Math.max(response.loadedAt - request.builtAt, 0)
      let info = `${rtt} ms`
      if (request.fromCache) {
        info += '' <span class="text-muted">(cache)</span>''
      }
      rttExplainer.innerHTML = info
    })
  ]
})

up.compiler(''form#config'', function(form) {
  return [
    up.on(''up:link:follow up:form:submit'', function(event) {
      if (form.disableCache.checked) {
        event.renderOptions.cache = false
      }
      if (form.noPreviews.checked) {
        Object.assign(event.renderOptions, up.RenderOptions.NO_PREVIEWS)
      }
      if (form.noMotion.checked) {
        Object.assign(event.renderOptions, up.RenderOptions.NO_MOTION)
      }
    }),

    up.on(''up:link:preload'', (event) => {
      if (form.disableCache.checked) {
        event.preventDefault()
      }
    }),

    up.on(''up:request:load'', ({ request }) => {
      if (form.extraLatency.checked) {
        request.headers[''X-Extra-Latency''] = ''true''
      }
    }),

    up.on(''up:click'', { capture: true }, (event) => {
      if (form.showClicks.checked) {
        let style = {
          top: event.clientY + "px",
          left: event.clientX + "px"
        }
        let bubble = up.element.affix(document.body, ''.click-bubble'', { style })
        bubble.addEventListener(''animationend'', () => bubble.remove());
      }
    })
  ]
})

function showInsertedFlash(fragment) {
  fragment = up.fragment.get(fragment)
  fragment.classList.add(''new-fragment'', ''inserted'')
  up.util.timer(0, () => fragment.classList.remove(''inserted''))
  up.util.timer(750, () => fragment.classList.remove(''new-fragment''))
}


// Notifications ///////////////////////////////////////////////////////////////////////////////////////////////////////

// Prompt user to reload when frontend assets changeds on the server.
up.on(''up:assets:changed'', function() {
  up.element.show(document.querySelector(''#new-version''))
})

// Remove notification flashes after a few seconds.
up.compiler(''.alert'', function(alert) {
  up.util.timer(4000, () => up.destroy(alert, { animation: ''move-to-top'' }))
})


// Loading state ///////////////////////////////////////////////////////////////////////////////////////////////////////

function findButton(origin) {
  if (origin.matches(''.btn'')) {
    return origin
  } else {
    let form = origin.closest(''form'')
    return up.form.submitButtons(form)[0]
  }
}

// Show a spinning wheel inside the button.
up.preview(''btn-spinner'', function(preview) {
  let button = findButton(preview.origin)
  // Keep the button dimensions while we''re hiding its content.
  preview.setStyle(button, { height: button.offsetHeight + ''px'', width: button.offsetWidth + ''px'' })
  preview.swapContent(button, ''<span class="btn-spinner"></span>'')
})

// Show a spinning wheel inside a loading popup overlay
up.preview(''popup-spinner'', function(preview) {
  preview.showPlaceholder(''<div class="popup-spinner"></div>'')
})

// Show a spinning wheel inside a loading main element
up.preview(''main-spinner'', function(preview) {
  let main = up.fragment.closest(preview.fragment, '':main'')
  preview.insert(main, ''afterbegin'', ''<div class="main-spinner"></div>'')
})

// Shorten placeholder table to the maximum number of rows given
up.compiler(''.placeholder-wave'', function(placeholder, { rows = 15 }) {
  let trs = placeholder.querySelectorAll(''tr'')
  for (let i = 0; i < trs.length - rows; i++) {
    trs[i].remove()
  }
})


// Templates with simple {{variable}} substitution /////////////////////////////////////////////////////////////////////

up.on(''up:template:clone'', ''[type="text/minimustache"]'', function(event) {
  let template = event.target.innerHTML
  let filled = template.replace(/{{(\w+)}}/g, (_match, variable) => up.util.escapeHTML(event.data[variable]))
  event.nodes = up.element.createNodesFromHTML(filled)
})


// Tasks ///////////////////////////////////////////////////////////////////////////////////////////////////////////////

// Setting a `-done` class will line-through the task text.
up.preview(''finish-task'', function(preview) {
  preview.addClass(''-done'')
})

// Removing a `-done` class will remove the line-through decoration from the task text.
up.preview(''unfinish-task'', function(preview) {
  preview.removeClass(''-done'')
})

up.preview(''add-task'', function(preview) {
  let form = preview.origin.closest(''form'')
  let text = preview.params.get(''task[text]'')
  let newItem = up.template.clone(''#task-preview'', { text })
  preview.insert(form, ''afterend'', newItem)
  form.reset()
})

up.preview(''clear-tasks'', function(preview) {
  let doneTasks = up.fragment.all(''.task.-done'')
  for (let doneTask of doneTasks) {
    preview.hide(doneTask)
  }
})

up.compiler(''#tasks'', function(container) {
  let draggingItem

  up.on(container, ''dragstart'', ''.task-item'', function(event, item) {
    draggingItem = item
    item.classList.add(''-dragging'')
  })

  up.on(container, ''dragover'', ''.task'', function(event, item) {
    event.preventDefault() // prime drop event
    item.classList.add(''-dropping'')
  })

  up.on(container, ''dragleave'', ''.task'', function(event, item) {
    item.classList.remove(''-dropping'')
  })

  up.on(container, ''drop'', ''.task'', function(event, dropItem) {
    if (!!draggingItem) return
    event.preventDefault()

    draggingItem.classList.remove(''-dragging'')
    dropItem.classList.remove(''-dropping'')

    if (draggingItem !!== dropItem) {
      up.render({
        target: ''#tasks'',
        method: ''patch'',
        url: `/tasks/${draggingItem.dataset.id}/move`,
        params: { reference: dropItem.dataset.id },
        fallback: true,
        preview: (preview) => preview.insert(dropItem, ''afterend'', draggingItem)
      })
    }
  })

})
'!

logosupPngContent

	##(Pragma favIcon: 'logos/up.png').

	^#[137 80 78 71 13 10 26 10 0 0 0 13 73 72 68 82 0 0 0 96 0 0 0 96 8 6 0 0 0 226 152 119 56 0 0 0 4 115 66 73 84 8 8 8 8 124 8 100 136 0 0 0 9 112 72 89 115 0 0 30 141 0 0 30 141 1 231 63 158 77 0 0 0 25 116 69 88 116 83 111 102 116 119 97 114 101 0 119 119 119 46 105 110 107 115 99 97 112 101 46 111 114 103 155 238 60 26 0 0 13 131 73 68 65 84 120 156 237 157 123 116 84 213 185 192 127 251 204 228 161 73 8 68 32 176 172 40 20 73 194 60 18 12 40 92 44 164 20 189 181 4 42 20 4 11 171 146 160 86 203 75 189 37 176 170 214 222 222 218 154 128 173 128 74 145 234 213 42 96 120 93 158 226 189 164 148 80 124 92 92 88 50 39 9 9 23 33 75 116 65 18 130 72 48 36 147 153 179 239 31 9 24 200 132 156 153 57 51 7 152 252 214 98 77 206 57 123 127 223 55 231 227 236 111 159 61 223 222 91 112 149 146 153 153 153 216 216 232 29 36 132 76 1 153 138 16 131 64 222 2 196 181 254 235 209 250 9 240 13 240 85 235 231 55 32 142 35 229 97 16 21 82 138 202 216 88 203 225 3 7 14 124 109 206 55 185 50 194 108 3 46 96 179 217 226 21 69 25 174 161 140 21 200 177 192 16 64 49 80 197 81 137 40 82 208 138 128 34 85 85 191 50 80 118 192 152 234 128 140 140 140 238 94 175 247 1 13 49 67 192 191 0 150 48 169 246 2 31 72 228 59 81 22 203 250 131 7 15 158 9 147 222 118 152 225 0 197 110 207 184 15 225 253 25 136 9 64 172 9 54 180 165 17 228 86 1 111 169 170 250 62 160 133 83 121 56 29 160 216 156 206 113 66 242 27 224 142 48 234 213 141 128 50 77 80 208 43 41 105 205 158 61 123 60 97 210 25 90 178 178 178 172 181 167 79 207 20 146 69 192 119 67 173 207 24 196 17 164 124 161 103 207 164 183 66 237 136 144 58 192 110 183 15 69 40 43 128 161 161 212 19 58 68 137 212 196 236 178 178 131 31 132 76 67 40 132 218 108 182 36 97 177 60 135 100 14 198 246 100 204 64 34 120 71 129 95 186 92 174 26 163 133 27 238 0 135 195 113 191 68 188 14 36 25 45 219 100 234 4 114 150 170 170 91 140 20 106 88 183 47 43 43 203 26 151 144 248 123 96 25 112 163 81 114 175 34 110 4 49 181 119 159 228 164 94 61 123 238 174 173 173 245 26 33 212 144 39 192 233 116 246 215 164 44 4 49 204 8 121 87 61 146 253 86 171 50 245 224 193 131 85 193 138 10 218 1 173 129 246 61 160 87 176 178 174 49 78 11 100 182 170 170 31 5 35 36 168 0 105 115 58 199 32 148 221 68 222 205 7 72 146 136 93 54 167 243 135 193 8 9 56 6 216 237 233 147 4 108 226 250 108 239 245 18 45 224 129 94 125 146 63 171 173 174 46 13 68 64 64 14 176 57 157 15 10 120 23 136 10 164 254 117 134 69 192 196 94 125 146 15 7 226 4 191 99 128 211 233 252 129 38 217 1 196 248 91 247 58 167 89 42 98 124 89 73 201 127 251 83 201 47 7 216 108 25 195 132 162 237 6 226 253 50 45 114 104 16 200 177 254 4 102 221 14 112 58 157 253 53 141 253 8 122 6 102 91 196 80 107 181 40 119 234 237 162 234 234 5 101 102 102 70 105 146 213 93 55 95 23 189 60 94 239 58 155 205 22 173 167 176 46 7 52 53 53 47 6 70 4 101 86 68 33 134 161 40 127 208 85 178 179 2 118 123 122 54 66 110 213 83 182 139 75 144 2 57 73 85 213 205 87 42 116 197 155 58 100 200 144 94 205 30 111 5 157 12 172 141 25 51 134 116 167 195 231 181 181 239 22 114 242 228 201 206 140 189 42 233 211 167 15 15 78 155 234 243 90 137 75 101 247 238 221 157 137 168 115 71 71 165 30 62 112 224 84 71 5 172 87 170 221 236 241 228 131 232 116 84 115 196 136 225 76 155 234 219 208 162 162 191 93 179 14 232 213 179 39 185 185 185 62 175 189 91 88 168 199 1 55 69 55 53 255 1 120 164 163 2 29 198 0 155 45 99 36 136 153 58 236 236 226 74 8 114 29 14 71 135 241 211 167 3 178 178 178 172 66 145 175 208 213 238 27 129 34 17 43 179 178 178 124 182 54 62 29 80 91 87 151 3 50 61 180 118 69 20 142 83 167 190 250 153 175 11 237 28 48 101 202 20 139 144 98 65 232 109 138 48 132 252 149 175 167 160 221 137 138 138 138 105 8 113 123 120 172 10 31 99 199 254 128 238 221 123 180 191 32 37 27 54 110 12 135 9 223 173 61 125 122 10 176 182 237 201 203 29 32 36 98 81 56 172 9 55 143 62 242 8 105 105 105 237 206 107 154 22 46 7 32 164 124 6 40 164 77 242 215 37 77 144 221 158 241 35 192 30 22 107 34 18 49 216 225 112 252 107 219 51 151 198 0 33 31 10 171 61 17 136 148 226 146 96 124 209 1 153 153 153 137 32 179 195 111 82 132 33 184 63 35 35 163 251 133 195 139 14 112 187 61 211 128 27 76 49 42 178 136 245 120 180 159 92 56 184 232 0 13 57 221 28 123 34 16 33 103 92 248 83 129 150 230 167 53 63 191 139 176 32 238 30 56 240 174 110 208 218 13 109 108 110 30 45 194 55 57 34 40 122 247 238 205 128 1 3 124 94 59 122 244 40 53 53 134 167 111 134 2 107 108 108 211 247 128 29 86 0 69 242 125 105 178 69 122 25 53 106 20 207 253 250 89 159 215 254 253 183 255 193 134 13 27 194 108 81 128 40 218 247 129 29 10 128 132 49 38 155 19 113 8 217 114 207 149 150 238 39 190 127 77 233 34 100 72 72 79 73 73 73 80 26 61 158 20 186 134 157 205 64 137 142 142 30 164 8 47 41 102 91 18 193 164 40 32 187 28 96 18 26 164 40 66 116 61 1 102 33 132 72 81 36 220 108 182 33 17 204 119 172 2 186 153 245 14 240 196 252 249 8 31 225 191 186 166 134 53 107 214 182 191 112 189 33 73 176 74 65 60 38 121 32 39 103 38 138 210 254 103 233 67 135 14 69 134 3 32 65 65 146 96 182 21 17 139 36 65 161 43 213 220 60 68 139 3 186 48 17 5 56 103 182 17 17 139 164 94 65 80 111 182 29 17 139 160 94 17 178 235 9 48 145 122 69 194 89 179 173 136 88 4 245 138 128 47 205 182 35 130 249 66 145 146 74 179 173 136 84 164 148 149 10 136 46 7 152 132 2 149 138 180 116 61 1 38 82 169 52 125 19 91 1 230 140 6 157 59 103 126 7 204 68 27 52 183 219 125 88 57 114 228 127 207 2 170 25 22 252 104 92 54 171 87 175 193 235 53 100 237 35 191 208 52 141 109 219 182 51 225 199 247 135 93 55 128 128 146 202 202 202 122 165 245 160 211 217 102 161 224 235 175 191 230 133 252 124 38 78 250 9 251 246 237 11 155 222 253 251 63 225 129 169 211 248 213 211 79 83 87 87 23 54 189 109 145 130 191 65 107 102 156 38 248 187 41 86 180 114 236 216 49 30 255 197 108 230 206 157 199 241 227 199 67 166 231 196 137 19 60 253 244 51 204 122 248 97 42 43 205 13 125 66 202 191 67 107 102 92 108 84 84 113 147 187 217 75 8 178 227 110 186 233 38 221 101 247 20 23 243 225 71 31 49 122 212 40 163 205 96 213 170 191 80 188 119 47 110 183 91 119 29 127 108 247 19 207 249 243 55 238 131 214 39 160 117 101 241 144 172 141 185 116 233 75 252 254 249 231 73 74 210 183 136 162 219 237 102 87 81 145 225 118 236 42 42 210 125 243 19 19 19 89 180 112 33 47 189 244 39 195 237 0 64 240 143 214 216 251 109 118 180 64 174 14 133 46 69 81 24 63 62 155 237 219 182 146 155 155 75 116 180 174 53 44 76 193 106 181 50 121 242 100 182 109 219 202 244 233 63 197 98 9 81 186 172 38 222 185 240 231 69 7 68 71 71 23 2 231 67 163 17 18 18 18 120 242 137 249 108 218 184 129 123 239 189 55 84 106 2 102 248 240 225 172 95 87 200 115 191 126 150 30 221 187 119 94 33 112 26 173 86 177 233 194 193 69 7 180 52 67 114 91 32 18 119 238 124 159 170 170 42 93 101 111 189 245 86 94 92 178 152 21 43 94 237 48 203 249 74 28 255 252 115 26 26 26 218 157 111 104 104 224 248 231 159 251 45 111 192 128 1 172 88 241 42 171 94 91 201 192 129 3 117 213 169 170 170 98 231 206 247 253 214 5 128 100 115 219 229 242 47 121 198 146 147 147 27 64 248 61 81 227 196 137 19 172 95 191 129 234 234 26 210 211 211 185 33 182 243 21 233 251 245 235 199 3 83 166 144 156 220 27 151 75 165 177 177 81 151 174 47 191 252 146 45 91 182 16 23 23 71 106 106 42 0 187 118 237 98 222 252 39 168 240 163 103 211 173 91 55 126 241 248 99 60 255 187 223 209 255 182 219 116 213 169 175 175 231 213 21 127 230 153 103 158 229 139 47 190 208 173 171 45 66 200 188 154 154 154 35 23 143 47 191 110 119 56 93 4 49 83 50 49 49 145 199 31 123 140 105 211 166 234 110 67 207 158 61 203 235 111 252 39 111 191 253 54 205 205 205 186 117 217 237 54 0 74 75 203 116 215 177 88 44 76 156 56 145 121 115 231 208 163 135 143 121 195 62 208 52 141 29 59 222 99 201 139 47 114 250 244 105 221 186 218 35 203 75 85 213 65 155 105 170 237 178 114 28 14 199 116 201 183 65 34 80 250 247 239 79 94 222 2 238 30 57 82 119 157 170 170 42 22 47 89 194 222 189 255 8 86 189 79 238 186 235 46 22 230 45 224 246 219 245 207 67 223 191 255 19 10 22 47 54 228 189 65 10 30 44 115 185 222 109 123 174 157 3 166 76 153 98 57 116 168 242 16 2 67 102 203 103 141 30 77 94 222 2 110 185 229 22 221 117 62 254 248 99 242 243 11 56 242 217 103 70 152 192 173 253 250 49 111 222 92 191 130 255 201 147 39 89 190 252 101 182 110 11 40 44 250 64 28 73 75 29 148 186 126 253 250 75 198 93 124 166 165 219 237 206 89 8 254 98 144 102 172 86 43 211 166 78 101 246 236 217 196 199 199 117 94 1 240 120 60 108 222 188 153 101 203 150 243 213 153 192 182 120 73 72 72 224 225 89 185 204 152 49 67 119 247 247 252 249 243 188 249 230 91 188 254 198 27 52 53 53 5 164 215 23 2 153 163 170 234 155 151 159 247 217 72 143 30 61 202 117 170 174 110 2 208 199 8 229 154 166 225 82 85 54 109 220 72 116 116 12 118 187 13 225 43 39 177 13 138 162 48 120 240 96 38 77 154 132 219 237 166 172 188 28 41 245 13 218 42 138 194 248 236 108 150 47 91 202 200 145 35 117 197 34 41 37 219 183 239 96 206 220 121 20 239 221 107 244 0 225 167 105 169 169 115 203 203 203 219 125 129 14 239 130 45 61 253 78 161 201 143 8 193 6 12 105 105 105 44 90 152 199 29 119 232 223 74 230 216 177 99 20 44 94 210 233 160 221 157 119 14 35 111 193 2 82 82 244 39 125 171 165 165 228 231 23 80 82 82 162 187 142 31 104 2 121 119 71 107 137 94 241 191 161 221 225 120 29 132 239 53 187 12 32 107 244 104 22 45 90 200 205 55 235 79 208 46 46 222 75 126 65 65 187 65 187 190 125 251 50 119 206 28 198 143 215 63 217 191 166 166 134 165 75 151 177 109 251 118 221 79 151 191 8 88 165 170 174 71 175 112 189 99 6 101 102 246 140 118 55 87 0 33 27 149 138 137 137 97 250 244 233 60 250 200 195 196 197 233 143 15 133 133 235 120 249 149 87 240 122 189 228 204 156 73 110 110 14 49 49 250 86 83 110 108 108 100 205 154 53 172 124 109 149 207 151 58 195 144 156 242 120 220 169 21 21 21 29 142 121 235 88 182 50 99 28 66 219 166 167 108 48 36 39 39 243 212 147 79 112 223 125 247 117 26 31 46 112 97 44 95 239 168 165 148 146 157 59 119 242 199 63 189 68 117 117 117 192 182 234 68 10 228 196 206 182 60 209 245 77 109 142 244 63 10 228 147 198 216 117 101 236 118 27 11 243 242 200 200 200 48 84 110 121 121 57 249 249 5 124 250 207 127 26 42 183 67 4 75 74 93 174 78 87 30 211 229 128 204 204 204 168 38 119 115 49 97 90 61 87 8 193 61 247 220 195 47 255 237 41 250 246 237 27 148 172 218 218 83 188 186 98 5 155 54 109 66 211 194 180 73 158 100 191 148 222 239 149 149 149 117 58 254 173 187 89 201 200 200 184 205 227 213 246 19 198 221 50 98 99 99 201 205 201 241 171 125 191 64 115 115 51 235 214 173 231 229 87 94 230 220 185 111 66 100 161 79 106 164 230 29 86 86 86 166 107 100 208 175 118 189 117 191 152 221 16 222 73 29 201 201 201 204 159 55 143 236 236 113 186 226 67 113 241 94 94 200 207 15 120 192 44 8 234 21 65 150 203 229 250 84 111 5 191 3 171 205 233 28 35 36 239 97 194 6 14 67 135 14 101 97 94 30 169 169 190 251 248 71 143 30 165 160 96 49 31 124 248 97 152 45 3 192 141 20 227 75 75 75 254 199 159 74 1 245 108 108 78 231 52 33 89 141 9 187 228 41 138 66 246 184 113 60 245 212 147 23 123 63 103 206 156 97 229 202 215 88 179 118 109 248 218 249 75 209 144 226 167 165 165 37 133 254 86 12 184 107 105 183 167 79 66 200 213 152 180 29 109 124 124 60 143 253 252 231 0 252 121 229 74 51 19 172 220 82 240 208 229 163 156 122 9 170 111 223 210 28 201 255 2 209 45 24 57 215 48 231 164 34 38 251 187 111 76 91 130 126 185 114 56 28 153 18 241 30 208 59 88 89 215 24 213 2 57 78 85 213 3 193 8 9 186 13 87 85 245 0 82 27 10 194 148 200 103 14 242 19 69 48 34 216 155 15 6 37 98 213 212 212 156 29 60 56 237 175 13 141 231 37 48 138 235 119 249 27 137 96 185 212 180 7 75 75 75 13 201 105 52 252 70 217 156 206 9 66 242 6 33 28 192 51 5 201 41 169 144 91 230 114 25 245 19 25 16 130 84 196 218 234 234 202 228 228 222 171 16 226 6 96 24 215 254 211 32 17 188 19 101 181 252 216 85 82 98 248 64 82 72 111 78 75 128 102 197 53 187 205 173 224 32 154 54 187 180 180 52 100 241 45 164 47 82 170 170 30 72 75 77 29 129 20 179 144 252 95 40 117 25 137 132 195 2 153 147 150 146 50 52 148 55 31 194 219 60 40 54 167 115 156 144 252 6 208 255 91 100 120 41 149 130 197 189 146 146 214 236 217 179 199 19 14 133 102 180 207 194 225 112 252 80 10 241 16 146 9 152 191 94 245 121 36 91 132 144 127 85 85 245 125 194 60 93 203 212 0 153 153 153 153 216 212 212 60 185 101 45 101 113 55 157 108 171 101 32 30 144 251 144 202 219 49 49 214 141 173 233 249 166 112 213 244 80 156 78 103 156 148 114 132 134 50 86 32 199 2 67 48 54 70 29 149 136 34 5 173 200 98 177 236 106 155 32 107 38 87 141 3 46 39 37 37 37 33 42 42 42 69 8 49 72 131 84 1 41 160 124 7 100 60 45 107 28 117 231 219 181 142 206 1 103 90 62 197 57 132 60 46 165 60 172 64 5 80 233 118 187 15 87 86 86 94 149 139 146 252 63 137 48 138 61 135 211 13 12 0 0 0 0 73 69 78 68 174 66 96 130 ]! !

!UpExamplesLibrary categoriesForMethods!
cssunpolyexamplesCssContent!public! !
jsunpolyexamplesJsContent!public! !
logosupPngContent!public! !
!

