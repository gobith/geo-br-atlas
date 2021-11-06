Class {
	#name : #GeoBRHighMountains,
	#superclass : #GeoBRTerrain,
	#category : #'Geo-Birthright-Terrain'
}

{ #category : #accessing }
GeoBRHighMountains class >> moveCost [

	^ 4
]

{ #category : #accessing }
GeoBRHighMountains class >> potential [

	^ 9
]

{ #category : #accessing }
GeoBRHighMountains class >> terrainName [

	^ 'High Mountains'
]
