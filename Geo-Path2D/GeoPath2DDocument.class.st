Class {
	#name : #GeoPath2DDocument,
	#superclass : #Object,
	#instVars : [
		'elements'
	],
	#category : #'Geo-Path2D'
}

{ #category : #accessing }
GeoPath2DDocument >> absolutePoints [

	| coll rs previousPoint command |
	coll := OrderedCollection new.
	rs := elements readStream.
	previousPoint := nil.
	command := nil.

	[ rs atEnd ] whileFalse: [ 
		| element |
		element := rs next.
		element isPoint
			ifTrue: [ 
				previousPoint := command
					absolutePoint: element
					previousPoint: previousPoint
					in: coll ]
			ifFalse: [ command := element ] ].
	^ coll collect: [ : point | (point x round: 4) @ (point y round: 4) ]
]

{ #category : #accessing }
GeoPath2DDocument >> addElement: anElement [

	elements add: anElement
]

{ #category : #accessing }
GeoPath2DDocument >> d [

	| ws |
	ws := String new writeStream.
	self dOn: ws.
	^ws contents
]

{ #category : #accessing }
GeoPath2DDocument >> dOn: aWriteStream [

	| command |
	elements
		do: [ :element | 
			element isPoint
				ifTrue: [ command point: element on: aWriteStream ]
				ifFalse: [ 
					command := element.
					aWriteStream nextPutAll: command commandName ] ]
		separatedBy: [ aWriteStream space ]
]

{ #category : #initialization }
GeoPath2DDocument >> initialize [ 
	
	super initialize .
	elements := OrderedCollection new
]
