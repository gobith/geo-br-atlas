Class {
	#name : #BRProvince,
	#superclass : #Object,
	#instVars : [
		'id',
		'name',
		'level',
		'loyalty',
		'terrain',
		'owner'
	],
	#category : #'Geo-Birthright-Domain Setup'
}

{ #category : #accessing }
BRProvince >> id [

	^ id
]

{ #category : #accessing }
BRProvince >> id: anObject [

	id := anObject
]

{ #category : #accessing }
BRProvince >> level [

	^ level
]

{ #category : #accessing }
BRProvince >> level: anObject [

	level := anObject
]

{ #category : #accessing }
BRProvince >> loyalty [

	^ loyalty
]

{ #category : #accessing }
BRProvince >> loyalty: anObject [

	loyalty := anObject
]

{ #category : #accessing }
BRProvince >> name [

	^ name
]

{ #category : #accessing }
BRProvince >> name: anObject [

	name := anObject
]

{ #category : #accessing }
BRProvince >> owner [

	^ owner
]

{ #category : #accessing }
BRProvince >> owner: anObject [

	owner := anObject
]

{ #category : #accessing }
BRProvince >> terrain [

	^ terrain
]

{ #category : #accessing }
BRProvince >> terrain: anObject [

	terrain := anObject
]
