Class {
	#name : #GeoBRSession,
	#superclass : #Object,
	#instVars : [
		'teapot',
		'paths',
		'areas'
	],
	#category : #'Geo-BR-Atlas'
}

{ #category : #accessing }
GeoBRSession >> addRoutes [


	teapot GET: '/paths' -> [ :request | self requestPaths: request ].
	teapot GET: '/areas' -> [ :request | self requestAreas: request ].
	teapot GET: '/grid' -> [ :request | self requestGrid: request ].
	teapot GET: '/map' -> [ :request | self requestMap: request ].
]

{ #category : #accessing }
GeoBRSession >> grid [

	| grid |
	grid := GeoBRGrid new.
	grid paths: paths.
	grid calculate.
	^grid
]

{ #category : #accessing }
GeoBRSession >> map [

	^GeoBRMap new
]

{ #category : #accessing }
GeoBRSession >> requestAreas: request [

	^areas
]

{ #category : #accessing }
GeoBRSession >> requestGrid: request [

	^self grid
]

{ #category : #accessing }
GeoBRSession >> requestMap: aRequest [

	^self map
]

{ #category : #accessing }
GeoBRSession >> requestPaths: request [

	^paths
]

{ #category : #accessing }
GeoBRSession >> setup [

	| area |
	paths := GeoBRPathParser exampleDeepsouth.
	areas := OrderedCollection new.
	
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
	
	paths := nil.
	areas := nil.
	
	teapot ifNotNil: [ teapot stop ].
	teapot := nil
]
