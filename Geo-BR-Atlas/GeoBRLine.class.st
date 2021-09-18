Class {
	#name : #GeoBRLine,
	#superclass : #GeoBRPathCommand,
	#instVars : [
		'deltaX',
		'deltaY'
	],
	#category : #'Geo-BR-Atlas'
}

{ #category : #accessing }
GeoBRLine >> deltaX [

	^ deltaX
]

{ #category : #accessing }
GeoBRLine >> deltaX: anObject [

	deltaX := anObject
]

{ #category : #accessing }
GeoBRLine >> deltaY [

	^ deltaY
]

{ #category : #accessing }
GeoBRLine >> deltaY: anObject [

	deltaY := anObject
]

{ #category : #accessing }
GeoBRLine >> prettyPrintOn: ws [


	ws print: x.
	ws nextPut: $, .
	ws print: y
]

{ #category : #accessing }
GeoBRLine >> x: xNumber y: yNumber previous: previous [


	deltaX := xNumber.
	deltaY := yNumber.
	
	x := (previous x + deltaX).
	y := (previous y + deltaY) 
]
