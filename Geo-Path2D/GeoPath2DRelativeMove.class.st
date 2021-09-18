Class {
	#name : #GeoPath2DRelativeMove,
	#superclass : #GeoPath2DCommand,
	#category : #'Geo-Path2D'
}

{ #category : #accessing }
GeoPath2DRelativeMove class >> commandName [

	^'m'
]

{ #category : #accessing }
GeoPath2DRelativeMove >> absolutePoint: aPoint previousPoint: aPointOrNil in: aCollection [

	| absolutePoint |
	absolutePoint := aPointOrNil
		                 ifNil: [ aPoint ]
		                 ifNotNil: [ aPointOrNil + aPoint ].

	aCollection add: absolutePoint.
	^ absolutePoint
]

{ #category : #accessing }
GeoPath2DRelativeMove >> createPoints: aCollection previousPoint: anObject [

	^ { (aCollection first @ aCollection last) }
]

{ #category : #private }
GeoPath2DRelativeMove >> numberOfArguments [

	^2
]

{ #category : #accessing }
GeoPath2DRelativeMove >> point: aPoint on: aWriteStream [

	aWriteStream
		print: aPoint x;
		space;
		print: aPoint y
]
