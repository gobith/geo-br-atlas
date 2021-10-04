Class {
	#name : #GeoBRTestRepository,
	#superclass : #Object,
	#instVars : [
		'actions'
	],
	#category : #'Geo-Birthright-Tests'
}

{ #category : #initialization }
GeoBRTestRepository >> initialize [ 

	super initialize.
	actions := OrderedCollection new
]

{ #category : #actions }
GeoBRTestRepository >> removeAll: aClass [ 

	actions := OrderedCollection new
]

{ #category : #actions }
GeoBRTestRepository >> save: anActionWrapper [

	actions add: anActionWrapper 
]

{ #category : #actions }
GeoBRTestRepository >> selectAll: aClass [ 

	^actions
]
