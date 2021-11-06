Class {
	#name : #GeoBROwnershipAction2,
	#superclass : #GeoBRAction,
	#instVars : [
		'owner',
		'subject'
	],
	#category : #'Geo-Birthright-Actions'
}

{ #category : #actions }
GeoBROwnershipAction2 >> doActionIn: aWorld [


	(aWorld pool at: subject) owner: (aWorld pool at: owner)
]

{ #category : #accessing }
GeoBROwnershipAction2 >> owner [

	^ owner
]

{ #category : #accessing }
GeoBROwnershipAction2 >> owner: anObject [

	owner := anObject
]

{ #category : #accessing }
GeoBROwnershipAction2 >> subject [

	^ subject
]

{ #category : #accessing }
GeoBROwnershipAction2 >> subject: anObject [

	subject := anObject
]
