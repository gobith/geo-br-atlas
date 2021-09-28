Class {
	#name : #GeoPath2DAbsoluteCubicCurve,
	#superclass : #GeoPath2DCommand,
	#category : #'Geo-Path2D'
}

{ #category : #accessing }
GeoPath2DAbsoluteCubicCurve class >> commandName [ 
	^'C'
]

{ #category : #accessing }
GeoPath2DAbsoluteCubicCurve >> absolutePoint: aPoint previousPoint: aPointOrNil in: aCollection [

	| absolutePoint |
	absolutePoint := aPoint.

	aCollection add: absolutePoint.
	^ absolutePoint
]

{ #category : #accessing }
GeoPath2DAbsoluteCubicCurve >> createPoints: aCollection previousPoint: anObject [

	^ { (aCollection first @ aCollection last) }
]

{ #category : #accessing }
GeoPath2DAbsoluteCubicCurve >> numberOfArguments [

	^2
]

{ #category : #accessing }
GeoPath2DAbsoluteCubicCurve >> point: aPoint on: aWriteStream [

	aWriteStream
		print: aPoint x;
		space;
		print: aPoint y
]
