Class {
	#name : #GeoBRSessionOld,
	#superclass : #Object,
	#instVars : [
		'teapot',
		'paths',
		'areas'
	],
	#category : #'Geo-BR-Atlas'
}

{ #category : #accessing }
GeoBRSessionOld >> addRoutes [


	teapot GET: '/paths' -> [ :request | self requestPaths: request ].
	teapot GET: '/areas' -> [ :request | self requestAreas: request ].
	teapot GET: '/grid' -> [ :request | self requestGrid: request ].
	teapot GET: '/map' -> [ :request | self requestMap: request ].
]

{ #category : #accessing }
GeoBRSessionOld >> grid [

	| grid |
	grid := GeoBRGrid new.
	grid paths: paths.
	grid calculate.
	^grid
]

{ #category : #accessing }
GeoBRSessionOld >> map [

	^GeoBRMap new
]

{ #category : #accessing }
GeoBRSessionOld >> requestAreas: request [

	^areas
]

{ #category : #accessing }
GeoBRSessionOld >> requestGrid: request [

	^self grid
]

{ #category : #accessing }
GeoBRSessionOld >> requestMap: aRequest [

	^self map
]

{ #category : #accessing }
GeoBRSessionOld >> requestPaths: request [

	^paths
]

{ #category : #accessing }
GeoBRSessionOld >> setup [

	| area |
	paths := GeoBRPathParser exampleDeepsouth.
	areas := OrderedCollection new.
	
]
