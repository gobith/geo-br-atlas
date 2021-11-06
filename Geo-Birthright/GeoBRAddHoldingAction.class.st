Class {
	#name : #GeoBRAddHoldingAction,
	#superclass : #GeoBRAction,
	#instVars : [
		'id',
		'province',
		'level',
		'type'
	],
	#category : #'Geo-Birthright-Actions'
}

{ #category : #accessing }
GeoBRAddHoldingAction class >> typeClass [

	^ GeoBRHolding
]

{ #category : #actions }
GeoBRAddHoldingAction >> doActionIn: aWorld [

	| holding |
	holding := self typeClass new.
	holding id: id.
	holding province: (aWorld poolAt: province).
	holding level: level.
	holding type: type.
	aWorld holdings at: holding id put: holding.
	aWorld pool at: holding id put: holding
]

{ #category : #accessing }
GeoBRAddHoldingAction >> ensureId [

	id ifNil: [ id := UUID new asString ]
]

{ #category : #accessing }
GeoBRAddHoldingAction >> id [

	^ id
]

{ #category : #accessing }
GeoBRAddHoldingAction >> id: anObject [

	id := anObject
]

{ #category : #accessing }
GeoBRAddHoldingAction >> level [

	^ level
]

{ #category : #accessing }
GeoBRAddHoldingAction >> level: anObject [

	level := anObject
]

{ #category : #accessing }
GeoBRAddHoldingAction >> province [

	^ province
]

{ #category : #accessing }
GeoBRAddHoldingAction >> province: anObject [

	province := anObject
]

{ #category : #accessing }
GeoBRAddHoldingAction >> type [

	^ type
]

{ #category : #accessing }
GeoBRAddHoldingAction >> type: anObject [

	type := anObject
]
