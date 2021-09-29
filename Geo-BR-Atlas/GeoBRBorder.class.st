Class {
	#name : #GeoBRBorder,
	#superclass : #Object,
	#instVars : [
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
