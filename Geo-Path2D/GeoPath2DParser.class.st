Class {
	#name : #GeoPath2DParser,
	#superclass : #Object,
	#instVars : [
		'document',
		'stream',
		'command',
		'arguments',
		'previousPoint'
	],
	#category : #'Geo-Path2D'
}

{ #category : #'instance creation' }
GeoPath2DParser class >> on: dString [

	^self new initializeFor: dString
]

{ #category : #private }
GeoPath2DParser >> addPoints [

	| points |
	points := command
		          createPoints: arguments
		          previousPoint: previousPoint.

	points do: [ :point | document addElement: point ].
	previousPoint := points last.
	arguments removeAll
]

{ #category : #accessing }
GeoPath2DParser >> document [
	^ document
]

{ #category : #initialization }
GeoPath2DParser >> initializeFor: dString [

	stream := (dString substrings: ', ') readStream.
	arguments := OrderedCollection new.
	document := GeoPath2DDocument new.
]

{ #category : #parsing }
GeoPath2DParser >> isCommand: aString [

	^#('m' 'h' 'v' 'l' 'M' 'H' 'V' 'L' 'z' 'Z' 'c') anySatisfy: [ : each | each  = aString ]
]

{ #category : #parsing }
GeoPath2DParser >> parseDocument [

	[ stream atEnd ] whileFalse: [ 
		(self isCommand: stream peek)
			ifTrue: [ self setCommand: stream next ]
			ifFalse: [ self setArgument: stream next ] ].
	^document
]

{ #category : #private }
GeoPath2DParser >> setArgument: argument [

	arguments add: argument asNumber.

	arguments size = command numberOfArguments ifTrue: [ self addPoints ]
]

{ #category : #parsing }
GeoPath2DParser >> setCommand: aString [

	command := (GeoPath2DCommand commandClassFor: aString) new.
	document addElement: command
]

{ #category : #parsing }
GeoPath2DParser >> setCommandClass: aCommandClass [

	command := aCommandClass new.
	document addElement: command
]
