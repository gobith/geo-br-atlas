Class {
	#name : #GeoBRHoldingOwnership,
	#superclass : #GeoBROwnership,
	#instVars : [
		'level'
	],
	#category : #'Geo-Birthright'
}

{ #category : #accessing }
GeoBRHoldingOwnership >> level [

	^ level
]

{ #category : #accessing }
GeoBRHoldingOwnership >> level: anObject [

	level := anObject
]
