Class {
	#name : #GeoBRMediumMountains,
	#superclass : #GeoBRTerrain,
	#category : #'Geo-Birthright-Terrain'
}

{ #category : #accessing }
GeoBRMediumMountains class >> moveCost [

	^ 3
]

{ #category : #accessing }
GeoBRMediumMountains class >> potential [

	^ 7
]

{ #category : #accessing }
GeoBRMediumMountains class >> terrainName [

	^ 'Medium Mountains'
]
