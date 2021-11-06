Class {
	#name : #GeoBRHighlands,
	#superclass : #GeoBRTerrain,
	#category : #'Geo-Birthright-Terrain'
}

{ #category : #accessing }
GeoBRHighlands class >> moveCost [

	^ 2
]

{ #category : #accessing }
GeoBRHighlands class >> potential [

	^5
]

{ #category : #accessing }
GeoBRHighlands class >> terrainName [

	^ 'Highlands'
]
