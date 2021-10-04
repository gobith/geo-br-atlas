Class {
	#name : #GeoBRMap,
	#superclass : #Object,
	#instVars : [
		'areas',
		'borders'
	],
	#category : #'Geo-BR-Atlas'
}

{ #category : #accessing }
GeoBRMap class >> neoJsonMapping: mapper [
	mapper for: self do: [ :mapping | self neoJsonMappingOn: mapping ]
]

{ #category : #accessing }
GeoBRMap class >> neoJsonMappingOn: mapping [

	"mapping
		mapAccessor: #id;
		mapAccessor: #d;
		mapAccessor: #data;
		mapAccessor: #selected;
		mapAccessor: #center"

	mapping mapAccessor: #borders.
	mapping mapAccessor: #areas
]

{ #category : #accessing }
GeoBRMap >> areas [

	^areas
]

{ #category : #accessing }
GeoBRMap >> areas: anObject [

	areas := anObject
]

{ #category : #accessing }
GeoBRMap >> borders [

	^borders
]

{ #category : #accessing }
GeoBRMap >> borders: anObject [

	borders := anObject
]
