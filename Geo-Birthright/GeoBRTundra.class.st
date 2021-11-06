Class {
	#name : #GeoBRTundra,
	#superclass : #GeoBRTerrain,
	#category : #'Geo-Birthright-Terrain'
}

{ #category : #accessing }
GeoBRTundra class >> moveCost [

	^ 2
]

{ #category : #accessing }
GeoBRTundra class >> potential [

	^ 5
]

{ #category : #accessing }
GeoBRTundra class >> terrainName [

	^'Tundra'
]
