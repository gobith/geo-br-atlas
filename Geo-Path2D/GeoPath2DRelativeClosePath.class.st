Class {
	#name : #GeoPath2DRelativeClosePath,
	#superclass : #GeoPath2DCommand,
	#category : #'Geo-Path2D'
}

{ #category : #accessing }
GeoPath2DRelativeClosePath class >> commandName [

	^'z'
]

{ #category : #private }
GeoPath2DRelativeClosePath class >> numberOfArguments [

	^0
]

{ #category : #'as yet unclassified' }
GeoPath2DRelativeClosePath >> ensureSpaceOn: aWriteStream [
]

{ #category : #testing }
GeoPath2DRelativeClosePath >> isClose [

	^true
]

{ #category : #accessing }
GeoPath2DRelativeClosePath >> point: aPoint on: aWriteStream [

	self shouldNotImplement 
]
