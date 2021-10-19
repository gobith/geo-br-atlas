Class {
	#name : #GeoPath2DAbsoluteClosePath,
	#superclass : #GeoPath2DCommand,
	#category : #'Geo-Path2D'
}

{ #category : #accessing }
GeoPath2DAbsoluteClosePath class >> commandName [

	^'Z'
]

{ #category : #private }
GeoPath2DAbsoluteClosePath class >> numberOfArguments [

	^0
]

{ #category : #accessing }
GeoPath2DAbsoluteClosePath >> absolutePointsIn: aCollection [ 
	
]

{ #category : #accessing }
GeoPath2DAbsoluteClosePath >> createPoints: aCollection previousCommand: aCommand [

	super createPoints: aCollection previousCommand: aCommand
]

{ #category : #accessing }
GeoPath2DAbsoluteClosePath >> ensureSpaceOn: aWriteStream [
]

{ #category : #testing }
GeoPath2DAbsoluteClosePath >> isClose [

	^true
]

{ #category : #accessing }
GeoPath2DAbsoluteClosePath >> point: aPoint on: aWriteStream [

	self shouldNotImplement 
]
