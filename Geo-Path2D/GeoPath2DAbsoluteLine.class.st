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
GeoPath2DAbsoluteLine >> createPoints: aCollection previousPoint: anObject [

	self halt 
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
