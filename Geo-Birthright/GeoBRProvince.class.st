Class {
	#name : #GeoBRProvince,
	#superclass : #Object,
	#instVars : [
		'id',
		'name',
		'level',
		'loyalty',
		'terrain',
		'owner'
	],
	#category : #'Geo-Birthright-Domain'
}

{ #category : #accessing }
GeoBRProvince class >> neoJsonMappingOn: mapping [

	mapping
		mapAccessor: #id;
		mapAccessor: #name;
		mapAccessor: #level;
		mapAccessor: #loyaltyString to: #loyalty;
		mapAccessor: #sourceRating;
		mapAccessor: #terrain;
		mapAccessor: #ownerId to: #owner
]

{ #category : #testing }
GeoBRProvince >> hasOwner [

	^ owner notNil
]

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
GeoBRProvince >> loyaltyString [

	^ loyalty typeString
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
GeoBRProvince >> owner [
	^owner
]

{ #category : #accessing }
GeoBRProvince >> owner: anObject [

	owner := anObject
]

{ #category : #accessing }
GeoBRProvince >> ownerId [

	^ owner ifNotNil: [ owner id ]
]

{ #category : #printing }
GeoBRProvince >> printOn: aStream [

	aStream
		nextPutAll: 'Province: ';
		nextPutAll: self name
]

{ #category : #initialization }
GeoBRProvince >> reset [

	loyalty := GeoBRLoyaltyPoor new
]

{ #category : #accessing }
GeoBRProvince >> sourceRating [

	^ terrain potential - level max: 0
	
]

{ #category : #accessing }
GeoBRProvince >> terrain [

	^ terrain
]

{ #category : #accessing }
GeoBRProvince >> terrain: anObject [

	terrain := anObject
]
