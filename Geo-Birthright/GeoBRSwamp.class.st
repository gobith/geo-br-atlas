Class {
	#name : #GeoBRSwamp,
	#superclass : #GeoBRTerrain,
	#category : #'Geo-Birthright-Terrain'
}

{ #category : #accessing }
GeoBRSwamp class >> moveCost [

	^ 2
]

{ #category : #accessing }
GeoBRSwamp class >> potential [

	^ 8
]

{ #category : #accessing }
GeoBRSwamp class >> terrainName [

	^'Swamp'
]
