Class {
	#name : #GeoPath2DRelativeLine,
	#superclass : #GeoPath2DCommand,
	#category : #'Geo-Path2D'
}

{ #category : #accessing }
GeoPath2DRelativeLine class >> commandName [

	^'l'
]

{ #category : #accessing }
GeoPath2DRelativeLine >> absolutePoint: aPoint previousPoint: aPointOrNil in: aCollection [ 
	| absolutePoint |
	absolutePoint := aPointOrNil
		                 ifNil: [ aPoint ]
		                 ifNotNil: [ aPointOrNil + aPoint ].

	aCollection add: absolutePoint.
	^ absolutePoint
]

{ #category : #accessing }
GeoPath2DRelativeLine >> createPoints: aCollection previousPoint: aPoint [

	^ { (aCollection first @ aCollection last) }
]

{ #category : #private }
GeoPath2DRelativeLine >> numberOfArguments [

	^2
]

{ #category : #accessing }
GeoPath2DRelativeLine >> point: aPoint on: aWriteStream [

	aWriteStream
		print: aPoint x;
		space;
		print: aPoint y
]
