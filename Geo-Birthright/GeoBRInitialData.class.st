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

{ #category : #accessing }
GeoBRInitialData class >> mountains [

	self subclassResponsibility 
]

{ #category : #accessing }
GeoBRInitialData class >> mountainsGrid [

	| grid |
	grid := GeoBRGrid new.
	grid scale: self scale.
	grid paths: self mountains .
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

	^ self start: true initial: false isTest: false
]

{ #category : #actions }
GeoBRInitialData class >> start: shouldStart initial: isInitial isTest: isTest [

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

	shouldStart ifTrue: [session start].
	session world: world.

	^ session
]

{ #category : #actions }
GeoBRInitialData class >> startInitial [

	^ self start: true initial: true isTest: false
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

	^ self start: true initial: true isTest: true
]

{ #category : #actions }
GeoBRInitialData class >> startTestWithoutServer [

	^ self start: false initial: true isTest: true
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
GeoBRInitialData class >> woods [

	self subclassResponsibility 
]

{ #category : #accessing }
GeoBRInitialData class >> woodsGrid [

	| grid |
	grid := GeoBRGrid new.
	grid scale: self scale.
	grid paths: self woods.
	grid calculate.

	^ grid
]

{ #category : #accessing }
GeoBRInitialData >> borders [

	^ self class grid borders
]

{ #category : #accessing }
GeoBRInitialData >> islandAreas [

	^ self class grid islandAreas
]

{ #category : #accessing }
GeoBRInitialData >> mountainAreas [

	^ self class mountainsGrid mountainAreas
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
	self woodAreas do: [ :woodArea | world repository save: woodArea ].
	self mountainAreas do: [ :mountainArea | world repository save: mountainArea ].
	self borders do: [ :border | world repository save: border ]
]

{ #category : #actions }
GeoBRInitialData >> takeAction: anAction [

	| action |
	action := world takeAction: anAction.
	^ action id
]

{ #category : #accessing }
GeoBRInitialData >> woodAreas [

	^ self class woodsGrid woodAreas
]

{ #category : #accessing }
GeoBRInitialData >> world [

	^ world
]

{ #category : #accessing }
GeoBRInitialData >> world: anObject [

	world := anObject
]
