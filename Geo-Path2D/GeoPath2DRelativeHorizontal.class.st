Class {
	#name : #GeoPath2DRelativeHorizontal,
	#superclass : #GeoPath2DCommand,
	#category : #'Geo-Path2D'
}

{ #category : #accessing }
GeoPath2DRelativeHorizontal class >> commandName [

	^'h'
]

{ #category : #accessing }
GeoPath2DRelativeHorizontal >> absolutePoint: aPoint previousPoint: aPointOrNil in: aCollection [ 
	| absolutePoint |
	absolutePoint := aPointOrNil
		                 ifNil: [ aPoint ]
		                 ifNotNil: [ aPointOrNil + aPoint ].

	aCollection add: absolutePoint.
	^ absolutePoint
]

{ #category : #accessing }
GeoPath2DRelativeHorizontal >> createPoints: aCollection previousPoint: aPoint [

	^ { (aCollection first @ 0) }
]

{ #category : #private }
GeoPath2DRelativeHorizontal >> numberOfArguments [

	^1
]

{ #category : #accessing }
GeoPath2DRelativeHorizontal >> point: aPoint on: aWriteStream [

	aWriteStream
		print: aPoint x
]
