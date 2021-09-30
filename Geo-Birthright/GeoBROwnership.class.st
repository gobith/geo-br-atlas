Class {
	#name : #GeoBROwnership,
	#superclass : #Object,
	#instVars : [
		'ruler',
		'owner',
		'province'
	],
	#category : #'Geo-Birthright-Ownership'
}

{ #category : #printing }
GeoBROwnership class >> typeString [ 

	^self subclassResponsibility 
]

{ #category : #actions }
GeoBROwnership >> addTo: aWorld [


	aWorld ownerships removeAllSuchThat: [ :ownership | ownership isSameAs: self ].
	province ownerships removeAllSuchThat: [ :ownership | ownership isSameAs: self ].


	aWorld ownerships add: self.
	province ownerships add: self
]

{ #category : #testing }
GeoBROwnership >> isSameAs: anOwnership [

	^ self typeString = anOwnership typeString and: [ 
		  province id = anOwnership province id and: [ 
			  ruler id = anOwnership ruler id or: [ 
				  owner id = anOwnership owner id ] ] ]
]

{ #category : #accessing }
GeoBROwnership >> owner [

	^ owner
]

{ #category : #accessing }
GeoBROwnership >> owner: anObject [

	owner := anObject
]

{ #category : #printing }
GeoBROwnership >> printOn: aStream [

	aStream
		nextPutAll: 'Owner: ';
		nextPutAll: owner name;
		nextPutAll: ' - ruler: ';
		nextPutAll: ruler name;
		nextPutAll: ' - ';
		nextPutAll: province name
]

{ #category : #accessing }
GeoBROwnership >> province [

	^ province
]

{ #category : #accessing }
GeoBROwnership >> province: anObject [

	province := anObject
]

{ #category : #accessing }
GeoBROwnership >> regencyPoints [ 

	^self subclassResponsibility 
]

{ #category : #accessing }
GeoBROwnership >> regencyPointsFor: aRegent [

	^ aRegent = owner
		  ifTrue: [ self regencyPoints ]
		  ifFalse: [ 0 ]
]

{ #category : #accessing }
GeoBROwnership >> ruler [

	^ ruler
]

{ #category : #accessing }
GeoBROwnership >> ruler: anObject [

	ruler := anObject
]

{ #category : #accessing }
GeoBROwnership >> typeString [ 

	^self class typeString
]
