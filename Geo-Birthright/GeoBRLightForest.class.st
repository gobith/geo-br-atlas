Class {
	#name : #GeoBRLightForest,
	#superclass : #GeoBRTerrain,
	#category : #'Geo-Birthright-Terrain'
}

{ #category : #accessing }
GeoBRLightForest class >> moveCost [

	^ 1
]

{ #category : #accessing }
GeoBRLightForest class >> potential [

	^ 7
]

{ #category : #accessing }
GeoBRLightForest class >> terrainName [

	^ 'Light Forest'
]

{ #category : #accessing }
GeoBRLightForest >> color [

	^ Color lightGreen lighter lighter
]
