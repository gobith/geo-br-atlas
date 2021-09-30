Class {
	#name : #GeoBROwnership,
	#superclass : #Object,
	#instVars : [
		'regent',
		'province'
	],
	#category : #'Geo-Birthright'
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
			  regent id = anOwnership regent id ] ]
]

{ #category : #printing }
GeoBROwnership >> printOn: aStream [

	aStream
		nextPutAll: regent name;
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
GeoBROwnership >> regent [

	^ regent
]

{ #category : #accessing }
GeoBROwnership >> regent: anObject [

	regent := anObject
]

{ #category : #accessing }
GeoBROwnership >> typeString [ 

	^self class typeString
]
