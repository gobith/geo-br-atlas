Class {
	#name : #GeoBRHoldingOwnership,
	#superclass : #GeoBROwnership,
	#instVars : [
		'level'
	],
	#category : #'Geo-Birthright-Ownership'
}

{ #category : #printing }
GeoBRHoldingOwnership class >> typeString [

	self shouldNotImplement 
]

{ #category : #accessing }
GeoBRHoldingOwnership >> level [

	^ level
]

{ #category : #accessing }
GeoBRHoldingOwnership >> level: anObject [

	level := anObject
]

{ #category : #printing }
GeoBRHoldingOwnership >> printOn: aStream [

	super printOn: aStream.
	aStream
		nextPutAll: ' - ';
		nextPutAll: self typeString;
		space;
		print: self level
]

{ #category : #accessing }
GeoBRHoldingOwnership >> regencyPoints [ 

	^level
]
