Class {
	#name : #GeoPath2DDocument,
	#superclass : #Object,
	#instVars : [
		'elements',
		'seperator'
	],
	#category : #'Geo-Path2D'
}

{ #category : #accessing }
GeoPath2DDocument >> absolutePoints [

	| coll rs previousPoint command |
	coll := OrderedCollection new.
	elements do: [:element | element absolutePointsIn: coll ].
	^ coll collect: [ : point | (point x round: 3) @ (point y round: 3) ]
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

	elements
		do: [ :command | command dOn: aWriteStream separator: seperator  ]
		separatedBy: [ aWriteStream space ]
]

{ #category : #accessing }
GeoPath2DDocument >> elements [

	^ elements
]

{ #category : #initialization }
GeoPath2DDocument >> initialize [ 
	
	super initialize .
	elements := OrderedCollection new.
	seperator := Character space
]

{ #category : #accessing }
GeoPath2DDocument >> reverseElements [

	| coll first last elementsCollection command previousCommand |
	coll := OrderedCollection new.

	elementsCollection := elements copy.


	elements first isMove ifTrue: [ 
		first := elementsCollection removeFirst.
		command := first class new endPoint:
			           elementsCollection last endPoint.
		coll add: command ].
	elements first isLine ifTrue: [ 
		first := elementsCollection removeFirst.
		command := first class new
			           beginPoint: elementsCollection last endPoint;
			           endPoint: elementsCollection last endPoint.
		coll add: command ].
	elements last isClose ifTrue: [ 
		last := elementsCollection removeLast ].

	first ifNil: [ self halt ].

	first ifNotNil: [  ].

	elementsCollection reverseDo: [ :element | 
		previousCommand := command.
		command := element reverse.
		command previousCommand: previousCommand.
		coll addLast: command ].

	last ifNotNil: [ 
		previousCommand := command.
		command := last class new.
		command previousCommand: command.
		coll add: command ].
	^ coll
]

{ #category : #accessing }
GeoPath2DDocument >> scale: scaleNumber [

	| newDocument |
	newDocument := GeoPath2DDocument new.
	newDocument seperator: seperator.
	elements do: [ :element | 
		newDocument addElement: (element scale: scaleNumber) ].
	^ newDocument
]

{ #category : #accessing }
GeoPath2DDocument >> seperator [

	^ seperator
]

{ #category : #accessing }
GeoPath2DDocument >> seperator: anObject [

	seperator := anObject
]
