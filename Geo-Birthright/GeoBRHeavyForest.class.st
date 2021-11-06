Class {
	#name : #GeoBRHeavyForest,
	#superclass : #GeoBRTerrain,
	#category : #'Geo-Birthright-Terrain'
}

{ #category : #accessing }
GeoBRHeavyForest class >> moveCost [

	^ 2
]

{ #category : #accessing }
GeoBRHeavyForest class >> potential [ 

	^ 7
]

{ #category : #accessing }
GeoBRHeavyForest class >> terrainName [

	^ 'Heavy Forest'
]
