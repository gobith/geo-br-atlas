Class {
	#name : #GeoBRLoyalty,
	#superclass : #Object,
	#category : #'Geo-Birthright-Loyalty'
}

{ #category : #printing }
GeoBRLoyalty class >> typeString [ 

	^self subclassResponsibility 
]

{ #category : #printing }
GeoBRLoyalty >> typeString [ 

	^self class typeString
]
