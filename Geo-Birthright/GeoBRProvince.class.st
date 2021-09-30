Class {
	#name : #GeoBRProvince,
	#superclass : #Object,
	#instVars : [
		'id',
		'name',
		'level',
		'guildHolding',
		'lawHolding',
		'templeHolding',
		'sourceHolding',
		'loyalty'
	],
	#category : #'Geo-Birthright'
}

{ #category : #accessing }
GeoBRProvince >> guildHolding [

	^ guildHolding
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

	guildHolding := GeoBRGuild new.
	lawHolding := GeoBRLaw new.
	templeHolding := GeoBRTemple new.
	sourceHolding := GeoBRSource new.
	loyalty := GeoBRLoyaltyPoor new
]

{ #category : #accessing }
GeoBRProvince >> lawHolding [

	^ lawHolding
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
GeoBRProvince >> sourceHolding [

	^ sourceHolding
]

{ #category : #accessing }
GeoBRProvince >> templeHolding [

	^ templeHolding
]
