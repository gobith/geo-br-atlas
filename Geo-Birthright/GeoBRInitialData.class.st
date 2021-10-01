Class {
	#name : #GeoBRInitialData,
	#superclass : #Object,
	#instVars : [
		'world'
	],
	#category : #'Geo-Birthright-Data'
}

{ #category : #'instance creation' }
GeoBRInitialData class >> on: aWorld [

	^self new world: aWorld
]

{ #category : #running }
GeoBRInitialData class >> run [

	(self on: self world) run
]

{ #category : #actions }
GeoBRInitialData >> run [

	world emptyAllData.
	self script
]

{ #category : #actions }
GeoBRInitialData >> takeAction: anAction [

	| action |
	action := world takeAction: anAction.
	^action id
]

{ #category : #accessing }
GeoBRInitialData >> world [

	^ world
]

{ #category : #accessing }
GeoBRInitialData >> world: anObject [

	world := anObject
]
