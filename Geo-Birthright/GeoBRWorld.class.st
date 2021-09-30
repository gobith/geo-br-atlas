Class {
	#name : #GeoBRWorld,
	#superclass : #Object,
	#instVars : [
		'provinces',
		'regents',
		'ownerships'
	],
	#category : #'Geo-Birthright'
}

{ #category : #actions }
GeoBRWorld >> addOwnership: anOwnership [

	ownerships add: anOwnership
]

{ #category : #initialization }
GeoBRWorld >> initialize [ 

	super initialize.
	provinces := Dictionary new.
	regents := Dictionary new.
	ownerships := OrderedCollection new
]

{ #category : #accessing }
GeoBRWorld >> ownerships [

	^ ownerships
]

{ #category : #accessing }
GeoBRWorld >> provinces [

	^ provinces
]

{ #category : #accessing }
GeoBRWorld >> regents [

	^ regents
]
