Class {
	#name : #GeoBRActionWrapper,
	#superclass : #Object,
	#instVars : [
		'action',
		'dateAndTime'
	],
	#category : #'Geo-Birthright-Actions'
}

{ #category : #testing }
GeoBRActionWrapper class >> isVoyageRoot [

	^true
]

{ #category : #accessing }
GeoBRActionWrapper >> action [

	^ action
]

{ #category : #accessing }
GeoBRActionWrapper >> action: anObject [

	action := anObject
]

{ #category : #accessing }
GeoBRActionWrapper >> dateAndTime [

	^ dateAndTime
]

{ #category : #accessing }
GeoBRActionWrapper >> dateAndTime: anObject [

	dateAndTime := anObject
]
