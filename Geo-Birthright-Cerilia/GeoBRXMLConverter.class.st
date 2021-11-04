Class {
	#name : #GeoBRXMLConverter,
	#superclass : #Object,
	#instVars : [
		'document'
	],
	#category : #'Geo-Birthright-Cerilia-Converting'
}

{ #category : #accessing }
GeoBRXMLConverter >> legendElements [

	^document allElementsNamed: 'legend'
]

{ #category : #accessing }
GeoBRXMLConverter >> legendFromElement: anElement [

	| legend array |
	legend := GeoBRXMLLegend new.
	legend id: (anElement attributeAt: 'id').

	array := anElement nodes first string substrings: '()'.

	legend name: array first.
	legend domain: (array at: 2 ifAbsent: nil).
	
	array size > 2 ifTrue: [ self halt ].
	
	^ legend
]

{ #category : #accessing }
GeoBRXMLConverter >> legends [

	^ self legendElements collect: [ :element | 
		  self legendFromElement: element ]
]

{ #category : #parsing }
GeoBRXMLConverter >> parse [

	'/home/georges/Geo BR Atlas/Birthright.Dataset.v13/database/domains.xml'
		asFileReference readStreamDo: [ :readStream | 
		document := (XMLDOMParser on: readStream) optimizeForLargeDocuments
			            parseDocument ]
]

{ #category : #accessing }
GeoBRXMLConverter >> provinceElements [

	^document allElementsNamed: 'province'
]

{ #category : #accessing }
GeoBRXMLConverter >> provinceFromElement: anElement [

	| province |
	province := GeoBRXMLProvince new.
	province name: (anElement attributeAt: 'name').
	province level: (anElement attributeAt: 'level') asNumber.
	province magic: (anElement attributeAt: 'magic').
	province realm: (anElement attributeAt: 'realm').

	province holdings: ((anElement allElements
			  removeFirst;
			  yourself) collect: [ :holdingElement | 
			 | holding |
			 holding := GeoBRXMLHolding new.
			 holding type: holdingElement name.
			 holding level: (holdingElement attributeAt: 'l').
			 holding owner: holdingElement nodes first string ]).

	^ province
]

{ #category : #accessing }
GeoBRXMLConverter >> provinces [

	^ self provinceElements collect: [ :element | 
		  self provinceFromElement: element ]
]
