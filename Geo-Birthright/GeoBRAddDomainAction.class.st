Class {
	#name : #GeoBRAddDomainAction,
	#superclass : #GeoBRAction,
	#instVars : [
		'id',
		'name',
		'abbr'
	],
	#category : #'Geo-Birthright-Actions'
}

{ #category : #accessing }
GeoBRAddDomainAction class >> typeClass [

	^ GeoBRDomain
]

{ #category : #accessing }
GeoBRAddDomainAction >> abbr [

	^ abbr
]

{ #category : #accessing }
GeoBRAddDomainAction >> abbr: anObject [

	abbr := anObject
]

{ #category : #actions }
GeoBRAddDomainAction >> doActionIn: aWorld [

	| domain |
	domain := self typeClass new.
	domain id: id.
	domain name: name.
	domain abbr: abbr.
	domain gold: 0.
	aWorld domains at: domain id put: domain.
	aWorld pool at: domain id put: domain
]

{ #category : #accessing }
GeoBRAddDomainAction >> ensureId [

	id ifNil: [ id := UUID new asString ]
]

{ #category : #accessing }
GeoBRAddDomainAction >> id [

	^ id
]

{ #category : #accessing }
GeoBRAddDomainAction >> id: anObject [

	id := anObject
]

{ #category : #accessing }
GeoBRAddDomainAction >> name [

	^ name
]

{ #category : #accessing }
GeoBRAddDomainAction >> name: anObject [

	name := anObject
]
