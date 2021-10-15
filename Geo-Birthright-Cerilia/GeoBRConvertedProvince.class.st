Class {
	#name : #GeoBRConvertedProvince,
	#superclass : #GeoBRConvertedObject,
	#instVars : [
		'region',
		'name',
		'terrain'
	],
	#category : #'Geo-Birthright-Cerilia-Converting'
}

{ #category : #accessing }
GeoBRConvertedProvince >> name [

	^ name
]

{ #category : #accessing }
GeoBRConvertedProvince >> name: anObject [

	name := anObject
]

{ #category : #accessing }
GeoBRConvertedProvince >> region [

	^ region
]

{ #category : #accessing }
GeoBRConvertedProvince >> region: anObject [

	region := anObject
]

{ #category : #accessing }
GeoBRConvertedProvince >> terrain [

	^ terrain
]

{ #category : #accessing }
GeoBRConvertedProvince >> terrain: anObject [

	terrain := anObject
]
