Class {
	#name : #GeoPath2DAbsoluteHorizontal,
	#superclass : #GeoPath2DCommand,
	#category : #'Geo-Path2D'
}

{ #category : #accessing }
GeoPath2DAbsoluteHorizontal class >> commandName [

	^'H'
]

{ #category : #private }
GeoPath2DAbsoluteHorizontal class >> numberOfArguments [

	^1
]

{ #category : #accessing }
GeoPath2DAbsoluteHorizontal >> createPoints: aCollection previousCommand: aCommand [

	super createPoints: aCollection previousCommand: aCommand.

	endPoint := (aCollection first @ aCommand y)
]

{ #category : #accessing }
GeoPath2DAbsoluteHorizontal >> point: aPoint on: aWriteStream [

	aWriteStream print: aPoint x
]

{ #category : #accessing }
GeoPath2DAbsoluteHorizontal >> pointsOn: aWriteStream separator: separator [

	aWriteStream print: endPoint x
]
