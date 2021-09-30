Class {
	#name : #GeoBRRegent,
	#superclass : #Object,
	#instVars : [
		'id',
		'name'
	],
	#category : #'Geo-Birthright'
}

{ #category : #accessing }
GeoBRRegent >> id [

	^ id
]

{ #category : #accessing }
GeoBRRegent >> id: anObject [

	id := anObject
]

{ #category : #accessing }
GeoBRRegent >> name [

	^ name
]

{ #category : #accessing }
GeoBRRegent >> name: anObject [

	name := anObject
]

{ #category : #printing }
GeoBRRegent >> printOn: aStream [

	aStream nextPutAll: self name
]
