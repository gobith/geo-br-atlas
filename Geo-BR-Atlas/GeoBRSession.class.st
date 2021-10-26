Class {
	#name : #GeoBRSession,
	#superclass : #Object,
	#instVars : [
		'teapot',
		'world'
	],
	#category : #'Geo-BR-Atlas'
}

{ #category : #accessing }
GeoBRSession >> addRoutes [

	teapot GET: '/map' -> [ :request | self requestMap: request ].
	teapot GET: '/world' -> [ :request | self requestWorld: request ].
	
	teapot GET: '/singledots' -> [ :request | self requestSingleDots: request ].
]

{ #category : #accessing }
GeoBRSession >> requestMap: aRequest [

	^world map
]

{ #category : #accessing }
GeoBRSession >> requestSingleDots: aRequest [

	| singleCollection |
	singleCollection := OrderedCollection new.

	(GeoBRCerilia grid borders collectAll: [ :each | 
		 { 
			 each a.
			 each b } ]) asBag keysAndValuesDo: [ :key :value | 
		value = 1 ifTrue: [ singleCollection add: key ] ].

	

	^ singleCollection
]

{ #category : #accessing }
GeoBRSession >> requestWorld: aRequest [

	^world
]

{ #category : #accessing }
GeoBRSession >> start [

	self stop.
	

	teapot := Teapot configure: { 
			          (#port -> 8101).
			          (#defaultOutput -> #json).
			          (#debugMode -> true) }.
	self addRoutes.
	teapot start
]

{ #category : #accessing }
GeoBRSession >> stop [ 
	
	world := nil.
	teapot ifNotNil: [ teapot stop ].
	teapot := nil
]

{ #category : #accessing }
GeoBRSession >> world: aGeoBRWorld [ 
	world := aGeoBRWorld
]
