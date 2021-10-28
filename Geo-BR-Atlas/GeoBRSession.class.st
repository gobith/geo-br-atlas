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

	^ OrderedCollection new.

	
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
