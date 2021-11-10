Class {
	#name : #GeoBRProvinceArea,
	#superclass : #GeoBRArea,
	#instVars : [
		'province'
	],
	#category : #'Geo-BR-Atlas'
}

{ #category : #accessing }
GeoBRProvinceArea class >> neoJsonMappingOn: mapping [

	super neoJsonMappingOn: mapping.
	mapping mapAccessor: #province
]

{ #category : #accessing }
GeoBRProvinceArea >> province [

	^ province
]

{ #category : #accessing }
GeoBRProvinceArea >> province: anObject [

	province := anObject
]
