Class {
	#name : #GeoBRMap,
	#superclass : #Object,
	#instVars : [
		'borders',
		'realmBorders',
		'provinceAreas'
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
		mapAccessor: #provinceAreas;
		mapAccessor: #realmBorders
]

{ #category : #accessing }
GeoBRMap >> borders [

	^borders
]

{ #category : #accessing }
GeoBRMap >> borders: anObject [

	borders := anObject
]

{ #category : #accessing }
GeoBRMap >> provinceAreas [

	^provinceAreas
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
