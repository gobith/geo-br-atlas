Class {
	#name : #GeoBRWorld,
	#superclass : #Object,
	#instVars : [
		'provinces',
		'regents',
		'domains',
		'holdings',
		'pool',
		'repository'
	],
	#category : #'Geo-Birthright-Domain'
}

{ #category : #'instance creation' }
GeoBRWorld class >> neoJsonMappingOn: mapping [
	mapping
		mapAccessor: #regentCollection to: #regents;
		mapAccessor: #domainCollection to: #domains;
		mapAccessor: #provinceCollection to: #provinces;
		mapAccessor: #holdingCollection to: #holdings
		
]

{ #category : #accessing }
GeoBRWorld >> actions [

	^ (repository selectAll: GeoBRActionWrapper) collect: [ 
		  :actionWrapper | actionWrapper action ]
]

{ #category : #accessing }
GeoBRWorld >> borders [

	^ repository selectAll: GeoBRBorder
]

{ #category : #actions }
GeoBRWorld >> doAction: action [

	^ action doActionIn: self
]

{ #category : #accessing }
GeoBRWorld >> domainCollection [

	^ domains values asSortedCollection: [ :provA :provB | 
		  provA name <= provB name ]
]

{ #category : #accessing }
GeoBRWorld >> domains [
	^ domains
]

{ #category : #'actions database' }
GeoBRWorld >> emptyAllData [

	repository
		removeAll: GeoBRActionWrapper;
		removeAll: GeoBRArea;
		removeAll: GeoBRProvinceArea;
		removeAll: GeoBRIslandArea;
		removeAll: GeoBRWoodArea;
		removeAll: GeoBRMountainArea;
		removeAll: GeoBRBorder.
	self reset
]

{ #category : #accessing }
GeoBRWorld >> holdingCollection [

	^ holdings values 
]

{ #category : #accessing }
GeoBRWorld >> holdings [
	^ holdings
]

{ #category : #initialization }
GeoBRWorld >> initialize [

	super initialize.
	self reset
]

{ #category : #accessing }
GeoBRWorld >> islandAreas [
	
	^ repository selectAll: GeoBRIslandArea
]

{ #category : #accessing }
GeoBRWorld >> map [

	^ GeoBRMap new
		  provinceAreas: self provinceAreas;
		  borders: self borders;
		  provinceBorders: self provinceBorders;
		  realmBorders: self realmBorders;
		  islandAreas: self islandAreas;
		  woodAreas: self woodAreas;
		  mountainAreas: self mountainAreas;
		  yourself
]

{ #category : #accessing }
GeoBRWorld >> mountainAreas [

	^ repository selectAll: GeoBRMountainArea 
]

{ #category : #accessing }
GeoBRWorld >> pool [

	^ pool 
]

{ #category : #accessing }
GeoBRWorld >> poolAt: anIdentifier [

	^pool at: anIdentifier 
]

{ #category : #accessing }
GeoBRWorld >> provinceAreas [

	^ repository selectAll: GeoBRProvinceArea
]

{ #category : #accessing }
GeoBRWorld >> provinceAt: provinceId [

	^ provinces at: provinceId
]

{ #category : #accessing }
GeoBRWorld >> provinceBorders [

	| islandBorderIds |
	islandBorderIds := (self islandAreas collectAll: [ :islandArea | 
		                    islandArea borders ]) asSet.

	^ (self borders reject: [ :border | 
		  islandBorderIds includes: border id ]) collect: [ : border | border id ]
]

{ #category : #accessing }
GeoBRWorld >> provinceCollection [

	^ provinces values asSortedCollection: [ :provA :provB | 
		  provA name <= provB name ]
]

{ #category : #accessing }
GeoBRWorld >> provinces [

	^ provinces
]

{ #category : #accessing }
GeoBRWorld >> realmBorderForOwner: aRegent provinces: collectionOfProvinces [

	| areaIds realmAreas borderIds realmBorderIds |
	borderIds := Bag new.
	areaIds := collectionOfProvinces collect: [ :each | each areaId ].
	realmAreas := self provinceAreas select: [ :each | 
		              areaIds includes: each center ].
	realmAreas do: [ :area | borderIds addAll: area borders ].
	realmBorderIds := OrderedCollection new.
	borderIds keysAndValuesDo: [ :value :count | 
		count = 1 ifTrue: [ realmBorderIds add: value ] ].

	^ GeoBRRealmBorder new
		  owner: aRegent;
		  borders: realmBorderIds
		
]

{ #category : #accessing }
GeoBRWorld >> realmBorders [

	"| realmBorders |
	realmBorders := OrderedCollection new.

	((provinces select: [ :province | province hasOwner ]) partition: [ 
		 :province | province owner ]) keysAndValuesDo: [ 
		:owner 
		:provincesPerOwner | 
		realmBorders add:
			(self realmBorderForOwner: owner provinces: provincesPerOwner) ].
	^ realmBorders"
	^#()
]

{ #category : #accessing }
GeoBRWorld >> regentAt: regentId [

	^ regents at: regentId
]

{ #category : #accessing }
GeoBRWorld >> regentCollection [

	^ regents values asSortedCollection: [ :provA :provB | 
		  provA name <= provB name ]
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
	domains := Dictionary new.
	holdings := Dictionary new.
	pool := Dictionary new
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
	^ anAction
]

{ #category : #accessing }
GeoBRWorld >> woodAreas [

	^ repository selectAll: GeoBRWoodArea
]
