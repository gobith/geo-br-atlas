Class {
	#name : #GeoPath2DAbsoluteCubicCurve,
	#superclass : #GeoPath2DCommand,
	#instVars : [
		'beginControlPoint',
		'endControlPoint'
	],
	#category : #'Geo-Path2D'
}

{ #category : #accessing }
GeoPath2DAbsoluteCubicCurve class >> commandName [ 
	^'C'
]

{ #category : #private }
GeoPath2DAbsoluteCubicCurve class >> numberOfArguments [

	^6
]

{ #category : #accessing }
GeoPath2DAbsoluteCubicCurve >> absolutePointsIn: aCollection [ 
	aCollection add: endPoint
]

{ #category : #accessing }
GeoPath2DAbsoluteCubicCurve >> beginControlPoint [

	^ beginControlPoint
]

{ #category : #accessing }
GeoPath2DAbsoluteCubicCurve >> beginControlPoint: anObject [

	beginControlPoint := anObject
]

{ #category : #accessing }
GeoPath2DAbsoluteCubicCurve >> createPoints: aCollection previousCommand: aCommand [

	super createPoints: aCollection previousCommand: aCommand.
	beginPoint := aCommand endPoint.
	beginControlPoint := ((aCollection at: 1) @ (aCollection at: 2)).
	endControlPoint := ((aCollection at: 3) @ (aCollection at: 4)).
	endPoint := ((aCollection at: 5) @ (aCollection at: 6))
]

{ #category : #accessing }
GeoPath2DAbsoluteCubicCurve >> endControlPoint [

	^ endControlPoint
]

{ #category : #accessing }
GeoPath2DAbsoluteCubicCurve >> endControlPoint: anObject [

	endControlPoint := anObject
]

{ #category : #accessing }
GeoPath2DAbsoluteCubicCurve >> point: aPoint on: aWriteStream [

	aWriteStream
		print: aPoint x;
		space;
		print: aPoint y
]

{ #category : #accessing }
GeoPath2DAbsoluteCubicCurve >> pointsOn: aWriteStream separator: separator [

	{ beginControlPoint . endControlPoint . endPoint  } do: [ :point | 
		aWriteStream
			print: point x;
			nextPut: separator;
			print: point y ] separatedBy: [ aWriteStream space ]
]

{ #category : #converting }
GeoPath2DAbsoluteCubicCurve >> reverse [

	^ super reverse
		  beginControlPoint: endControlPoint;
		  endControlPoint: beginControlPoint;
		  yourself
]
