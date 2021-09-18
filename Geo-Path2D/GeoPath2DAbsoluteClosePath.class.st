Class {
	#name : #GeoPath2DAbsoluteClosePath,
	#superclass : #GeoPath2DCommand,
	#category : #'Geo-Path2D'
}

{ #category : #accessing }
GeoPath2DAbsoluteClosePath class >> commandName [

	^'Z'
]

{ #category : #accessing }
GeoPath2DAbsoluteClosePath >> createPoints: aCollection previousPoint: anObject [

	self shouldNotImplement 
]

{ #category : #private }
GeoPath2DAbsoluteClosePath >> numberOfArguments [

	^0
]

{ #category : #accessing }
GeoPath2DAbsoluteClosePath >> point: aPoint on: aWriteStream [

	self shouldNotImplement 
]
