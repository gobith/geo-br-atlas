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

	teapot GET: '/map' -> [ :request | world map ].
	
	teapot GET: '/map2' -> [ :request | world map2 ].
	
	
	teapot GET: '/world' -> [ :request | world ].
	
	teapot serveStatic: '/' from: '/home/georges/apps/geo-br-atlas-frontend/public'
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
GeoBRSession >> world [
	^ world
]

{ #category : #accessing }
GeoBRSession >> world: aGeoBRWorld [ 
	world := aGeoBRWorld
]
