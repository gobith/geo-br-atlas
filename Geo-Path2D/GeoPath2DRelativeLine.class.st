Class {
	#name : #GeoPath2DRelativeLine,
	#superclass : #GeoPath2DCommand,
	#category : #'Geo-Path2D'
}

{ #category : #accessing }
GeoPath2DRelativeLine class >> commandName [

	^'l'
]

{ #category : #private }
GeoPath2DRelativeLine class >> numberOfArguments [

	^2
]

{ #category : #accessing }
GeoPath2DRelativeLine >> createPoints: aCollection previousCommand: aCommand [

	super createPoints: aCollection previousCommand: aCommand.
	endPoint := aCollection first @ aCollection last
]

{ #category : #accessing }
GeoPath2DRelativeLine >> point: aPoint on: aWriteStream [

	aWriteStream
		print: aPoint x;
		space;
		print: aPoint y
]

{ #category : #accessing }
GeoPath2DRelativeLine >> pointsOn: aWriteStream separator: separator [

	aWriteStream
		print: endPoint x;
		nextPut: separator;
		print: endPoint y
]
