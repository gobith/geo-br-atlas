Class {
	#name : #BRHolding,
	#superclass : #Object,
	#instVars : [
		'id',
		'province',
		'level',
		'type',
		'owner'
	],
	#category : #'Geo-Birthright-Domain Setup'
}

{ #category : #accessing }
BRHolding >> id [

	^ id
]

{ #category : #accessing }
BRHolding >> id: anObject [

	id := anObject
]

{ #category : #accessing }
BRHolding >> level [

	^ level
]

{ #category : #accessing }
BRHolding >> level: anObject [

	level := anObject
]

{ #category : #accessing }
BRHolding >> owner [

	^ owner
]

{ #category : #accessing }
BRHolding >> owner: anObject [

	owner := anObject
]

{ #category : #accessing }
BRHolding >> province [

	^ province
]

{ #category : #accessing }
BRHolding >> province: anObject [

	province := anObject
]

{ #category : #accessing }
BRHolding >> type [

	^ type
]

{ #category : #accessing }
BRHolding >> type: anObject [

	type := anObject
]
