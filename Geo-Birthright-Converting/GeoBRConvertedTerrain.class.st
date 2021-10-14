Class {
	#name : #GeoBRConvertedTerrain,
	#superclass : #GeoBRConvertedObject,
	#instVars : [
		'name',
		'maxPopulation',
		'maxMagic',
		'moveCost'
	],
	#category : #'Geo-Birthright-Converting'
}

{ #category : #accessing }
GeoBRConvertedTerrain >> maxMagic [

	^ maxMagic
]

{ #category : #accessing }
GeoBRConvertedTerrain >> maxMagic: anObject [

	maxMagic := anObject
]

{ #category : #accessing }
GeoBRConvertedTerrain >> maxPopulation [

	^ maxPopulation
]

{ #category : #accessing }
GeoBRConvertedTerrain >> maxPopulation: anObject [

	maxPopulation := anObject
]

{ #category : #accessing }
GeoBRConvertedTerrain >> moveCost [

	^ moveCost
]

{ #category : #accessing }
GeoBRConvertedTerrain >> moveCost: anObject [

	moveCost := anObject
]

{ #category : #accessing }
GeoBRConvertedTerrain >> name [

	^ name
]

{ #category : #accessing }
GeoBRConvertedTerrain >> name: anObject [

	name := anObject
]
