Class {
	#name : #GeoBROwnershipAction,
	#superclass : #GeoBRAction,
	#instVars : [
		'ruler',
		'owner',
		'province'
	],
	#category : #'Geo-Birthright-Actions'
}

{ #category : #accessing }
GeoBROwnershipAction class >> typeClass [

	self shouldNotImplement  
]

{ #category : #actions }
GeoBROwnershipAction >> doActionIn: aWorld [

	| ownership |
	ownership := self ownerShipUsing: aWorld.


	aWorld ownerships removeAllSuchThat: [ :each | 
		each isSameAs: ownership ].
	ownership province ownerships removeAllSuchThat: [ :each | 
		each isSameAs: ownership ].


	aWorld ownerships add: ownership .
	ownership province ownerships add: ownership 
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
GeoBROwnershipAction >> ownerShipUsing: aWorld [

	^ self typeClass new
		  owner: (aWorld poolAt: owner);
		  ruler: (aWorld poolAt: ruler);
		  province: (aWorld poolAt: province);
		  yourself
]

{ #category : #printing }
GeoBROwnershipAction >> printOn: aStream [

	aStream
	
		nextPutAll: 'Prov: ';
		nextPutAll: province;
		nextPutAll: ' - owner: ';
		nextPutAll: owner;
		nextPutAll: ' - ruler: ';
		nextPutAll: ruler;
		space;
		nextPutAll: self typeString
]

{ #category : #accessing }
GeoBROwnershipAction >> province [

	^ province
]

{ #category : #accessing }
GeoBROwnershipAction >> province: anObject [

	province := anObject
]

{ #category : #accessing }
GeoBROwnershipAction >> ruler [

	^ ruler
]

{ #category : #accessing }
GeoBROwnershipAction >> ruler: anObject [

	ruler := anObject
]

{ #category : #accessing }
GeoBROwnershipAction >> typeString [ 
	^self typeClass typeString
]
