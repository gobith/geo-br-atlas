Class {
	#name : #GeoBRWorld,
	#superclass : #Object,
	#instVars : [
		'provinces',
		'regents',
		'ownerships',
		'repository'
	],
	#category : #'Geo-Birthright-Domain'
}

{ #category : #'instance creation' }
GeoBRWorld class >> birthright [

	^ self new repository:
		  (VOMongoRepository host: 'localhost' database: 'birthright')
]

{ #category : #'instance creation' }
GeoBRWorld class >> neoJsonMappingOn: mapping [
	mapping
		mapAccessor: #provinceCollection to: #provinces;
		mapAccessor: #regents to: #regents;
		mapAccessor: #ownerships
]

{ #category : #accessing }
GeoBRWorld >> actions [

	^ (repository selectAll: GeoBRActionWrapper) collect: [ 
		  :actionWrapper | actionWrapper action ]
]

{ #category : #accessing }
GeoBRWorld >> areas [

	^ repository selectAll: GeoBRArea
]

{ #category : #accessing }
GeoBRWorld >> borders [

	^ repository selectAll: GeoBRBorder
]

{ #category : #accessing }
GeoBRWorld >> collectedRegencyPointsFor: aRegent [

	^ (self domainPowerFor: aRegent) + aRegent bloodlineModifier
]

{ #category : #actions }
GeoBRWorld >> doAction: action [

	^ action doActionIn: self
]

{ #category : #accessing }
GeoBRWorld >> domainPowerFor: aRegent [

	^ ownerships sum: [ :ownership | ownership regencyPointsFor: aRegent ]
]

{ #category : #'actions database' }
GeoBRWorld >> emptyAllData [

	repository
		removeAll: GeoBRActionWrapper;
		removeAll: GeoBRArea;
		removeAll: GeoBRBorder.
	self reset
]

{ #category : #initialization }
GeoBRWorld >> initialize [

	super initialize.
	self reset
]

{ #category : #accessing }
GeoBRWorld >> map [

	^ GeoBRMap new
		  areas: self areas;
		  borders: self borders;
		  realmBorders: self realmBorders;
		  yourself
]

{ #category : #accessing }
GeoBRWorld >> ownerships [

	^ ownerships
]

{ #category : #accessing }
GeoBRWorld >> provinceAt: provinceId [

	^provinces at: provinceId 
]

{ #category : #accessing }
GeoBRWorld >> provinceCollection [

	^provinces values asSortedCollection: [ :provA :provB | provA name <= provB name ]
]

{ #category : #accessing }
GeoBRWorld >> provinces [

	^ provinces
]

{ #category : #accessing }
GeoBRWorld >> realmBorderForOwner: aRegent provinces: collectionOfProvinces [ 
	
	| areaIds realmAreas borderIds realmBorderIds |
	borderIds := Bag new.
	areaIds := (collectionOfProvinces collect: [ : each | each areaId ]).
	realmAreas := self areas select: [ : each | areaIds includes: each id ].
	realmAreas do: [ : area | borderIds addAll: area borders ].
	realmBorderIds := OrderedCollection new.
	borderIds keysAndValuesDo: [ :value :count | count = 1 ifTrue: [ realmBorderIds add: value ] ].
	
	^GeoBRRealmBorder new owner: aRegent; borders: realmBorderIds
]

{ #category : #accessing }
GeoBRWorld >> realmBorders [

	| realmBorders |
	realmBorders := OrderedCollection new.

	((provinces select: [ :province | province hasOwner ]) partition: [ 
		 :province | province owner ]) keysAndValuesDo: [ 
		:owner 
		:provincesPerOwner | 
		realmBorders add:
			(self realmBorderForOwner: owner provinces: provincesPerOwner) ].
	^ realmBorders
]

{ #category : #accessing }
GeoBRWorld >> regentAt: regentId [

	^regents at: regentId
]

{ #category : #accessing }
GeoBRWorld >> regentCollection [

	^regents values asSortedCollection: [ :provA :provB | provA name <= provB name ]
]

{ #category : #accessing }
GeoBRWorld >> regents [

	^ regents
]

{ #category : #actions }
GeoBRWorld >> replay [

	self reset.
	self actions do: [ :action | self doAction: action ]
]

{ #category : #accessing }
GeoBRWorld >> repository [
	^ repository
]

{ #category : #initialization }
GeoBRWorld >> repository: aRepository [

	repository := aRepository 
]

{ #category : #actions }
GeoBRWorld >> reset [ 
	
	provinces := Dictionary new.
	regents := Dictionary new.
	ownerships := OrderedCollection new.
]

{ #category : #actions }
GeoBRWorld >> saveAction: anAction [

	anAction ensureId.

	repository save: anAction asActionWrapper
]

{ #category : #initialization }
GeoBRWorld >> setup [

	self replay
]

{ #category : #actions }
GeoBRWorld >> takeAction: anAction [

	self saveAction: anAction.
	self doAction: anAction.
	^anAction
]
