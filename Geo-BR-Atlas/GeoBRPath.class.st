Class {
	#name : #GeoBRPath,
	#superclass : #Object,
	#instVars : [
		'id',
		'd',
		'document',
		'a',
		'b'
	],
	#category : #'Geo-BR-Atlas'
}

{ #category : #accessing }
GeoBRPath class >> neoJsonMapping: mapper [
	mapper for: self do: [ :mapping | self neoJsonMappingOn: mapping ]
]

{ #category : #accessing }
GeoBRPath class >> neoJsonMappingOn: mapping [

	"mapping
		mapAccessor: #id;
		mapAccessor: #d;
		mapAccessor: #data;
		mapAccessor: #selected;
		mapAccessor: #center"

	mapping
		mapAccessor: #id;
		mapAccessor: #d
]

{ #category : #accessing }
GeoBRPath >> a [

	a ifNil: [a := self absolutePoints first round: 1].
	^a
]

{ #category : #accessing }
GeoBRPath >> aJson [

	^{'x' -> self a x . 'y' -> self a y} asDictionary
]

{ #category : #accessing }
GeoBRPath >> absolutePoints [
	
	^self document absolutePoints 
]

{ #category : #accessing }
GeoBRPath >> b [

	b ifNil: [b := self absolutePoints last round: 1].
	^b
]

{ #category : #accessing }
GeoBRPath >> bJson [

	^{'x' -> self b x . 'y' -> self b y} asDictionary
]

{ #category : #accessing }
GeoBRPath >> center [

	^self a interpolateTo: self b at: 0.5 
]

{ #category : #accessing }
GeoBRPath >> centerJson [

	^{'x' -> self center x . 'y' -> self center y} asDictionary
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

{ #category : #accessing }
GeoBRPath >> oppositePoint: aNode [

	^ self a = aNode point
		  ifTrue: [ self b ]
		  ifFalse: [ self a ]
]

{ #category : #printing }
GeoBRPath >> printOn: aStream [

	aStream
		nextPutAll: 'Path ';
		print: id
]

{ #category : #accessing }
GeoBRPath >> selected [

	^false
]

{ #category : #accessing }
GeoBRPath >> thetaFromNode: aNode [

	^ ((self oppositePoint: aNode) - aNode point) theta
]
