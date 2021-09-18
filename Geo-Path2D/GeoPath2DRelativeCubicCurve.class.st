Class {
	#name : #GeoPath2DRelativeCubicCurve,
	#superclass : #GeoPath2DCommand,
	#category : #'Geo-Path2D'
}

{ #category : #accessing }
GeoPath2DRelativeCubicCurve class >> commandName [ 
	^'c'
]

{ #category : #accessing }
GeoPath2DRelativeCubicCurve >> createPoints: aCollection previousPoint: anObject [

	^ { (aCollection first @ aCollection last) }
]

{ #category : #accessing }
GeoPath2DRelativeCubicCurve >> numberOfArguments [

	^2
]

{ #category : #accessing }
GeoPath2DRelativeCubicCurve >> point: aPoint on: aWriteStream [

	aWriteStream
		print: aPoint x;
		space;
		print: aPoint y
]
