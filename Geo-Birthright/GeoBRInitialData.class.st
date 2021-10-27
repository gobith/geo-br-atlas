Class {
	#name : #GeoBRInitialData,
	#superclass : #Object,
	#instVars : [
		'world'
	],
	#category : #'Geo-Birthright-Data'
}

{ #category : #accessing }
GeoBRInitialData class >> bordersJson [

	^ '[]'
]

{ #category : #accessing }
GeoBRInitialData class >> database [

	^ 'birthright'
]

{ #category : #accessing }
GeoBRInitialData class >> grid [

	| grid |
	grid := GeoBRGrid new.
	grid scale: self scale.
	grid paths: self paths.
	grid calculate.
	
	^ grid
]

{ #category : #'instance creation' }
GeoBRInitialData class >> on: aWorld [

	^self new world: aWorld
]

{ #category : #accessing }
GeoBRInitialData class >> paths [

	^self subclassResponsibility 
]

{ #category : #accessing }
GeoBRInitialData class >> provinceAreasJson [

	^ '[]'
]

{ #category : #running }
GeoBRInitialData class >> run [

	(self on: self world) run
]

{ #category : #accessing }
GeoBRInitialData class >> scale [

	^ 1
]

{ #category : #actions }
GeoBRInitialData class >> start [

	^ self startInitial: false isTest: false
]

{ #category : #actions }
GeoBRInitialData class >> startInitial [

	^ self startInitial: true isTest: false
]

{ #category : #actions }
GeoBRInitialData class >> startInitial: isInitial isTest: isTest [

	| session repository world |
	session := GeoBRSession new.
	repository := isTest
		              ifTrue: [ GeoBRTestRepository new ]
		              ifFalse: [ 
		              VOMongoRepository
			              host: 'localhost'
			              database: self database ].

	world := GeoBRWorld new
		         repository: repository;
		         yourself.

	isInitial ifTrue: [ (self on: world) run ].
	world replay.

	session start.
	session world: world.

	^ session
]

{ #category : #actions }
GeoBRInitialData class >> startTest [

	^ self startInitial: true isTest: true
]

{ #category : #running }
GeoBRInitialData class >> testWorld [

	| world |
	world := GeoBRWorld new
		         repository: GeoBRTestRepository new;
		         yourself.
	(self on: world) run.
	^ world
]

{ #category : #accessing }
GeoBRInitialData >> borders [

	^ (NeoJSONReader fromString: self class bordersJson) collect: [ :dict | 
		  GeoBRBorder new
			  id: (dict at: 'id');
			  d: (dict at: 'd');
			  yourself ]
]

{ #category : #accessing }
GeoBRInitialData >> islandAreas [

	^ self class grid islandAreas
]

{ #category : #accessing }
GeoBRInitialData >> provinceAreas [

	^ self class grid provinceAreas
]

{ #category : #actions }
GeoBRInitialData >> run [

	world emptyAllData.
	self script
]

{ #category : #actions }
GeoBRInitialData >> script [

	self provinceAreas do: [ :provinceArea | world repository save: provinceArea ].
	self islandAreas do: [ :islandArea | world repository save: islandArea ].
	self borders do: [ :border | world repository save: border ]
]

{ #category : #actions }
GeoBRInitialData >> takeAction: anAction [

	| action |
	action := world takeAction: anAction.
	^action id
]

{ #category : #accessing }
GeoBRInitialData >> world [

	^ world
]

{ #category : #accessing }
GeoBRInitialData >> world: anObject [

	world := anObject
]
