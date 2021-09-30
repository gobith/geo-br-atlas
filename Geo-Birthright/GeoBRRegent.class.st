Class {
	#name : #GeoBRRegent,
	#superclass : #Object,
	#instVars : [
		'id',
		'name',
		'bloodline'
	],
	#category : #'Geo-Birthright'
}

{ #category : #accessing }
GeoBRRegent >> bloodline [

	^ bloodline
]

{ #category : #accessing }
GeoBRRegent >> bloodline: anObject [

	bloodline := anObject
]

{ #category : #accessing }
GeoBRRegent >> bloodlineModifier [

	^(bloodline - 10) // 2
]

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
