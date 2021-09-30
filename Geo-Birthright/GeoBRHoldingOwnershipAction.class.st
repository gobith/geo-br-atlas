Class {
	#name : #GeoBRHoldingOwnershipAction,
	#superclass : #GeoBROwnershipAction,
	#instVars : [
		'level'
	],
	#category : #'Geo-Birthright-Actions'
}

{ #category : #accessing }
GeoBRHoldingOwnershipAction class >> typeClass [

	self shouldNotImplement  
]

{ #category : #accessing }
GeoBRHoldingOwnershipAction >> level [

	^ level
]

{ #category : #accessing }
GeoBRHoldingOwnershipAction >> level: anObject [

	level := anObject
]

{ #category : #accessing }
GeoBRHoldingOwnershipAction >> ownerShipUsing: aWorld [

	^ (super ownerShipUsing: aWorld)
		  level: level;
		  yourself
]

{ #category : #printing }
GeoBRHoldingOwnershipAction >> printOn: aStream [

	super printOn: aStream.
	aStream
		nextPutAll: ' lvl ';
		print: level
]
