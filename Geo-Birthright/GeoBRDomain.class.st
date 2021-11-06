Class {
	#name : #GeoBRDomain,
	#superclass : #Object,
	#instVars : [
		'id',
		'name',
		'gold',
		'court',
		'owner'
	],
	#category : #'Geo-Birthright-Domain'
}

{ #category : #accessing }
GeoBRDomain class >> neoJsonMappingOn: mapping [

	mapping
		mapAccessor: #id;
		mapAccessor: #name;
		mapAccessor: #gold;
		mapAccessor: #court;
		mapAccessor: #ownerId to: #owner
]

{ #category : #accessing }
GeoBRDomain >> court [

	^ court
]

{ #category : #accessing }
GeoBRDomain >> court: anObject [

	court := anObject
]

{ #category : #accessing }
GeoBRDomain >> gold [

	^ gold
]

{ #category : #accessing }
GeoBRDomain >> gold: anObject [

	gold := anObject
]

{ #category : #accessing }
GeoBRDomain >> id [

	^ id
]

{ #category : #accessing }
GeoBRDomain >> id: anObject [

	id := anObject
]

{ #category : #accessing }
GeoBRDomain >> name [

	^ name
]

{ #category : #accessing }
GeoBRDomain >> name: anObject [

	name := anObject
]

{ #category : #accessing }
GeoBRDomain >> owner [

	^ owner
]

{ #category : #accessing }
GeoBRDomain >> owner: anObject [

	owner := anObject
]

{ #category : #accessing }
GeoBRDomain >> ownerId [

	^ owner ifNotNil: [ owner id ]
]

{ #category : #printing }
GeoBRDomain >> printOn: aStream [

	aStream
		nextPutAll: 'Domain: ';
		nextPutAll: self name
]
