Class {
	#name : #BRRegent,
	#superclass : #Object,
	#instVars : [
		'id',
		'name',
		'bloodline',
		'regencyPoints'
	],
	#category : #'Geo-Birthright-Domain Setup'
}

{ #category : #accessing }
BRRegent >> bloodline [

	^ bloodline
]

{ #category : #accessing }
BRRegent >> bloodline: anObject [

	bloodline := anObject
]

{ #category : #accessing }
BRRegent >> id [

	^ id
]

{ #category : #accessing }
BRRegent >> id: anObject [

	id := anObject
]

{ #category : #accessing }
BRRegent >> name [

	^ name
]

{ #category : #accessing }
BRRegent >> name: anObject [

	name := anObject
]

{ #category : #accessing }
BRRegent >> regencyPoints [

	^ regencyPoints
]

{ #category : #accessing }
BRRegent >> regencyPoints: anObject [

	regencyPoints := anObject
]
