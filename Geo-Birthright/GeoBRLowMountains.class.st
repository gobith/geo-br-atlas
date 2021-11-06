Class {
	#name : #GeoBRLowMountains,
	#superclass : #GeoBRTerrain,
	#category : #'Geo-Birthright-Terrain'
}

{ #category : #accessing }
GeoBRLowMountains class >> moveCost [

	^ 2
]

{ #category : #accessing }
GeoBRLowMountains class >> potential [ 

	^ 7
]

{ #category : #accessing }
GeoBRLowMountains class >> terrainName [

	^ 'Low Mountains'
]
