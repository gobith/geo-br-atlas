Class {
	#name : #GeoBRTerrain,
	#superclass : #Object,
	#instVars : [
		'modifiers'
	],
	#category : #'Geo-Birthright-Terrain'
}

{ #category : #accessing }
GeoBRTerrain class >> neoJsonMappingOn: mapping [

	mapping
		mapAccessor: #name;
		mapAccessor: #potential;
		mapAccessor: #modifiers;
		mapAccessor: #colorHex to: #color
]

{ #category : #accessing }
GeoBRTerrain class >> potential [

	^self subclassResponsibility 
]

{ #category : #accessing }
GeoBRTerrain class >> terrainName [

	^''
]

{ #category : #accessing }
GeoBRTerrain >> addModifier: anInteger [

	modifiers add: anInteger
]

{ #category : #accessing }
GeoBRTerrain >> color [

	^ Color lightYellow lighter lighter
]

{ #category : #accessing }
GeoBRTerrain >> colorHex [

	^self color asHTMLColor 
]

{ #category : #initialization }
GeoBRTerrain >> initialize [

	super initialize.
	modifiers := OrderedCollection new
]

{ #category : #accessing }
GeoBRTerrain >> modifier: anInteger [

	self addModifier: (GeoBRTerrainModifier new modifier: anInteger)
]

{ #category : #accessing }
GeoBRTerrain >> modifiers [

	^ modifiers
]

{ #category : #accessing }
GeoBRTerrain >> name [

	^self class terrainName
]

{ #category : #accessing }
GeoBRTerrain >> potential [ 

	^self class potential + (modifiers sum: [ :modifier | modifier modifier ])
]
