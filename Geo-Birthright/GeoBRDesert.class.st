Class {
	#name : #GeoBRDesert,
	#superclass : #GeoBRTerrain,
	#category : #'Geo-Birthright-Terrain'
}

{ #category : #accessing }
GeoBRDesert class >> moveCost [

	^ 1
]

{ #category : #accessing }
GeoBRDesert class >> potential [

	^5
]

{ #category : #accessing }
GeoBRDesert class >> terrainName [

	^'Desert'
]
