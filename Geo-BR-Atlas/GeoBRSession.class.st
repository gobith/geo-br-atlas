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
]

{ #category : #accessing }
GeoBRSession >> requestPaths: request [

	^paths
]

{ #category : #accessing }
GeoBRSession >> setup [ 

	| area |
	paths := GeoBRPathParser exampleDeepsouth.
	
	area := GeoBRArea new pathIds: { 5 . 11 . 12 . 13 . 14 . 15 }; name: 'Garolfs'.
	
	
	areas := OrderedCollection with: area.
	areas do: [ :a | a createCombinedPathUsing: paths ]
	
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
	
	teapot ifNotNil: [ teapot stop ].
	teapot := nil
]
