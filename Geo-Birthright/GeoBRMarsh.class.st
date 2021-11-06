Class {
	#name : #GeoBRMarsh,
	#superclass : #GeoBRTerrain,
	#category : #'Geo-Birthright-Terrain'
}

{ #category : #accessing }
GeoBRMarsh class >> moveCost [

	^ 2
]

{ #category : #accessing }
GeoBRMarsh class >> potential [

	^ 5
]

{ #category : #accessing }
GeoBRMarsh class >> terrainName [

	^'Marsh'
]
