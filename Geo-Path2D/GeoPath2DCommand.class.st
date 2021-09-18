Class {
	#name : #GeoPath2DCommand,
	#superclass : #Object,
	#category : #'Geo-Path2D'
}

{ #category : #accessing }
GeoPath2DCommand class >> commandClassFor: aString [

	^self subclasses detect: [ :cls | cls commandName = aString ]
]

{ #category : #accessing }
GeoPath2DCommand class >> commandName [ 
	self subclassResponsibility 
]

{ #category : #accessing }
GeoPath2DCommand >> commandName [

	^ self class commandName
]

{ #category : #accessing }
GeoPath2DCommand >> createPoints: aCollection previousPoint: anObject [

	self subclassResponsibility 
]

{ #category : #accessing }
GeoPath2DCommand >> point: aPoint on: aWriteStream [

	
]
