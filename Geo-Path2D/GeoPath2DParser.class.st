Class {
	#name : #GeoPath2DParser,
	#superclass : #Object,
	#instVars : [
		'document',
		'stream',
		'command',
		'arguments',
		'previousPoint',
		'commandClass'
	],
	#category : #'Geo-Path2D'
}

{ #category : #'instance creation' }
GeoPath2DParser class >> on: dString [

	^self new initializeFor: dString
]

{ #category : #private }
GeoPath2DParser >> addCommand [

	| previousCommand |
	previousCommand := command.
	command := commandClass new.
	command
		          createPoints: arguments
		          previousCommand: previousCommand.

	document addElement: command.
	previousCommand := command.
	command nextCommandClass ifNotNil: [: nextCommandClass | commandClass := nextCommandClass ].
	arguments removeAll
]

{ #category : #accessing }
GeoPath2DParser >> document [
	^ document
]

{ #category : #initialization }
GeoPath2DParser >> initializeFor: dString [

	stream := (dString substrings: ', +') readStream.
	arguments := OrderedCollection new.
	document := GeoPath2DDocument new.
]

{ #category : #parsing }
GeoPath2DParser >> isCommand: aString [

	^#('m' 'h' 'v' 'l' 'M' 'H' 'V' 'L' 'z' 'Z' 'c' 'C') anySatisfy: [ : each | each  = aString ]
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

	arguments size = commandClass numberOfArguments ifTrue: [ self addCommand ]
]

{ #category : #parsing }
GeoPath2DParser >> setCommand: aString [

	commandClass := GeoPath2DCommand commandClassFor: aString.
	
	commandClass numberOfArguments = 0  ifTrue: [ self addCommand ]
]
