Class {
	#name : #GeoBRCeriliaData,
	#superclass : #GeoBRInitialData,
	#category : #'Geo-Birthright-Data'
}

{ #category : #accessing }
GeoBRCeriliaData class >> areasJson [

	| areas |
	areas := self grid areas .

	^ NeoJSONWriter toStringPretty: areas
]

{ #category : #accessing }
GeoBRCeriliaData class >> bordersJson [

	^ NeoJSONWriter toStringPretty: self grid borders
]

{ #category : #accessing }
GeoBRCeriliaData class >> paths [

	^ (GeoBRPathParser onFileNamed: '/home/georges/Geo BR Atlas/Cerilia Map v1.13_scaled003.svg') parse
]
