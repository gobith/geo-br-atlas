Class {
	#name : #GeoBROwnershipAction,
	#superclass : #GeoBRAction,
	#instVars : [
		'regent',
		'province'
	],
	#category : #'Geo-Birthright'
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
GeoBROwnershipAction >> ownerShipUsing: aWorld [

	^ self typeClass new
		  regent: (aWorld regents at: regent);
		  province: (aWorld provinces at: province);
		  yourself
]

{ #category : #printing }
GeoBROwnershipAction >> printOn: aStream [

	aStream
	
		nextPutAll: 'Prov: ';
		nextPutAll: province;
		nextPutAll: ' regent: ';
		nextPutAll: regent;
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
GeoBROwnershipAction >> regent [

	^ regent
]

{ #category : #accessing }
GeoBROwnershipAction >> regent: anObject [

	regent := anObject
]

{ #category : #accessing }
GeoBROwnershipAction >> typeString [ 
	^self typeClass typeString
]
