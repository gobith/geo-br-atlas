Class {
	#name : #GeoPath2DRelativeMove,
	#superclass : #GeoPath2DCommand,
	#category : #'Geo-Path2D'
}

{ #category : #accessing }
GeoPath2DRelativeMove class >> commandName [

	^'m'
]

{ #category : #private }
GeoPath2DRelativeMove class >> numberOfArguments [

	^2
]

{ #category : #accessing }
GeoPath2DRelativeMove >> createPoints: aCollection previousCommand: aCommand [

	super createPoints: aCollection previousCommand: aCommand.
	endPoint := aCollection first @ aCollection last
]

{ #category : #testing }
GeoPath2DRelativeMove >> isMove [

	^true
]

{ #category : #accessing }
GeoPath2DRelativeMove >> point: aPoint on: aWriteStream [

	aWriteStream
		print: aPoint x;
		space;
		print: aPoint y
]

{ #category : #accessing }
GeoPath2DRelativeMove >> pointsOn: aWriteStream separator: separator [

	aWriteStream
		print: endPoint x;
		nextPut: separator;
		print: endPoint y
]
