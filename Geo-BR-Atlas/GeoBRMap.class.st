Class {
	#name : #GeoBRMap,
	#superclass : #Object,
	#instVars : [
		'borders',
		'realmBorders',
		'provinceAreas',
		'islandAreas',
		'woodAreas',
		'mountainAreas'
	],
	#category : #'Geo-BR-Atlas'
}

{ #category : #accessing }
GeoBRMap class >> neoJsonMapping: mapper [
	mapper for: self do: [ :mapping | self neoJsonMappingOn: mapping ]
]

{ #category : #accessing }
GeoBRMap class >> neoJsonMappingOn: mapping [

	mapping
		mapAccessor: #borders;
		mapAccessor: #realmBorders;
		mapAccessor: #provinceAreas;
		mapAccessor: #islandAreas;
		mapAccessor: #woodAreas;
		mapAccessor: #mountainAreas
]

{ #category : #accessing }
GeoBRMap >> borders [

	^ borders
]

{ #category : #accessing }
GeoBRMap >> borders: anObject [

	borders := anObject
]

{ #category : #accessing }
GeoBRMap >> islandAreas [

	^ islandAreas
]

{ #category : #accessing }
GeoBRMap >> islandAreas: anObject [

	islandAreas := anObject
]

{ #category : #accessing }
GeoBRMap >> mountainAreas [

	^ mountainAreas
]

{ #category : #accessing }
GeoBRMap >> mountainAreas: anObject [

	mountainAreas := anObject
]

{ #category : #accessing }
GeoBRMap >> provinceAreas [

	^ provinceAreas
]

{ #category : #accessing }
GeoBRMap >> provinceAreas: anObject [

	provinceAreas := anObject
]

{ #category : #accessing }
GeoBRMap >> realmBorders [

	^ realmBorders
]

{ #category : #accessing }
GeoBRMap >> realmBorders: anObject [

	realmBorders := anObject
]

{ #category : #accessing }
GeoBRMap >> woodAreas [

	^ woodAreas
]

{ #category : #accessing }
GeoBRMap >> woodAreas: anObject [

	woodAreas := anObject
]
