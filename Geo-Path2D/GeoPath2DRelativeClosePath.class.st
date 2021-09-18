Class {
	#name : #GeoPath2DRelativeClosePath,
	#superclass : #GeoPath2DCommand,
	#category : #'Geo-Path2D'
}

{ #category : #accessing }
GeoPath2DRelativeClosePath class >> commandName [

	^'z'
]

{ #category : #accessing }
GeoPath2DRelativeClosePath >> createPoints: aCollection previousPoint: anObject [

	self shouldNotImplement  
]

{ #category : #private }
GeoPath2DRelativeClosePath >> numberOfArguments [

	^0
]

{ #category : #accessing }
GeoPath2DRelativeClosePath >> point: aPoint on: aWriteStream [

	self shouldNotImplement 
]
