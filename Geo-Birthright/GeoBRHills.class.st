Class {
	#name : #GeoBRHills,
	#superclass : #GeoBRTerrain,
	#category : #'Geo-Birthright-Terrain'
}

{ #category : #accessing }
GeoBRHills class >> potential [

	^5
]

{ #category : #accessing }
GeoBRHills class >> terrainName [

	^'Hills'
]

{ #category : #accessing }
GeoBRHills >> color [

	^ (Color fromHexString: 'F5DEB3') lighter lighter lighter
]
