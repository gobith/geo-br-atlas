Class {
	#name : #GeoBRHolding,
	#superclass : #Object,
	#instVars : [
		'id',
		'province',
		'level',
		'type',
		'owner'
	],
	#category : #'Geo-Birthright-Domain'
}

{ #category : #accessing }
GeoBRHolding class >> neoJsonMappingOn: mapping [

	mapping
		mapAccessor: #id;
		mapAccessor: #provinceId to: #province;
		mapAccessor: #level;
		mapAccessor: #type;
		mapAccessor: #ownerId to: #owner
		
	
]

{ #category : #accessing }
GeoBRHolding >> id [

	^ id
]

{ #category : #accessing }
GeoBRHolding >> id: anObject [

	id := anObject
]

{ #category : #accessing }
GeoBRHolding >> level [

	^ level
]

{ #category : #accessing }
GeoBRHolding >> level: anObject [

	level := anObject
]

{ #category : #accessing }
GeoBRHolding >> owner [

	^ owner
]

{ #category : #accessing }
GeoBRHolding >> owner: anObject [

	owner := anObject
]

{ #category : #accessing }
GeoBRHolding >> ownerId [

	^ owner id
]

{ #category : #printing }
GeoBRHolding >> printOn: aStream [

	aStream
		nextPutAll: 'Holding: ';
		nextPutAll: province name ;
		nextPutAll: ' / ';
		nextPutAll: self type;
		nextPutAll: ' / ';
		print: level;
		nextPutAll: ' / ';
		nextPutAll: owner name
]

{ #category : #accessing }
GeoBRHolding >> province [

	^ province
]

{ #category : #accessing }
GeoBRHolding >> province: anObject [

	province := anObject
]

{ #category : #accessing }
GeoBRHolding >> provinceId [

	^ province id
]

{ #category : #accessing }
GeoBRHolding >> type [

	^ type
]

{ #category : #accessing }
GeoBRHolding >> type: anObject [

	type := anObject
]
