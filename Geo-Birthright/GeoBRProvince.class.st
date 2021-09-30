Class {
	#name : #GeoBRProvince,
	#superclass : #Object,
	#instVars : [
		'id',
		'areaId',
		'name',
		'level',
		'sourceRating',
		'loyalty',
		'ownerships',
		'terrain'
	],
	#category : #'Geo-Birthright'
}

{ #category : #accessing }
GeoBRProvince >> id [

	^ id
]

{ #category : #accessing }
GeoBRProvince >> id: anObject [

	id := anObject
]

{ #category : #initialization }
GeoBRProvince >> initialize [

	super initialize.
	self reset
]

{ #category : #accessing }
GeoBRProvince >> level [

	^ level
]

{ #category : #accessing }
GeoBRProvince >> level: anObject [

	level := anObject
]

{ #category : #accessing }
GeoBRProvince >> loyalty [

	^ loyalty
]

{ #category : #accessing }
GeoBRProvince >> loyalty: anObject [

	loyalty := anObject
]

{ #category : #accessing }
GeoBRProvince >> name [

	^ name
]

{ #category : #accessing }
GeoBRProvince >> name: anObject [

	name := anObject
]

{ #category : #accessing }
GeoBRProvince >> ownerships [
	^ ownerships
]

{ #category : #printing }
GeoBRProvince >> printOn: aStream [

	aStream nextPutAll: self name
]

{ #category : #initialization }
GeoBRProvince >> reset [

	ownerships := OrderedCollection new.
	loyalty := GeoBRLoyaltyPoor new
]
