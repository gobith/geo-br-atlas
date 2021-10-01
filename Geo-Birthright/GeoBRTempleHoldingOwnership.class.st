Class {
	#name : #GeoBRTempleHoldingOwnership,
	#superclass : #GeoBRHoldingOwnership,
	#category : #'Geo-Birthright-Ownership'
}

{ #category : #printing }
GeoBRTempleHoldingOwnership class >> typeString [

	^'Temple'
]

{ #category : #testing }
GeoBRTempleHoldingOwnership >> isTemple [

	^ true
]
