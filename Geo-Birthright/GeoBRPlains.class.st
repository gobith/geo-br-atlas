Class {
	#name : #GeoBRPlains,
	#superclass : #GeoBRTerrain,
	#category : #'Geo-Birthright-Terrain'
}

{ #category : #accessing }
GeoBRPlains class >> potential [

	^5
]

{ #category : #accessing }
GeoBRPlains class >> terrainName [

	^'Plains'
]

{ #category : #accessing }
GeoBRPlains >> color [

	^ Color lightYellow lighter lighter
]
