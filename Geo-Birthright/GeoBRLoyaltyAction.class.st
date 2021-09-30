Class {
	#name : #GeoBRLoyaltyAction,
	#superclass : #GeoBRAction,
	#instVars : [
		'province'
	],
	#category : #'Geo-Birthright-Actions'
}

{ #category : #accessing }
GeoBRLoyaltyAction class >> typeClass [

	self shouldNotImplement  
]

{ #category : #actions }
GeoBRLoyaltyAction >> doActionIn: aWorld [


	(aWorld provinceAt: province) loyalty: self typeClass new 
]

{ #category : #accessing }
GeoBRLoyaltyAction >> province [

	^ province
]

{ #category : #accessing }
GeoBRLoyaltyAction >> province: anObject [

	province := anObject
]
