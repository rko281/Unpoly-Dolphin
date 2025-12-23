# Unpoly for Seaside
[Unpoly](https://unpoly.com/) is an unobtrusive Javascript framework for applications that render on the server. It allows your views to do things that are not normally possible in HTML.

**Unpoly for Seaside** is an add-on library for [Seaside](https://github.com/rko281/Seaside) which provides easy access to Unpoly's core features using familiar Smalltalk and Seaside code patterns.

## Getting Started
* Install [Dolphin Smalltalk 7.2](https://github.com/dolphinsmalltalk/Dolphin)

## Installation
* Download and install [GitHub Package Manager](https://github.com/rko281/GitHub)
* Evaluate:
```
GitHubPackageManager install: 'rko281/Unpoly-Dolphin'.
```
* All required packages and prerequisites (including [Seaside](https://github.com/rko281/Seaside) and [Seaside-Bootstrap5](https://github.com/rko281/Seaside-Bootstrap5)) will be downloaded and installed
* Evaluate:
```
(WAHttpServerAdaptor port: 8080) start.
ShellLibrary default shellOpen: 'http://localhost:8080/unpoly/'
```
A web browser will open on the Unpoly examples. 
 
## Examples
The examples browser demonstrates most of the wrapped behavior. Browse `UpExamplesBrowser` for further information.

<img width="1152" height="1032" alt="image" src="https://github.com/user-attachments/assets/37e07cde-a732-4a1e-8b16-083346e233fb" />
