Class {
	#name : #GeoBRSteppes,
	#superclass : #GeoBRTerrain,
	#category : #'Geo-Birthright-Terrain'
}

{ #category : #accessing }
GeoBRSteppes class >> moveCost [

	^ 1
]

{ #category : #accessing }
GeoBRSteppes class >> potential [

	^5
]

{ #category : #accessing }
GeoBRSteppes class >> terrainName [

	^'Steppes'
]
