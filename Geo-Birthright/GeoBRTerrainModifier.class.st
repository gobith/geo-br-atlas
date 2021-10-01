Class {
	#name : #GeoBRTerrainModifier,
	#superclass : #Object,
	#instVars : [
		'modifier'
	],
	#category : #'Geo-Birthright-Terrain'
}

{ #category : #accessing }
GeoBRTerrainModifier class >> neoJsonMappingOn: mapping [

	mapping
		mapAccessor: #modifier
]

{ #category : #accessing }
GeoBRTerrainModifier >> modifier [

	^ modifier
]

{ #category : #accessing }
GeoBRTerrainModifier >> modifier: anObject [

	modifier := anObject
]
