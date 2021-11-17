Class {
	#name : #GeoBRMap2,
	#superclass : #Object,
	#instVars : [
		'borders',
		'provinceBorders',
		'realmBorders',
		'provinceAreas',
		'islandAreas',
		'woodAreas',
		'mountainAreas',
		'nodes'
	],
	#category : #'Geo-BR-Atlas'
}

{ #category : #accessing }
GeoBRMap2 class >> neoJsonMapping: mapper [
	mapper for: self do: [ :mapping | self neoJsonMappingOn: mapping ]
]

{ #category : #accessing }
GeoBRMap2 class >> neoJsonMappingOn: mapping [

	mapping
		mapAccessor: #borders;
		mapAccessor: #areas;
		mapAccessor: #woodAreas;
		mapAccessor: #mountainAreas
		
		";
		mapAccessor: #provinceBorders;
		mapAccessor: #realmBorders;
		mapAccessor: #provinceAreas;
		mapAccessor: #islandAreas;
		mapAccessor: #woodAreas;
		mapAccessor: #mountainAreas"
		 
]

{ #category : #accessing }
GeoBRMap2 >> areas [

	^ provinceAreas collect: [ :provinceArea | 
		  { 
			  ('borders' -> provinceArea borders).
			  ('p' -> provinceArea province) } asDictionary ]
]

{ #category : #accessing }
GeoBRMap2 >> borders [

	^ borders
]

{ #category : #accessing }
GeoBRMap2 >> borders: anObject [

	borders := anObject
]

{ #category : #accessing }
GeoBRMap2 >> islandAreas [

	^ islandAreas
]

{ #category : #accessing }
GeoBRMap2 >> islandAreas: anObject [

	islandAreas := anObject
]

{ #category : #accessing }
GeoBRMap2 >> mountainAreas [

	^ mountainAreas
]

{ #category : #accessing }
GeoBRMap2 >> mountainAreas: anObject [

	mountainAreas := anObject
]

{ #category : #accessing }
GeoBRMap2 >> nodes [

	^ nodes
]

{ #category : #accessing }
GeoBRMap2 >> nodes: anObject [

	nodes := anObject
]

{ #category : #accessing }
GeoBRMap2 >> provinceAreas [

	^ provinceAreas
]

{ #category : #accessing }
GeoBRMap2 >> provinceAreas: anObject [

	provinceAreas := anObject
]

{ #category : #accessing }
GeoBRMap2 >> provinceBorders [

	^ provinceBorders
]

{ #category : #accessing }
GeoBRMap2 >> provinceBorders: anObject [

	provinceBorders := anObject
]

{ #category : #accessing }
GeoBRMap2 >> realmBorders [

	^ realmBorders
]

{ #category : #accessing }
GeoBRMap2 >> realmBorders: anObject [

	realmBorders := anObject
]

{ #category : #accessing }
GeoBRMap2 >> woodAreas [

	^ woodAreas
]

{ #category : #accessing }
GeoBRMap2 >> woodAreas: anObject [

	woodAreas := anObject
]
