Class {
	#name : #GeoPath2DAbsoluteVertical,
	#superclass : #GeoPath2DCommand,
	#category : #'Geo-Path2D'
}

{ #category : #accessing }
GeoPath2DAbsoluteVertical class >> commandName [

	^'V'
]

{ #category : #private }
GeoPath2DAbsoluteVertical class >> numberOfArguments [

	^1
]

{ #category : #accessing }
GeoPath2DAbsoluteVertical >> createPoints: aCollection previousCommand: aCommand [

	super createPoints: aCollection previousCommand: aCommand.
	endPoint := aCommand x @ aCollection first
]

{ #category : #accessing }
GeoPath2DAbsoluteVertical >> point: aPoint on: aWriteStream [

	aWriteStream
		print: aPoint y
]

{ #category : #accessing }
GeoPath2DAbsoluteVertical >> pointsOn: aWriteStream separator: separator [

	aWriteStream print: endPoint y
]
