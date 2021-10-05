"
https://annarchive.com/files/Drmg221.pdf
"
Class {
	#name : #GeoBRTheLeyOfTheLand,
	#superclass : #GeoBRInitialData,
	#instVars : [
		'artorus',
		'brianna',
		'clio',
		'aeluin',
		'apex',
		'armor',
		'absal',
		'abbotHill',
		'aldiss',
		'boran',
		'castledowns',
		'carp',
		'caidiff',
		'connor',
		'coldfell',
		'cardian',
		'brost',
		'brookley',
		'bulle',
		'boatswain',
		'bendersford',
		'brokenstand',
		'corina'
	],
	#category : #'Geo-Birthright-Data'
}

{ #category : #accessing }
GeoBRTheLeyOfTheLand class >> areasJson [

	| areas |
	areas := self grid areas reject: [ : each | (each at: 'borders') size = 13 ].

	^ NeoJSONWriter toStringPretty: areas
]

{ #category : #accessing }
GeoBRTheLeyOfTheLand class >> bordersJson [

	^ NeoJSONWriter toStringPretty: self grid borders
]

{ #category : #accessing }
GeoBRTheLeyOfTheLand class >> paths [

	^ (GeoBRPathParser onFileNamed: '/home/georges/Geo BR Atlas/ley_of_the_land_002.svg') parse
]

{ #category : #accessing }
GeoBRTheLeyOfTheLand >> script [

	super script.
	self scriptRegents.
	self scriptProvinces.
	self scriptProvinceOwnerships.
]

{ #category : #accessing }
GeoBRTheLeyOfTheLand >> scriptProvinceOwnerships [

	self takeAction: (GeoBRProvinceOwnershipAction new province: aeluin; owner: aldiss; ruler: aldiss).
	self takeAction: (GeoBRProvinceOwnershipAction new province: armor; owner: aldiss; ruler: aldiss).
	self takeAction: (GeoBRProvinceOwnershipAction new province: apex; owner: aldiss; ruler: aldiss).
	self takeAction: (GeoBRProvinceOwnershipAction new province: abbotHill ; owner: aldiss; ruler: aldiss).
	self takeAction: (GeoBRProvinceOwnershipAction new province: absal; owner: aldiss; ruler: aldiss).
	
	self takeAction: (GeoBRProvinceOwnershipAction new province: brost; owner: boran; ruler: boran).
	self takeAction: (GeoBRProvinceOwnershipAction new province: brookley; owner: boran; ruler: boran).
	self takeAction: (GeoBRProvinceOwnershipAction new province: bendersford ; owner: boran; ruler: boran).
	self takeAction: (GeoBRProvinceOwnershipAction new province: brokenstand ; owner: boran; ruler: boran).
	self takeAction: (GeoBRProvinceOwnershipAction new province: bulle; owner: boran; ruler: boran).
	self takeAction: (GeoBRProvinceOwnershipAction new province: boatswain; owner: boran; ruler: boran).

	self takeAction: (GeoBRProvinceOwnershipAction new province: carp; owner: castledowns; ruler: castledowns).
	self takeAction: (GeoBRProvinceOwnershipAction new province: connor; owner: castledowns; ruler: castledowns).
	self takeAction: (GeoBRProvinceOwnershipAction new province: caidiff; owner: castledowns; ruler: castledowns).
	self takeAction: (GeoBRProvinceOwnershipAction new province: cardian ; owner: castledowns; ruler: castledowns).
	self takeAction: (GeoBRProvinceOwnershipAction new province: corina; owner: castledowns; ruler: castledowns).
	self takeAction: (GeoBRProvinceOwnershipAction new province: coldfell; owner: castledowns; ruler: castledowns).
]

{ #category : #accessing }
GeoBRTheLeyOfTheLand >> scriptProvinces [

	aeluin := self takeAction: (GeoBRAddProvinceAction new name: 'Aeluin'; areaId: 6; level: 4; terrain: GeoBRForest new; loyalty: GeoBRLoyaltyHigh new).
	apex := self takeAction: (GeoBRAddProvinceAction new name: 'Apex'; areaId: 12; level: 4; terrain: GeoBRMountain new; loyalty: GeoBRLoyaltyHigh new).
	armor := self takeAction: (GeoBRAddProvinceAction new name: 'Armor'; areaId: 16; level: 4; terrain: GeoBRMountain new; loyalty: GeoBRLoyaltyHigh new).
	absal := self takeAction: (GeoBRAddProvinceAction new name: 'Absal'; areaId: 5; level: 4; terrain: GeoBRForest new; loyalty: GeoBRLoyaltyHigh new).
	abbotHill := self takeAction: (GeoBRAddProvinceAction new name: 'Abbot Hill'; areaId: 17; level: 4; terrain: GeoBRHills new; loyalty: GeoBRLoyaltyHigh new).
	

	carp := self takeAction: (GeoBRAddProvinceAction new name: 'Carp'; areaId: 4; level: 4; terrain: GeoBRForest new; loyalty: GeoBRLoyaltyHigh new).
	caidiff := self takeAction: (GeoBRAddProvinceAction new name: 'Caidiff'; areaId: 13; level: 4; terrain: GeoBRPlains new; loyalty: GeoBRLoyaltyHigh new).
	connor := self takeAction: (GeoBRAddProvinceAction new name: 'Connor'; areaId: 2; level: 4; terrain: GeoBRPlains new; loyalty: GeoBRLoyaltyHigh new).
	coldfell := self takeAction: (GeoBRAddProvinceAction new name: 'Coldfell'; areaId: 3; level: 4; terrain: GeoBRPlains new; loyalty: GeoBRLoyaltyHigh new).
	cardian := self takeAction: (GeoBRAddProvinceAction new name: 'Cardain'; areaId: 14; level: 4; terrain: GeoBRForest new; loyalty: GeoBRLoyaltyHigh new).
	corina := self takeAction: (GeoBRAddProvinceAction new name: 'Corina'; areaId: 7; level: 4; terrain: GeoBRForest new; loyalty: GeoBRLoyaltyHigh new).
	

	brost := self takeAction: (GeoBRAddProvinceAction new name: 'Brost'; areaId: 9; level: 4; terrain: GeoBRHills new; loyalty: GeoBRLoyaltyHigh new).
	brookley := self takeAction: (GeoBRAddProvinceAction new name: 'Brookley'; areaId: 15; level: 4; terrain: GeoBRForest new; loyalty: GeoBRLoyaltyHigh new).
	bulle := self takeAction: (GeoBRAddProvinceAction new name: 'Bulle'; areaId: 1; level: 4; terrain: GeoBRPlains new; loyalty: GeoBRLoyaltyHigh new).
	boatswain := self takeAction: (GeoBRAddProvinceAction new name: 'Boatswain'; areaId: 8; level: 4; terrain: GeoBRHills new; loyalty: GeoBRLoyaltyHigh new).
	bendersford := self takeAction: (GeoBRAddProvinceAction new name: 'Bendersford'; areaId: 10; level: 4; terrain: GeoBRPlains new; loyalty: GeoBRLoyaltyHigh new).
	brokenstand := self takeAction: (GeoBRAddProvinceAction new name: 'Brokenstand'; areaId: 11; level: 4; terrain: GeoBRHills new; loyalty: GeoBRLoyaltyHigh new).
]

{ #category : #accessing }
GeoBRTheLeyOfTheLand >> scriptRegents [

	aldiss := self takeAction: (GeoBRAddRegentAction new name: 'Aldiss'; bloodline: 15).
	
	boran := self takeAction: (GeoBRAddRegentAction new name: 'Boran'; bloodline: 15).
	
	castledowns := self takeAction: (GeoBRAddRegentAction new name: 'Castledowns'; bloodline: 15).
	
	artorus := self takeAction: (GeoBRAddRegentAction new name: 'Artorus'; bloodline: 15).
	artorus := self takeAction: (GeoBRAddRegentAction new name: 'Artorus'; bloodline: 15).
	brianna := self takeAction: (GeoBRAddRegentAction new name: 'Brianna'; bloodline: 15).
	clio := self takeAction: (GeoBRAddRegentAction new name: 'Clio'; bloodline: 15).
]
