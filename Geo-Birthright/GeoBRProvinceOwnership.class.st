Class {
	#name : #GeoBRProvinceOwnership,
	#superclass : #GeoBROwnership,
	#category : #'Geo-Birthright-Ownership'
}

{ #category : #printing }
GeoBRProvinceOwnership class >> typeString [ 

	^'Province'
]

{ #category : #accessing }
GeoBRProvinceOwnership >> regencyPoints [ 

	^province level
]
