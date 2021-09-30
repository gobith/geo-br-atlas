Class {
	#name : #GeoBROwnership,
	#superclass : #Object,
	#instVars : [
		'regent',
		'province'
	],
	#category : #'Geo-Birthright'
}

{ #category : #accessing }
GeoBROwnership >> province [

	^ province
]

{ #category : #accessing }
GeoBROwnership >> province: anObject [

	province := anObject
]

{ #category : #accessing }
GeoBROwnership >> regent [

	^ regent
]

{ #category : #accessing }
GeoBROwnership >> regent: anObject [

	regent := anObject
]
