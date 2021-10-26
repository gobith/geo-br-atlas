Class {
	#name : #GeoPath2DAbsoluteMove,
	#superclass : #GeoPath2DCommand,
	#category : #'Geo-Path2D'
}

{ #category : #accessing }
GeoPath2DAbsoluteMove class >> commandName [

	^'M'
]

{ #category : #private }
GeoPath2DAbsoluteMove class >> numberOfArguments [

	^2
]

{ #category : #accessing }
GeoPath2DAbsoluteMove >> createPoints: aCollection previousCommand: aCommand [

	super createPoints: aCollection previousCommand: aCommand.
	endPoint := aCollection first @ aCollection last
]

{ #category : #testing }
GeoPath2DAbsoluteMove >> isMove [

	^true
]

{ #category : #accessing }
GeoPath2DAbsoluteMove >> nextCommandClass [

	^ GeoPath2DAbsoluteLine
]

{ #category : #accessing }
GeoPath2DAbsoluteMove >> point: aPoint on: aWriteStream [

	aWriteStream
		print: aPoint x;
		space;
		print: aPoint y
]

{ #category : #accessing }
GeoPath2DAbsoluteMove >> pointsOn: aWriteStream separator: separator [

	aWriteStream
		print: endPoint x;
		nextPut: separator;
		print: endPoint y
]
