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
]

{ #category : #accessing }
GeoBRSession >> requestMap: aRequest [

	^GeoBRMap new
]

{ #category : #accessing }
GeoBRSession >> requestWorld: aRequest [

	^world
]

{ #category : #accessing }
GeoBRSession >> setup [ 

	world := GeoBRWorld birthright.
	world setup.
]

{ #category : #accessing }
GeoBRSession >> start [

	self stop.
	
	self setup.

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
