Class {
	#name : #GeoBRGrid,
	#superclass : #Object,
	#instVars : [
		'paths',
		'scale',
		'provinceAreas',
		'areas',
		'nodes',
		'areaPoints'
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
		mapAccessor: #provinceAreas
		
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
GeoBRGrid >> areas [

	^ areas
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
	
	^ paths collect: [ :path | 
		  GeoBRBorder new
			  id: path id;
			  d: path d;
			  yourself ]
]

{ #category : #actions }
GeoBRGrid >> calculate [

	nodes := Dictionary new.
	areas := Dictionary new.
	
	self scalePaths.
	
	paths do: [ :path | self addPathToNodes: path ].
	
	paths do: [ :path | self defineAreasFor: path ]
]

{ #category : #accessing }
GeoBRGrid >> createProvinceAreas [

	| idx coll centerPoints |
	idx := 0.
	

	coll := areas asOrderedCollection collect: [ :areaNodes | 
		        idx := idx + 1.

		        GeoBRProvinceArea new
			        id: idx;
			        d: (self dForNodes: areaNodes);
			        borders: (self borderIdsForNodes: areaNodes);
			        yourself ].
	centerPoints := coll collect: [ :each | each center ].
	^ coll select: [ : provinceArea | (centerPoints select: [ :centerPoint | provinceArea polygon containsPoint: centerPoint ]) size <= 2 ]
]

{ #category : #accessing }
GeoBRGrid >> dForNodes: aCollection [

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

	[ head = end or: [ idx = 1000 ] ] whileFalse: [ 
		idx := idx + 1.

		node := nodes at: head.
		areaNodes add: node.
		path := node nextPathFrom: path.
		head := head = path a
			        ifTrue: [ path b ]
			        ifFalse: [ path a ] ].

	idx = 1000 ifTrue: [ self halt ].
	
	
	areas at: (areaNodes collect: [:each | each id]) asSortedCollection asArray put: areaNodes
]

{ #category : #initialization }
GeoBRGrid >> initialize [ 

	super initialize .
	scale := 1
]

{ #category : #accessing }
GeoBRGrid >> islandAreas [

	| borderIds pathDict islandPaths grid idx |
	borderIds := Bag new.
	pathDict := paths asDictionary.

	self provinceAreas do: [ :area | borderIds addAll: area borders ].
	islandPaths := OrderedCollection new.
	borderIds keysAndValuesDo: [ :value :count | 
		count = 1 ifTrue: [ islandPaths add: (pathDict at: value) ] ].


	grid := GeoBRGrid new.
	grid paths: islandPaths.
	grid calculate.

	idx := 0.
	^ grid areas asOrderedCollection collect: [ :areaNodes | 
		  idx := idx + 1.

		  GeoBRIslandArea new
			  id: idx;
			  d: (self dForNodes: areaNodes);
			  borders: (self borderIdsForNodes: areaNodes);
			  yourself ]
]

{ #category : #accessing }
GeoBRGrid >> mountainAreas [

	| idx |
	idx := 0.
	^ areas asOrderedCollection collect: [ :areaNodes | 
		  idx := idx + 1.

		  GeoBRMountainArea new
			  id: idx;
			  d: (self dForNodes: areaNodes);
			  borders: (self borderIdsForNodes: areaNodes);
			  yourself ]
]

{ #category : #accessing }
GeoBRGrid >> paths: aCollection [ 
	paths := aCollection
]

{ #category : #accessing }
GeoBRGrid >> provinceAreas [

	provinceAreas ifNil: [ provinceAreas := self createProvinceAreas ].
	^ provinceAreas
]

{ #category : #accessing }
GeoBRGrid >> scale: scaleNumber [

	scale := scaleNumber
	
]

{ #category : #accessing }
GeoBRGrid >> scalePaths [

	| newPaths |
	scale = 1 ifTrue: [ ^ self ].

	newPaths := OrderedCollection new.

	paths do: [ :path | newPaths add: (path scale: scale) ].

	paths := newPaths
]

{ #category : #accessing }
GeoBRGrid >> woodAreas [

	| idx |
	idx := 0.
	^ areas asOrderedCollection collect: [ :areaNodes | 
		  idx := idx + 1.

		  GeoBRWoodArea new
			  id: idx;
			  d: (self dForNodes: areaNodes);
			  borders: (self borderIdsForNodes: areaNodes);
			  yourself ]
]
