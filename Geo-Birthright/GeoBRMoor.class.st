Class {
	#name : #GeoBRMoor,
	#superclass : #GeoBRTerrain,
	#category : #'Geo-Birthright-Terrain'
}

{ #category : #accessing }
GeoBRMoor class >> moveCost [

	^ 2
]

{ #category : #accessing }
GeoBRMoor class >> potential [

	^ 5
]

{ #category : #accessing }
GeoBRMoor class >> terrainName [

	^'Moor'
]
