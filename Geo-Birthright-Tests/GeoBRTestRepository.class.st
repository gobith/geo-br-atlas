Class {
	#name : #GeoBRTestRepository,
	#superclass : #Object,
	#instVars : [
		'contents'
	],
	#category : #'Geo-Birthright-Tests'
}

{ #category : #initialization }
GeoBRTestRepository >> initialize [ 

	super initialize.
	contents := OrderedCollection new
]

{ #category : #actions }
GeoBRTestRepository >> removeAll: aClass [ 

	contents := contents reject: [ : each | each class = aClass ]
]

{ #category : #actions }
GeoBRTestRepository >> save: anObject [

	contents add: anObject 
]

{ #category : #actions }
GeoBRTestRepository >> selectAll: aClass [ 

	^ contents select: [ : each | each class = aClass ]
]
