Class {
	#name : #GeoPath2DAbsoluteHorizontal,
	#superclass : #GeoPath2DCommand,
	#category : #'Geo-Path2D'
}

{ #category : #accessing }
GeoPath2DAbsoluteHorizontal class >> commandName [

	^'H'
]

{ #category : #accessing }
GeoPath2DAbsoluteHorizontal >> absolutePoint: aPoint previousPoint: aPoint2 in: aCollection [ 

	aCollection add: aPoint.
	^aPoint
]

{ #category : #accessing }
GeoPath2DAbsoluteHorizontal >> createPoints: aCollection previousPoint: aPoint [

	^ { (aCollection first @ aPoint y) }
]

{ #category : #private }
GeoPath2DAbsoluteHorizontal >> numberOfArguments [

	^1
]

{ #category : #accessing }
GeoPath2DAbsoluteHorizontal >> point: aPoint on: aWriteStream [

	aWriteStream print: aPoint x
]
