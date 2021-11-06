Class {
	#name : #GeoBRAncientForest,
	#superclass : #GeoBRTerrain,
	#category : #'Geo-Birthright-Terrain'
}

{ #category : #accessing }
GeoBRAncientForest class >> moveCost [

	^ 2
]

{ #category : #accessing }
GeoBRAncientForest class >> potential [

	^ 9
]

{ #category : #accessing }
GeoBRAncientForest class >> terrainName [

	^'Ancient Forest'
]
