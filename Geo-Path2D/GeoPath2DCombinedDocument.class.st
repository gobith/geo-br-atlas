Class {
	#name : #GeoPath2DCombinedDocument,
	#superclass : #Object,
	#instVars : [
		'documents',
		'directions'
	],
	#category : #'Geo-Path2D'
}

{ #category : #initialization }
GeoPath2DCombinedDocument >> add: aDocument [

	documents add: aDocument.
	directions add: #forward
]

{ #category : #initialization }
GeoPath2DCombinedDocument >> addReverse: aDocument [

	documents add: aDocument.
	directions add: #reverse
]

{ #category : #accessing }
GeoPath2DCombinedDocument >> changeFirstCommand: aCollection commands: commands [

	| first |
	first := aCollection removeFirst.

	aCollection addFirst: (GeoPath2DAbsoluteLine new
			 beginPoint: commands last endPoint;
			 endPoint: first endPoint;
			 yourself).
	^ aCollection
]

{ #category : #accessing }
GeoPath2DCombinedDocument >> d [

	| document elements |
	document := GeoPath2DDocument new.
	elements := document elements.

	1 to: documents size do: [ :idx | 
		| doc direction |
		doc := documents at: idx.
		direction := directions at: idx.

		direction = #forward
			ifTrue: [ self document: doc dOn: elements isStart: idx = 1 ]
			ifFalse: [ 
			self document: doc reverseDOn: elements isStart: idx = 1 ] ].


	^ document d
]

{ #category : #accessing }
GeoPath2DCombinedDocument >> document: aDocument dOn: commands isStart: isStart [

	commands addAll: (isStart
			 ifTrue: [ aDocument elements ]
			 ifFalse: [ self changeFirstCommand: aDocument elements commands: commands])
]

{ #category : #private }
GeoPath2DCombinedDocument >> document: aDocument reverseDOn: commands isStart: isStart [

	commands addAll: (isStart
			 ifTrue: [ aDocument reverseElements ]
			 ifFalse: [ self changeFirstCommand: aDocument reverseElements commands: commands ])
]

{ #category : #initialization }
GeoPath2DCombinedDocument >> initialize [ 

	super initialize .
	documents := OrderedCollection new.
	directions := OrderedCollection new.
]
