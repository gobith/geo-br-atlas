Class {
	#name : #GeoBRMountain,
	#superclass : #GeoBRTerrain,
	#category : #'Geo-Birthright-Terrain'
}

{ #category : #accessing }
GeoBRMountain class >> potential [

	^7
]

{ #category : #accessing }
GeoBRMountain class >> terrainName [

	^'Mountain'
]

{ #category : #accessing }
GeoBRMountain >> color [

	^ Color fromHexString: 'F5DEB3'
]
