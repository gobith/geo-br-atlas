Class {
	#name : #GeoBRToWarInitialData,
	#superclass : #GeoBRInitialData,
	#instVars : [
		'davor',
		'riswynn',
		'redfang',
		'greenbottle',
		'cear',
		'garlofs',
		'numut',
		'bernau',
		'kharozzi',
		'cityStateKharozzi',
		'hilt'
	],
	#category : #'Geo-Birthright-Data'
}

{ #category : #scripts }
GeoBRToWarInitialData >> script [

	self scriptRegents.
	self scriptProvinces.
	self scriptProvinceOwnerships.
	self scriptLawOwnerships.
	self scriptGuildOwnerships.
	self scriptTempleOwnerships.

]

{ #category : #scripts }
GeoBRToWarInitialData >> scriptGuildOwnerships [
	
	self takeAction: (GeoBRGuildOwnershipAction new province: cear; owner: davor; ruler: davor; level: 3).
	self takeAction: (GeoBRGuildOwnershipAction new province: garlofs ; owner: davor; ruler: davor; level: 2).
	self takeAction: (GeoBRGuildOwnershipAction new province: numut; owner: davor; ruler: davor; level: 3).
	self takeAction: (GeoBRGuildOwnershipAction new province: bernau; owner: davor; ruler: davor; level: 1).
	
	self takeAction: (GeoBRGuildOwnershipAction new province: hilt; owner: davor; ruler: davor; level: 0).
	
	self takeAction: (GeoBRGuildOwnershipAction new province: cityStateKharozzi ; owner: davor; ruler: davor; level: 0).
	
	self takeAction: (GeoBRGuildOwnershipAction new province: cear; owner: greenbottle; ruler: greenbottle; level: 1)
]

{ #category : #scripts }
GeoBRToWarInitialData >> scriptLawOwnerships [

	self takeAction: (GeoBRLawOwnershipAction new province: cear; owner: davor; ruler: redfang; level: 4).
	self takeAction: (GeoBRLawOwnershipAction new province: garlofs ; owner: davor; ruler: redfang; level: 2).
	self takeAction: (GeoBRLawOwnershipAction new province: numut; owner: davor; ruler: redfang; level: 3).
	self takeAction: (GeoBRLawOwnershipAction new province: bernau; owner: davor; ruler: redfang; level: 1).
	
]

{ #category : #scripts }
GeoBRToWarInitialData >> scriptProvinceOwnerships [

	self takeAction: (GeoBRProvinceOwnershipAction new province: cear; owner: davor; ruler: davor).
	self takeAction: (GeoBRProvinceOwnershipAction new province: garlofs ; owner: davor; ruler: davor).
	self takeAction: (GeoBRProvinceOwnershipAction new province: numut; owner: davor; ruler: davor).
	self takeAction: (GeoBRProvinceOwnershipAction new province: bernau; owner: davor; ruler: davor).
	
	self takeAction: (GeoBRProvinceOwnershipAction new province: hilt; owner: greenbottle; ruler: greenbottle).
	
	self takeAction: (GeoBRProvinceOwnershipAction new province: cityStateKharozzi ; owner: kharozzi ; ruler: kharozzi ).
]

{ #category : #scripts }
GeoBRToWarInitialData >> scriptProvinces [

	cear := self takeAction: (GeoBRAddProvinceAction new name: 'Cear'; areaId: 63; level: 4; terrain: GeoBRMountain new; loyalty: GeoBRLoyaltyHigh new).
	garlofs := self takeAction: (GeoBRAddProvinceAction new name: 'Garlofs'; areaId: 22; level: 2; terrain: GeoBRMountain new; loyalty: GeoBRLoyaltyHigh new).
	numut := self takeAction: (GeoBRAddProvinceAction new name: 'Numut'; areaId: 8; level: 3; terrain: GeoBRMountain new; loyalty: GeoBRLoyaltyAverage new).
	bernau := self takeAction: (GeoBRAddProvinceAction new name: 'Bernau'; areaId: 34; level: 1; terrain: GeoBRHills new; loyalty: GeoBRLoyaltyAverage new).

	hilt := self takeAction: (GeoBRAddProvinceAction new name: 'Hilt'; areaId: 67; level: 2; terrain: GeoBRHills new; loyalty: GeoBRLoyaltyAverage new).

	cityStateKharozzi := self takeAction: (GeoBRAddProvinceAction new name: 'Citystate of Kharozzi'; areaId: 15; level: 10; terrain: GeoBRPlains new; loyalty: GeoBRLoyaltyAverage new).
]

{ #category : #scripts }
GeoBRToWarInitialData >> scriptRegents [

	davor := self takeAction: (GeoBRAddRegentAction new name: 'Davor Blackfal'; bloodline: 15).
	riswynn := self takeAction: (GeoBRAddRegentAction new name: 'Riswynn Warforged'; bloodline: 15).
	redfang := self takeAction: (GeoBRAddRegentAction new name: 'Drakcilius'; bloodline: 15).
	greenbottle := self takeAction: (GeoBRAddRegentAction new name: 'Lady Greenbottle'; bloodline: 15).
	kharozzi := self takeAction: (GeoBRAddRegentAction new name: 'Kharozzi'; bloodline: 16).
]

{ #category : #scripts }
GeoBRToWarInitialData >> scriptTempleOwnerships [

	self takeAction: (GeoBRTempleOwnershipAction new province: cear; owner: davor; ruler: riswynn; level: 4).
	self takeAction: (GeoBRTempleOwnershipAction new province: garlofs ; owner: davor; ruler: riswynn; level: 2).
	self takeAction: (GeoBRTempleOwnershipAction new province: numut; owner: davor; ruler: riswynn; level: 3).
	self takeAction: (GeoBRTempleOwnershipAction new province: bernau; owner: davor; ruler: riswynn; level: 1).

]
