Class {
	#name : #GeoPath2DAbsoluteLine,
	#superclass : #GeoPath2DCommand,
	#category : #'Geo-Path2D'
}

{ #category : #accessing }
GeoPath2DAbsoluteLine class >> commandName [

	^'L'
]

{ #category : #private }
GeoPath2DAbsoluteLine class >> numberOfArguments [

	^2
]

{ #category : #accessing }
GeoPath2DAbsoluteLine >> createPoints: aCollection previousCommand: aCommand [

	super createPoints: aCollection previousCommand: aCommand.
	endPoint := (aCollection first @ aCollection last)
]

{ #category : #testing }
GeoPath2DAbsoluteLine >> isLine [

	^true
]

{ #category : #accessing }
GeoPath2DAbsoluteLine >> point: aPoint on: aWriteStream [

	aWriteStream
		print: aPoint x;
		space;
		print: aPoint y
]

{ #category : #accessing }
GeoPath2DAbsoluteLine >> pointsOn: aWriteStream separator: separator [

	aWriteStream
		print: endPoint x;
		nextPut: separator;
		print: endPoint y
]
