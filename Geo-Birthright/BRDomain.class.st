Class {
	#name : #BRDomain,
	#superclass : #Object,
	#instVars : [
		'id',
		'name',
		'shortName',
		'gold',
		'court',
		'owner'
	],
	#category : #'Geo-Birthright-Domain Setup'
}

{ #category : #accessing }
BRDomain >> court [

	^ court
]

{ #category : #accessing }
BRDomain >> court: anObject [

	court := anObject
]

{ #category : #accessing }
BRDomain >> gold [

	^ gold
]

{ #category : #accessing }
BRDomain >> gold: anObject [

	gold := anObject
]

{ #category : #accessing }
BRDomain >> id [

	^ id
]

{ #category : #accessing }
BRDomain >> id: anObject [

	id := anObject
]

{ #category : #accessing }
BRDomain >> name [

	^ name
]

{ #category : #accessing }
BRDomain >> name: anObject [

	name := anObject
]

{ #category : #accessing }
BRDomain >> owner [

	^ owner
]

{ #category : #accessing }
BRDomain >> owner: anObject [

	owner := anObject
]

{ #category : #accessing }
BRDomain >> shortName [

	^ shortName
]

{ #category : #accessing }
BRDomain >> shortName: anObject [

	shortName := anObject
]
