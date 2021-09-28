Class {
	#name : #GeoPath2DAbsoluteLine,
	#superclass : #GeoPath2DCommand,
	#category : #'Geo-Path2D'
}

{ #category : #accessing }
GeoPath2DAbsoluteLine class >> commandName [

	^'L'
]

{ #category : #accessing }
GeoPath2DAbsoluteLine >> absolutePoint: aPoint previousPoint: aPoint2 in: aCollection [ 
	
	aCollection add: aPoint.
	^aPoint
]

{ #category : #accessing }
GeoPath2DAbsoluteLine >> createPoints: aCollection previousPoint: anObject [

	^ { (aCollection first @ aCollection last) }
]

{ #category : #private }
GeoPath2DAbsoluteLine >> numberOfArguments [

	^2
]

{ #category : #accessing }
GeoPath2DAbsoluteLine >> point: aPoint on: aWriteStream [

	aWriteStream
		print: aPoint x;
		space;
		print: aPoint y
]
