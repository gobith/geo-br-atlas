Class {
	#name : #GeoPath2DRelativeVertical,
	#superclass : #GeoPath2DCommand,
	#category : #'Geo-Path2D'
}

{ #category : #accessing }
GeoPath2DRelativeVertical class >> commandName [

	^'v'
]

{ #category : #private }
GeoPath2DRelativeVertical class >> numberOfArguments [

	^1
]

{ #category : #accessing }
GeoPath2DRelativeVertical >> createPoints: aCollection previousCommand: aCommand [

	super createPoints: aCollection previousCommand: aCommand.
	endPoint := 0 @ aCollection first
]

{ #category : #accessing }
GeoPath2DRelativeVertical >> point: aPoint on: aWriteStream [

	aWriteStream
		print: aPoint y
]

{ #category : #accessing }
GeoPath2DRelativeVertical >> pointsOn: aWriteStream separator: separator [

	aWriteStream print: endPoint y
]
