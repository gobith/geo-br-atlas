Class {
	#name : #GeoBRAction,
	#superclass : #Object,
	#category : #'Geo-Birthright-Actions'
}

{ #category : #accessing }
GeoBRAction class >> typeClass [

	self subclassResponsibility 
]

{ #category : #actions }
GeoBRAction >> doActionIn: aWorld [

	self subclassResponsibility 
]

{ #category : #actions }
GeoBRAction >> typeClass [ 
	
	^self class typeClass
]
