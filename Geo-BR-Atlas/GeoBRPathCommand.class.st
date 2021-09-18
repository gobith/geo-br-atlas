Class {
	#name : #GeoBRPathCommand,
	#superclass : #Object,
	#instVars : [
		'x',
		'y'
	],
	#category : #'Geo-BR-Atlas'
}

{ #category : #accessing }
GeoBRPathCommand >> x [

	^ x
]

{ #category : #accessing }
GeoBRPathCommand >> x: anObject [

	x := anObject
]

{ #category : #accessing }
GeoBRPathCommand >> x: xNumber y: yNumber previous: previous [

	self subclassResponsibility  
	
]

{ #category : #accessing }
GeoBRPathCommand >> y [

	^ y
]

{ #category : #accessing }
GeoBRPathCommand >> y: anObject [

	y := anObject
]
