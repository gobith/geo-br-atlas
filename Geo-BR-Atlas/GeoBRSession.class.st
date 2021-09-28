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
GeoBRSession >> requestAreas: request [

	^areas
]

{ #category : #accessing }
GeoBRSession >> requestGrid: request [

	^self grid
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
	areas
		add: (GeoBRArea new
				 pathIds: { 5. 11. 12. 13. 14. 15 };
				 name: 'Garolfs');
		add: (GeoBRArea new
				 pathIds: { 13. 16. 17. 18 };
				 name: 'Numut');
		add: (GeoBRArea new
				 pathIds: { 2. 3. 4. 5. 22 };
				 name: 'Cear');
	"	add: (GeoBRArea new
				 pathIds: { 190. 192. 194 };
				 name: 'Queensland');"
		add: (GeoBRArea new
				 pathIds: { 169. 186. 191. 192. 193 };
				 name: 'Nordan Barony');
		add: (GeoBRArea new
				 pathIds: { 187. 189. 190. 191 };
				 name: 'Colks Barony');
		"add: (GeoBRArea new
				 pathIds: { 166. 168. 186. 187. 188 };
				 name: 'Golden Fields');"
		"add: (GeoBRArea new
				 pathIds: { 165. 168. 169. 170 };
				 name: 'Barns Barony')
				;"  add: (GeoBRArea new pathIds: { 3 .6 .7 .8 . }; name: 'Bernau').

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
	
	paths := nil.
	areas := nil.
	
	teapot ifNotNil: [ teapot stop ].
	teapot := nil
]
