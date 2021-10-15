Class {
	#name : #GeoPath2DCommand,
	#superclass : #Object,
	#instVars : [
		'previousCommand',
		'beginPoint',
		'endPoint'
	],
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
GeoPath2DCommand >> absolutePointsIn: aCollection [ 
	aCollection add: endPoint
]

{ #category : #accessing }
GeoPath2DCommand >> beginPoint [

	^ beginPoint
]

{ #category : #accessing }
GeoPath2DCommand >> beginPoint: aPoint [

	beginPoint := aPoint
]

{ #category : #accessing }
GeoPath2DCommand >> commandName [

	^ self class commandName
]

{ #category : #accessing }
GeoPath2DCommand >> commandNameOn: aWriteStream [

	(previousCommand notNil and: [ 
		 previousCommand commandName = self commandName ]) ifTrue: [ ^ self ].


	aWriteStream nextPutAll: self commandName.

	self ensureSpaceOn: aWriteStream
]

{ #category : #accessing }
GeoPath2DCommand >> createPoints: aCollection previousCommand: aCommand [

	previousCommand := aCommand.
	beginPoint := aCommand ifNotNil: [ aCommand endPoint ]
]

{ #category : #accessing }
GeoPath2DCommand >> dOn: aWriteStream separator: separator [

	self commandNameOn: aWriteStream.
	self pointsOn: aWriteStream separator: separator 
]

{ #category : #accessing }
GeoPath2DCommand >> endPoint [

	^endPoint
]

{ #category : #accessing }
GeoPath2DCommand >> endPoint: aPoint [

	endPoint := aPoint
]

{ #category : #printing }
GeoPath2DCommand >> ensureSpaceOn: aWriteStream [

	aWriteStream space
]

{ #category : #testing }
GeoPath2DCommand >> isClose [

	^false
]

{ #category : #testing }
GeoPath2DCommand >> isLine [

	^false
]

{ #category : #testing }
GeoPath2DCommand >> isMove [

	^false
]

{ #category : #accessing }
GeoPath2DCommand >> nextCommandClass [

	^nil
]

{ #category : #accessing }
GeoPath2DCommand >> point: aPoint on: aWriteStream [

	
]

{ #category : #accessing }
GeoPath2DCommand >> pointsOn: aWriteStream separator: anObject [

	
]

{ #category : #accessing }
GeoPath2DCommand >> previousCommand [

	^ previousCommand
]

{ #category : #accessing }
GeoPath2DCommand >> previousCommand: anObject [

	previousCommand := anObject
]

{ #category : #converting }
GeoPath2DCommand >> reverse [

	^ self class new
		  beginPoint: endPoint;
		  endPoint: beginPoint;
		  yourself
]

{ #category : #accessing }
GeoPath2DCommand >> scale: scaleNumber [

	| command |
	command := self copy.
	command beginPoint: (beginPoint ifNotNil: [ 
			 (beginPoint scaleBy: scaleNumber @ scaleNumber) round: 3 ]).
	command endPoint: (endPoint ifNotNil: [ 
			 (endPoint scaleBy: scaleNumber @ scaleNumber) round: 3 ]).
	^ command
]

{ #category : #accessing }
GeoPath2DCommand >> x [
	^self endPoint x
]

{ #category : #accessing }
GeoPath2DCommand >> y [
	^self endPoint y
]
