Class {
	#name : #GeoBRInitialData,
	#superclass : #Object,
	#instVars : [
		'world'
	],
	#category : #'Geo-Birthright-Data'
}

{ #category : #accessing }
GeoBRInitialData class >> areasJson [

	^ '[]'
]

{ #category : #accessing }
GeoBRInitialData class >> bordersJson [

	^ '[]'
]

{ #category : #'instance creation' }
GeoBRInitialData class >> on: aWorld [

	^self new world: aWorld
]

{ #category : #running }
GeoBRInitialData class >> run [

	(self on: self world) run
]

{ #category : #accessing }
GeoBRInitialData >> areas [

	| areas |
	areas := (NeoJSONReader fromString: self class areasJson) collect: [ 
		         :dict | 
		         GeoBRArea new
			         d: (dict at: 'd');
			         borders: (dict at: 'borders');
			         yourself ].
	1 to: areas size do: [ :idx | (areas at: idx) id: idx ].
	^ areas
]

{ #category : #accessing }
GeoBRInitialData >> borders [

	^ (NeoJSONReader fromString: self class bordersJson) collect: [ :dict | 
		  GeoBRBorder new
			  d: (dict at: 'd');
			  yourself ]
]

{ #category : #actions }
GeoBRInitialData >> run [

	world emptyAllData.
	self script
]

{ #category : #actions }
GeoBRInitialData >> script [

	self areas do: [ :area | world repository save: area ].
	self borders do: [ :border | world repository save: border ]
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
