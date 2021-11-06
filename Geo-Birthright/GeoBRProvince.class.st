Class {
	#name : #GeoBRProvince,
	#superclass : #Object,
	#instVars : [
		'id',
		'areaId',
		'name',
		'level',
		'loyalty',
		'ownerships',
		'terrain',
		'owner'
	],
	#category : #'Geo-Birthright-Domain'
}

{ #category : #accessing }
GeoBRProvince class >> neoJsonMappingOn: mapping [

	mapping
		mapAccessor: #id;
		mapAccessor: #areaId;
		mapAccessor: #name;
		mapAccessor: #level;
		mapAccessor: #loyaltyString to: #loyalty;
		mapAccessor: #sourceRating;
		mapAccessor: #terrain;
		mapAccessor: #ownerId to: #owner
]

{ #category : #accessing }
GeoBRProvince >> areaId [

	^ areaId
]

{ #category : #accessing }
GeoBRProvince >> areaId: anObject [

	areaId := anObject
]

{ #category : #accessing }
GeoBRProvince >> guild [

	^ self guildHoldings sum: [ :each | each level ]
]

{ #category : #accessing }
GeoBRProvince >> guildHoldings [

	^ ownerships select: [ :ownership | ownership isGuild ]
]

{ #category : #testing }
GeoBRProvince >> hasOwner [ 
	
	^self ownership notNil
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
GeoBRProvince >> law [

	^ self lawHoldings sum: [ : each | each level ]
]

{ #category : #accessing }
GeoBRProvince >> lawHoldings [

	^ ownerships select: [ :ownership | ownership isLaw ]
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

	^loyalty typeString
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

{ #category : #accessing }
GeoBRProvince >> ownership [

	^ ownerships detect: [ :ownership | ownership isProvince ] ifNone: nil
]

{ #category : #accessing }
GeoBRProvince >> ownerships [
	^ ownerships
]

{ #category : #printing }
GeoBRProvince >> printOn: aStream [

	aStream
		nextPutAll: 'Province: ';
		nextPutAll: self name
]

{ #category : #initialization }
GeoBRProvince >> reset [

	ownerships := OrderedCollection new.
	loyalty := GeoBRLoyaltyPoor new
]

{ #category : #accessing }
GeoBRProvince >> source [

	^ self sourceHoldings sum: [ :each | each level ]
]

{ #category : #accessing }
GeoBRProvince >> sourceHoldings [

	^ ownerships select: [ :ownership | ownership isSource ]
]

{ #category : #accessing }
GeoBRProvince >> sourceRating [

	^ terrain potential - level max: 0
	
]

{ #category : #accessing }
GeoBRProvince >> temple [

	^ self templeHoldings sum: [ :each | each level ]
]

{ #category : #accessing }
GeoBRProvince >> templeHoldings [

	^ ownerships select: [ :ownership | ownership isTemple ]
]

{ #category : #accessing }
GeoBRProvince >> temples [

	^ ownerships select: [ :ownership | ownership isTemple ]
]

{ #category : #accessing }
GeoBRProvince >> terrain [

	^ terrain
]

{ #category : #accessing }
GeoBRProvince >> terrain: anObject [

	terrain := anObject
]
