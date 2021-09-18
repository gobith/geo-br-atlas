Class {
	#name : #GeoBRArea,
	#superclass : #Object,
	#instVars : [
		'name',
		'pathIds',
		'combinedPath'
	],
	#category : #'Geo-BR-Atlas'
}

{ #category : #accessing }
GeoBRArea >> combinePath [
	self shouldBeImplemented.
]

{ #category : #accessing }
GeoBRArea >> combinedPath [

	^ combinedPath
]

{ #category : #accessing }
GeoBRArea >> combinedPath: anObject [

	combinedPath := anObject
]

{ #category : #accessing }
GeoBRArea >> createCombinedPathUsing: pathCollection [

	| paths |
	paths := OrderedCollection new.
	pathCollection do: [ :path |
		(pathIds includes: path id) ifTrue: [paths add: path]].
	combinedPath := GeoBRCombinedPath on: paths
]

{ #category : #accessing }
GeoBRArea >> name [

	^ name
]

{ #category : #accessing }
GeoBRArea >> name: anObject [

	name := anObject
]

{ #category : #accessing }
GeoBRArea >> pathIds [

	^ pathIds
]

{ #category : #accessing }
GeoBRArea >> pathIds: anObject [

	pathIds := anObject
]
