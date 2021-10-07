Class {
	#name : #GeoBRGrid,
	#superclass : #Object,
	#instVars : [
		'nodes',
		'paths',
		'areas'
	],
	#category : #'Geo-BR-Atlas'
}

{ #category : #accessing }
GeoBRGrid class >> neoJsonMapping: mapper [
	mapper for: self do: [ :mapping | self neoJsonMappingOn: mapping ]
]

{ #category : #accessing }
GeoBRGrid class >> neoJsonMappingOn: mapping [
	mapping
	"	mapAccessor: #areaDots;
		mapAccessor: #lines;
		mapAccessor: #dots;"
		mapAccessor: #areas
		
]

{ #category : #actions }
GeoBRGrid >> addPathToNodes: aPath [

	(nodes at: aPath a ifAbsentPut: [ 
		 GeoBRNode new
			 id: nodes size + 1;
			 point: aPath a;
			 yourself ]) addPath: aPath.
	(nodes at: aPath b ifAbsentPut: [ 
		 GeoBRNode new
			 id: nodes size + 1;
			 point: aPath b;
			 yourself ]) addPath: aPath
]

{ #category : #accessing }
GeoBRGrid >> areaDots [

	^ (areas asOrderedCollection reject: [:each | each size > 17]) collect: [ :areaNodes | 
		  { 
		
			'ids' -> ( areaNodes collect: [ :node | node id ] ) .
			('nodes' -> (areaNodes collect: [ :node | 
			    { 
				    ('x' -> node point x).
				    ('y' -> node point y).
				    ('id' -> node id) } asDictionary ])) } asDictionary ]
]

{ #category : #accessing }
GeoBRGrid >> areas [

	| idx |
	idx := 1.
	^ (areas asOrderedCollection reject: [ :each | each size > 17 ]) 
		  collect: [ :areaNodes | 
			  idx := idx + 1.
			  { 
				  ('d' -> (self dForNodes2: areaNodes)).
				  ('borders' -> (self borderIdsForNodes: areaNodes)) }
				  asDictionary ]
]

{ #category : #accessing }
GeoBRGrid >> borderIdsForNodes: aCollection [ 
	
	| borderIds ws |
	borderIds := OrderedCollection new.

	1 to: aCollection size do: [ :fromIdx | 
		| toIdx from to |
		toIdx := fromIdx = aCollection size
			         ifTrue: [ 1 ]
			         ifFalse: [ fromIdx + 1 ].

		from := aCollection at: fromIdx.
		to := aCollection at: toIdx.
		borderIds add: (from pathTo: to) id].
	^borderIds
]

{ #category : #accessing }
GeoBRGrid >> borders [

	^paths
]

{ #category : #actions }
GeoBRGrid >> calculate [

	nodes := Dictionary new.
	areas := Dictionary new.
	paths do: [ :path | self addPathToNodes: path ].
	
	paths do: [ :path | self defineAreasFor: path ]
]

{ #category : #accessing }
GeoBRGrid >> dForNodes2: aCollection [

	| document |
	document := GeoPath2DCombinedDocument new.

	1 to: aCollection size do: [ :fromIdx | 
		| toIdx from to |
		toIdx := fromIdx = aCollection size
			         ifTrue: [ 1 ]
			         ifFalse: [ fromIdx + 1 ].

		from := aCollection at: fromIdx.
		to := aCollection at: toIdx.
		from pathTo: to in: document ].




	^ document d
]

{ #category : #accessing }
GeoBRGrid >> dForNodes: aCollection [

	| points ws |
	points := OrderedCollection new.

	1 to: aCollection size do: [ :fromIdx | 
		| toIdx from to |
		toIdx := fromIdx = aCollection size
			         ifTrue: [ 1 ]
			         ifFalse: [ fromIdx + 1 ].

		from := aCollection at: fromIdx.
		to := aCollection at: toIdx.
		points addAll: (from pathPointsTo: to) ].


	ws := String new writeStream.
	ws nextPutAll: 'M '.

	points
		do: [ :point | 
			ws
				print: point x;
				space;
				print: point y ]
		separatedBy: [ ws space ].
	^ ws contents
]

{ #category : #actions }
GeoBRGrid >> defineAreasFor: aPath [

	self defineAreasFor: aPath start: aPath a end: aPath b.
	self defineAreasFor: aPath start: aPath b end: aPath a
]

{ #category : #actions }
GeoBRGrid >> defineAreasFor: aPath start: startPoint end: endPoint [

	| areaNodes idx end head path node |
	areaNodes := OrderedCollection new.

	idx := 0.

	end := endPoint.
	head := startPoint.
	path := aPath.

	areaNodes add: (nodes at: end).

	[ head = end or: [ idx = 100 ] ] whileFalse: [ 
		idx := idx + 1.

		node := nodes at: head.
		areaNodes add: node.
		path := node nextPathFrom: path.
		head := head = path a
			        ifTrue: [ path b ]
			        ifFalse: [ path a ] ].

	idx = 100 ifTrue: [ self halt ].
	
	
	areas at: (areaNodes collect: [:each | each id]) asSortedCollection asArray put: areaNodes
]

{ #category : #accessing }
GeoBRGrid >> dots [

	^ nodes asOrderedCollection collect: [ :node | 
		  { 
			  ('x' -> node point x).
			  ('y' -> node point y).
			  ('id' -> node id) } asDictionary ]
]

{ #category : #accessing }
GeoBRGrid >> lines [

	^paths collect: [: path | { 'a' -> path aJson . 'b' -> path bJson . 'id' -> path id . 'center' -> path centerJson} asDictionary ]
]

{ #category : #accessing }
GeoBRGrid >> paths: aCollection [ 
	paths := aCollection
]
