Class {
	#name : #GeoBRGrid,
	#superclass : #Object,
	#instVars : [
		'paths',
		'scale',
		'provinceAreaDict',
		'nodeDict'
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

	(nodeDict at: aPath a ifAbsentPut: [ 
		 GeoBRNode new
			 id: nodeDict size + 1;
			 point: aPath a;
			 yourself ]) addPath: aPath.
	(nodeDict at: aPath b ifAbsentPut: [ 
		 GeoBRNode new
			 id: nodeDict size + 1;
			 point: aPath b;
			 yourself ]) addPath: aPath
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

	nodeDict := Dictionary new.
	provinceAreaDict := Dictionary new.
	
	self scalePaths.
	
	paths do: [ :path | self addPathToNodes: path ].
	
	paths do: [ :path | self defineAreasFor: path ]
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

	areaNodes add: (nodeDict at: end).

	[ head = end or: [ idx = 1000 ] ] whileFalse: [ 
		idx := idx + 1.

		node := nodeDict at: head.
		areaNodes add: node.
		path := node nextPathFrom: path.
		head := head = path a
			        ifTrue: [ path b ]
			        ifFalse: [ path a ] ].

	idx = 1000 ifTrue: [ self halt ].
	
	
	provinceAreaDict at: (areaNodes collect: [:each | each id]) asSortedCollection asArray put: areaNodes
]

{ #category : #initialization }
GeoBRGrid >> initialize [ 

	super initialize .
	scale := 1
]

{ #category : #accessing }
GeoBRGrid >> islandAreas [
	^Array new
]

{ #category : #accessing }
GeoBRGrid >> paths: aCollection [ 
	paths := aCollection
]

{ #category : #accessing }
GeoBRGrid >> provinceAreas [

	| idx |
	idx := 0.
	^ (provinceAreaDict asOrderedCollection reject: [ :each | 
		   each size < 200 ]) collect: [ :areaNodes | 
		  idx := idx + 1.

		  GeoBRProvinceArea new
			  id: idx;
			  d: (self dForNodes: areaNodes);
			  borders: (self borderIdsForNodes: areaNodes);
			  yourself ]
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
