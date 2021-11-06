Class {
	#name : #GeoBRGlacier,
	#superclass : #GeoBRTerrain,
	#category : #'Geo-Birthright-Terrain'
}

{ #category : #accessing }
GeoBRGlacier class >> moveCost [

	^ 4
]

{ #category : #accessing }
GeoBRGlacier class >> potential [

	^ 8
]

{ #category : #accessing }
GeoBRGlacier class >> terrainName [

	^ 'Glacier'
]
