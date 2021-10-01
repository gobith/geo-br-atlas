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
	#category : #'Geo-Birthright'
}

{ #category : #'instance creation' }
GeoBRWorld class >> birthright [

	^ self newWithRepositoryHost: 'localhost' database: 'birthright'
]

{ #category : #'instance creation' }
GeoBRWorld class >> newWithRepositoryHost: hostName database: databaseName [

	^ self new
		  withRepositoryHost: hostName database: databaseName;
		  yourself
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

{ #category : #initialization }
GeoBRWorld >> initialize [ 

	super initialize.
	self reset.
	actions := OrderedCollection new
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
GeoBRWorld >> provinces [

	^ provinces
]

{ #category : #accessing }
GeoBRWorld >> regentAt: regentId [

	^regents at: regentId
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

{ #category : #actions }
GeoBRWorld >> reset [ 
	
	provinces := Dictionary new.
	regents := Dictionary new.
	ownerships := OrderedCollection new.
]

{ #category : #actions }
GeoBRWorld >> saveAction: anAction [

	repository ifNil: [ ^self ].

	anAction asWrapper save: repository 
]

{ #category : #actions }
GeoBRWorld >> takeAction: anAction [.

	self saveAction: anAction.
	self addAction: anAction.
	self doAction: anAction
]

{ #category : #initialization }
GeoBRWorld >> withRepositoryHost: hostName database: databaseName [

	repository := VOMongoRepository host: hostName database: databaseName
]
