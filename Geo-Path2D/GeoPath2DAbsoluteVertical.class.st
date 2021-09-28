Class {
	#name : #GeoPath2DAbsoluteVertical,
	#superclass : #GeoPath2DCommand,
	#category : #'Geo-Path2D'
}

{ #category : #accessing }
GeoPath2DAbsoluteVertical class >> commandName [

	^'V'
]

{ #category : #accessing }
GeoPath2DAbsoluteVertical >> absolutePoint: aPoint previousPoint: previousPoint in: aCollection [ 

	aCollection add: aPoint.
	^aPoint
]

{ #category : #accessing }
GeoPath2DAbsoluteVertical >> createPoints: aCollection previousPoint: aPoint [

	^ { (aPoint x @ aCollection first) }
]

{ #category : #private }
GeoPath2DAbsoluteVertical >> numberOfArguments [

	^1
]

{ #category : #accessing }
GeoPath2DAbsoluteVertical >> point: aPoint on: aWriteStream [

	aWriteStream
		print: aPoint y
]
