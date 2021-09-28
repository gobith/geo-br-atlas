Class {
	#name : #GeoBRCombinedPath,
	#superclass : #Object,
	#instVars : [
		'paths',
		'd'
	],
	#category : #'Geo-BR-Atlas'
}

{ #category : #'instance creation' }
GeoBRCombinedPath class >> on: aCollection [ 
	^self new paths: aCollection
]

{ #category : #accessing }
GeoBRCombinedPath >> createD [

	| absolutePathPoints absolutePoints beginPoint idx ws |
	idx := 0.
	absolutePoints := OrderedCollection new.

	absolutePathPoints := paths collect: [ :path | 
		                      path document absolutePoints ].

	absolutePoints addAll: absolutePathPoints first.
	absolutePathPoints removeFirst.

	beginPoint := absolutePoints first.

	[ absolutePoints last = beginPoint or: [ idx = 100 ] ] 
		whileFalse: [ 
			| pathPoints isReverse |
			idx := idx + 1.
			absolutePathPoints do: [ :points | 
				pathPoints ifNil: [ 
					points first = absolutePoints last ifTrue: [ 
						isReverse := false.
						pathPoints := points ].
					points last = absolutePoints last ifTrue: [ 
						isReverse := true.
						pathPoints := points ] ] ].

			pathPoints ifNotNil: [ 
				| pointsToAdd |
				absolutePathPoints remove: pathPoints.
				pointsToAdd := isReverse
					               ifTrue: [ pathPoints reverse ]
					               ifFalse: [ pathPoints ].
				pointsToAdd removeFirst.
				absolutePoints addAll: pointsToAdd ] ].
	idx = 100 ifTrue: [ self halt ].
	
	ws := String new writeStream.
	ws nextPutAll: 'M '.

	absolutePoints
		do: [ :point | 
			ws
				print: point x;
				space;
				print: point y ]
		separatedBy: [ ws space ].
	^ ws contents
]

{ #category : #accessing }
GeoBRCombinedPath >> d [

	d ifNil: [ d := self createD ].
	^d
]

{ #category : #accessing }
GeoBRCombinedPath >> paths [

	^ paths
]

{ #category : #accessing }
GeoBRCombinedPath >> paths: anObject [

	paths := anObject
]
