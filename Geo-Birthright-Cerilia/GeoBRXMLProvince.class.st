Class {
	#name : #GeoBRXMLProvince,
	#superclass : #GeoBRXMLConvertedObject,
	#instVars : [
		'name',
		'level',
		'magic',
		'realm',
		'holdings'
	],
	#category : #'Geo-Birthright-Cerilia-Converting'
}

{ #category : #accessing }
GeoBRXMLProvince >> holdings [

	^ holdings
]

{ #category : #accessing }
GeoBRXMLProvince >> holdings: anObject [

	holdings := anObject
]

{ #category : #accessing }
GeoBRXMLProvince >> level [

	^ level
]

{ #category : #accessing }
GeoBRXMLProvince >> level: anObject [

	level := anObject
]

{ #category : #accessing }
GeoBRXMLProvince >> magic [

	^ magic
]

{ #category : #accessing }
GeoBRXMLProvince >> magic: anObject [

	magic := anObject
]

{ #category : #accessing }
GeoBRXMLProvince >> name [

	^ name
]

{ #category : #accessing }
GeoBRXMLProvince >> name: anObject [

	name := anObject
]

{ #category : #accessing }
GeoBRXMLProvince >> realm [

	^ realm
]

{ #category : #accessing }
GeoBRXMLProvince >> realm: anObject [

	realm := anObject
]
