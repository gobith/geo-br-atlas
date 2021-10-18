Class {
	#name : #GeoBRXMLHolding,
	#superclass : #GeoBRXMLConvertedObject,
	#instVars : [
		'type',
		'level',
		'owner'
	],
	#category : #'Geo-Birthright-Cerilia-Converting'
}

{ #category : #accessing }
GeoBRXMLHolding >> level [

	^ level
]

{ #category : #accessing }
GeoBRXMLHolding >> level: anObject [

	level := anObject
]

{ #category : #accessing }
GeoBRXMLHolding >> owner [

	^ owner
]

{ #category : #accessing }
GeoBRXMLHolding >> owner: anObject [

	owner := anObject
]

{ #category : #accessing }
GeoBRXMLHolding >> type [

	^ type
]

{ #category : #accessing }
GeoBRXMLHolding >> type: anObject [

	type := anObject
]
