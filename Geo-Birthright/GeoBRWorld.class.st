Class {
	#name : #GeoBRWorld,
	#superclass : #Object,
	#instVars : [
		'provinces',
		'regents',
		'ownerships',
		'actions',
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
		mapAccessor: #regents to: #regents
]

{ #category : #accessing }
GeoBRWorld >> actions [

	^ actions 
]

{ #category : #actions }
GeoBRWorld >> addAction: anOwnershipAction [

	actions add: anOwnershipAction
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
	
	repository ifNil: [ ^self ].
	repository removeAll: GeoBRActionWrapper.
	self reset.
	self resetActions
]

{ #category : #initialization }
GeoBRWorld >> initialize [

	super initialize.
	self reset.
	self resetActions
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
	actions do: [ :action | self doAction: action ]
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

{ #category : #initialization }
GeoBRWorld >> resetActions [

	actions := OrderedCollection new
]

{ #category : #actions }
GeoBRWorld >> saveAction: anAction [

	repository ifNil: [ ^self ].

	anAction ensureId.

	repository save: anAction asActionWrapper
]

{ #category : #initialization }
GeoBRWorld >> setup [

	repository ifNil: [ ^self ].
	
	actions := (repository selectAll: GeoBRActionWrapper) collect: [ :actionWrapper | actionWrapper action ].
	self replay
]

{ #category : #actions }
GeoBRWorld >> takeAction: anAction [

	self saveAction: anAction.
	self addAction: anAction.
	self doAction: anAction.
	^anAction
]
