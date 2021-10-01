Class {
	#name : #GeoBRSourceHoldingOwnership,
	#superclass : #GeoBRHoldingOwnership,
	#category : #'Geo-Birthright-Ownership'
}

{ #category : #printing }
GeoBRSourceHoldingOwnership class >> typeString [

	^'Source'
]

{ #category : #testing }
GeoBRSourceHoldingOwnership >> isSource [

	^ true
]
