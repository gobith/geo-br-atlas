Class {
	#name : #GeoBRAddRegentAction,
	#superclass : #GeoBRAction,
	#instVars : [
		'id',
		'name',
		'bloodline'
	],
	#category : #'Geo-Birthright-Actions'
}

{ #category : #accessing }
GeoBRAddRegentAction class >> typeClass [

	^GeoBRRegent
]

{ #category : #accessing }
GeoBRAddRegentAction >> bloodline [

	^ bloodline
]

{ #category : #accessing }
GeoBRAddRegentAction >> bloodline: anObject [

	bloodline := anObject
]

{ #category : #actions }
GeoBRAddRegentAction >> doActionIn: aWorld [

	| regent |
	regent := self typeClass new.
	regent id: id.
	regent name: name.
	regent bloodline: bloodline.
	aWorld regents at: regent id put: regent
]

{ #category : #accessing }
GeoBRAddRegentAction >> ensureId [

	id ifNil: [ id := UUID new asString ]
]

{ #category : #accessing }
GeoBRAddRegentAction >> id [

	^ id
]

{ #category : #accessing }
GeoBRAddRegentAction >> id: anObject [

	id := anObject
]

{ #category : #accessing }
GeoBRAddRegentAction >> name [

	^ name
]

{ #category : #accessing }
GeoBRAddRegentAction >> name: anObject [

	name := anObject
]