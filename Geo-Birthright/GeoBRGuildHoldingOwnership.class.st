Class {
	#name : #GeoBRGuildHoldingOwnership,
	#superclass : #GeoBRHoldingOwnership,
	#category : #'Geo-Birthright-Ownership'
}

{ #category : #printing }
GeoBRGuildHoldingOwnership class >> typeString [

	^'Guild'
]

{ #category : #testing }
GeoBRGuildHoldingOwnership >> isGuild [

	^ true
]
