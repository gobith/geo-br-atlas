Class {
	#name : #GeoBRCerilliaTests,
	#superclass : #TestCase,
	#instVars : [
		'world'
	],
	#category : #'Geo-Birthright-Cerilia-Tests'
}

{ #category : #initialization }
GeoBRCerilliaTests >> setUp [

	world := GeoBRWorld new.
	world repository: GeoBRTestRepository new
]

{ #category : #tests }
GeoBRCerilliaTests >> test001 [

	(GeoBRCerilia on: world) run.
	world inspect
]
