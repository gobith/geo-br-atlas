Class {
	#name : #GeoBRBorder,
	#superclass : #Object,
	#instVars : [
		'id',
		'd'
	],
	#category : #'Geo-BR-Atlas'
}

{ #category : #accessing }
GeoBRBorder class >> neoJsonMapping: mapper [
	mapper for: self do: [ :mapping | self neoJsonMappingOn: mapping ]
]

{ #category : #accessing }
GeoBRBorder class >> neoJsonMappingOn: mapping [
	mapping
		mapAccessor: #id;
		mapAccessor: #d
]

{ #category : #accessing }
GeoBRBorder >> d [

	^ d
]

{ #category : #accessing }
GeoBRBorder >> d: anObject [

	d := anObject
]

{ #category : #accessing }
GeoBRBorder >> id [

	^ id
]

{ #category : #accessing }
GeoBRBorder >> id: anObject [

	id := anObject
]
