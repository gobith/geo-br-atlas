Class {
	#name : #GeoBRWorld,
	#superclass : #Object,
	#instVars : [
		'provinces',
		'regents',
		'ownerships',
		'actions'
	],
	#category : #'Geo-Birthright'
}

{ #category : #accessing }
GeoBRWorld >> actions [

	^ actions 
]

{ #category : #actions }
GeoBRWorld >> addAction: anOwnershipAction [

	actions add: anOwnershipAction
]

{ #category : #actions }
GeoBRWorld >> doOwnershipAction: anOwnershipAction [

	self addAction: anOwnershipAction

]

{ #category : #initialization }
GeoBRWorld >> initialize [ 

	super initialize.
	provinces := Dictionary new.
	regents := Dictionary new.
	ownerships := OrderedCollection new.
	actions := OrderedCollection new
]

{ #category : #accessing }
GeoBRWorld >> ownerships [

	^ ownerships
]

{ #category : #accessing }
GeoBRWorld >> provinceAt: provinceId [

	^provinces at: provinceId 
]

{ #category : #accessing }
GeoBRWorld >> provinces [

	^ provinces
]

{ #category : #accessing }
GeoBRWorld >> regents [

	^ regents
]

{ #category : #actions }
GeoBRWorld >> replay [

	self reset.
	actions do: [ :action | action doActionIn: self ]
]

{ #category : #actions }
GeoBRWorld >> reset [ 
	
	provinces do: [ :province | province reset ]
]
