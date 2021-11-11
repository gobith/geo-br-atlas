Class {
	#name : #GeoBROwnershipAction,
	#superclass : #GeoBRAction,
	#instVars : [
		'owner',
		'subject'
	],
	#category : #'Geo-Birthright-Actions'
}

{ #category : #actions }
GeoBROwnershipAction >> doActionIn: aWorld [


	(aWorld pool at: subject) owner: (aWorld pool at: owner)
]

{ #category : #accessing }
GeoBROwnershipAction >> owner [

	^ owner
]

{ #category : #accessing }
GeoBROwnershipAction >> owner: anObject [

	owner := anObject
]

{ #category : #accessing }
GeoBROwnershipAction >> subject [

	^ subject
]

{ #category : #accessing }
GeoBROwnershipAction >> subject: anObject [

	subject := anObject
]
