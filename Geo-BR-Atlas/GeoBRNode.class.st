Class {
	#name : #GeoBRNode,
	#superclass : #Object,
	#instVars : [
		'id',
		'paths',
		'point'
	],
	#category : #'Geo-BR-Atlas'
}

{ #category : #initialization }
GeoBRNode >> addPath: aPath [

	paths add: aPath
]

{ #category : #accessing }
GeoBRNode >> addPath_a: aPath [

	aPath aNode: self.
	self addPath: aPath
]

{ #category : #accessing }
GeoBRNode >> addPath_b: aPath [

	aPath bNode: self.
	self addPath: aPath
]

{ #category : #accessing }
GeoBRNode >> id [

	^ id
]

{ #category : #accessing }
GeoBRNode >> id: anObject [

	id := anObject
]

{ #category : #initialization }
GeoBRNode >> initialize [

	super initialize.
	paths := SortedCollection sortBlock: [ :pathA :pathB | 
		         (pathA thetaFromNode: self) < (pathB thetaFromNode: self) ]
]

{ #category : #accessing }
GeoBRNode >> nextPathFrom: aPath [

	"| a minTheta minPath |"
	
    "
    a - b
		  |
		  c
    "
	
	"a := aPath a = point
		     ifTrue: [ aPath b ]
		     ifFalse: [ aPath a ].
	
	minPath := nil.
	minTheta := 100.

	(paths reject: [ :path | path = aPath ]) do: [ :path | 
		| c |
		c := path a = point
			     ifTrue: [ path b ]
			     ifFalse: [ path a ].
		(a - c) theta < minTheta ifTrue: [  minTheta := (a - c) theta. minPath := path ]
		 ].
	^minPath"
	

	 ^paths at: (paths indexOf: aPath) + 1 ifAbsent: [paths first].
]

{ #category : #accessing }
GeoBRNode >> pathTo: toNode [

	^ paths detect: [ :path | 
		  path a = toNode point or: [ path b = toNode point ] ]
]

{ #category : #accessing }
GeoBRNode >> pathTo: toNode in: aDocument [

	| thePath |
	thePath := self pathTo: toNode.

	thePath a = point
		ifTrue: [ aDocument add: thePath document ]
		ifFalse: [ aDocument addReverse: thePath document ]
]

{ #category : #accessing }
GeoBRNode >> paths [
	^ paths
]

{ #category : #accessing }
GeoBRNode >> point [
	^ point
]

{ #category : #accessing }
GeoBRNode >> point: aPoint [ 
	point := aPoint
]

{ #category : #printing }
GeoBRNode >> printOn: aStream [

	aStream nextPutAll: 'n '; print: id
]
