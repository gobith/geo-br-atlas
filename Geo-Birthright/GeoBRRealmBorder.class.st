Class {
	#name : #GeoBRRealmBorder,
	#superclass : #Object,
	#instVars : [
		'owner',
		'borders'
	],
	#category : #'Geo-Birthright-Domain'
}

{ #category : #accessing }
GeoBRRealmBorder class >> neoJsonMappingOn: mapping [

	mapping 
		mapAccessor: #ownerId to: #owner;
		mapAccessor: #borders
]

{ #category : #accessing }
GeoBRRealmBorder >> borders [

	^ borders
]

{ #category : #accessing }
GeoBRRealmBorder >> borders: anObject [

	borders := anObject
]

{ #category : #accessing }
GeoBRRealmBorder >> owner [

	^ owner
]

{ #category : #accessing }
GeoBRRealmBorder >> owner: anObject [

	owner := anObject
]

{ #category : #accessing }
GeoBRRealmBorder >> ownerId [ 
	^owner id
]
