Class {
	#name : #GeoBRArea,
	#superclass : #Object,
	#instVars : [
		'id',
		'd',
		'borders'
	],
	#category : #'Geo-BR-Atlas'
}

{ #category : #accessing }
GeoBRArea class >> neoJsonMapping: mapper [
	mapper for: self do: [ :mapping | self neoJsonMappingOn: mapping ]
]

{ #category : #accessing }
GeoBRArea class >> neoJsonMappingOn: mapping [
	mapping
		mapAccessor: #id;
		mapAccessor: #d;
		mapAccessor: #borders;
		mapAccessor: #bounds;
		mapAccessor: #center
]

{ #category : #accessing }
GeoBRArea >> borders [

	^ borders
]

{ #category : #accessing }
GeoBRArea >> borders: anObject [

	borders := anObject
]

{ #category : #accessing }
GeoBRArea >> bounds [ 
	
	^ self polygon bounds
	
]

{ #category : #accessing }
GeoBRArea >> center [

	^ self polygon bounds center
]

{ #category : #accessing }
GeoBRArea >> d [

	^ d
]

{ #category : #accessing }
GeoBRArea >> d: anObject [

	d := anObject
]

{ #category : #accessing }
GeoBRArea >> document [ 
	
	^(GeoPath2DParser on: d) parseDocument 
]

{ #category : #accessing }
GeoBRArea >> id [

	^ id
]

{ #category : #accessing }
GeoBRArea >> id: anObject [

	id := anObject
]

{ #category : #accessing }
GeoBRArea >> polygon [

	^ Polygon vertices: self document absolutePoints
]
