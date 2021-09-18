Class {
	#name : #GeoPath2DAbsoluteMove,
	#superclass : #GeoPath2DCommand,
	#category : #'Geo-Path2D'
}

{ #category : #accessing }
GeoPath2DAbsoluteMove class >> commandName [

	^'M'
]

{ #category : #accessing }
GeoPath2DAbsoluteMove >> createPoints: aCollection previousPoint: aPoint [

	^ { (aCollection first @ aCollection last) }
]

{ #category : #private }
GeoPath2DAbsoluteMove >> numberOfArguments [

	^2
]

{ #category : #accessing }
GeoPath2DAbsoluteMove >> point: aPoint on: aWriteStream [

	aWriteStream
		print: aPoint x;
		space;
		print: aPoint y
]
