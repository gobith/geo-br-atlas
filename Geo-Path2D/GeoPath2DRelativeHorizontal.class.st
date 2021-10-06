Class {
	#name : #GeoPath2DRelativeHorizontal,
	#superclass : #GeoPath2DCommand,
	#category : #'Geo-Path2D'
}

{ #category : #accessing }
GeoPath2DRelativeHorizontal class >> commandName [

	^'h'
]

{ #category : #private }
GeoPath2DRelativeHorizontal class >> numberOfArguments [

	^1
]

{ #category : #accessing }
GeoPath2DRelativeHorizontal >> createPoints: aCollection previousCommand: aCommand [

	super createPoints: aCollection previousCommand: aCommand.
	endPoint := aCollection first @ 0
]

{ #category : #accessing }
GeoPath2DRelativeHorizontal >> point: aPoint on: aWriteStream [

	aWriteStream
		print: aPoint x
]

{ #category : #accessing }
GeoPath2DRelativeHorizontal >> pointsOn: aWriteStream separator: separator [

	aWriteStream print: endPoint x
]
