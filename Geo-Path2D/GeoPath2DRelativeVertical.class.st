Class {
	#name : #GeoPath2DRelativeVertical,
	#superclass : #GeoPath2DCommand,
	#category : #'Geo-Path2D'
}

{ #category : #accessing }
GeoPath2DRelativeVertical class >> commandName [

	^'v'
]

{ #category : #accessing }
GeoPath2DRelativeVertical >> absolutePoint: aPoint previousPoint: aPointOrNil in: aCollection [

	| absolutePoint |
	absolutePoint := aPointOrNil
		                 ifNil: [ aPoint ]
		                 ifNotNil: [ aPointOrNil + aPoint ].

	aCollection add: absolutePoint.
	^ absolutePoint
]

{ #category : #accessing }
GeoPath2DRelativeVertical >> createPoints: aCollection previousPoint: anObject [

	^ { (0 @ aCollection first) }
]

{ #category : #private }
GeoPath2DRelativeVertical >> numberOfArguments [

	^1
]

{ #category : #accessing }
GeoPath2DRelativeVertical >> point: aPoint on: aWriteStream [

	aWriteStream
		print: aPoint y
]
