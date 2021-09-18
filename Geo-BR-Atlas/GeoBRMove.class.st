Class {
	#name : #GeoBRMove,
	#superclass : #GeoBRPathCommand,
	#category : #'Geo-BR-Atlas'
}

{ #category : #accessing }
GeoBRMove >> prettyPrintOn: ws [

	ws nextPut: $M.
	ws space.
	ws print: x.
	ws nextPut: $, .
	ws print: y
]

{ #category : #accessing }
GeoBRMove >> x: xNumber y: yNumber previous: previous [


	x := xNumber.
	y := yNumber
]
