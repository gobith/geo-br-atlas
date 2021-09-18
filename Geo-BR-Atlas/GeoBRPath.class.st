Class {
	#name : #GeoBRPath,
	#superclass : #Object,
	#instVars : [
		'id',
		'd',
		'document'
	],
	#category : #'Geo-BR-Atlas'
}

{ #category : #accessing }
GeoBRPath class >> neoJsonMapping: mapper [
	mapper for: self do: [ :mapping | self neoJsonMappingOn: mapping ]
]

{ #category : #accessing }
GeoBRPath class >> neoJsonMappingOn: mapping [
	mapping
		mapAccessor: #id;
		mapAccessor: #d;
		mapAccessor: #data
]

{ #category : #accessing }
GeoBRPath >> d [

	^ d
]

{ #category : #accessing }
GeoBRPath >> d: anObject [

	d := anObject
]

{ #category : #accessing }
GeoBRPath >> data [
	
	^self document d
]

{ #category : #accessing }
GeoBRPath >> document [

	document ifNil: [ document := (GeoPath2DParser on: d) parseDocument ].
	^document
]

{ #category : #accessing }
GeoBRPath >> id [

	^ id
]

{ #category : #accessing }
GeoBRPath >> id: anObject [

	id := anObject
]
