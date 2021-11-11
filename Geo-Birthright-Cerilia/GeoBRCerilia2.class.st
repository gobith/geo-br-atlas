Class {
	#name : #GeoBRCerilia2,
	#superclass : #GeoBRCerilia,
	#instVars : [
		'domains',
		'holdings',
		'ownerships',
		'xmlProvinces',
		'xmlLegends',
		'csvProvinces',
		'csvProvinceDatas',
		'csvCharacters',
		'csvDomains',
		'provinceAreas'
	],
	#category : #'Geo-Birthright-Cerilia-Data'
}

{ #category : #accessing }
GeoBRCerilia2 >> addToWorld [



	regents do: [ :regent | 
		| id |
		id := self takeAction: (GeoBRAddRegentAction new
				       name: regent name;
				       bloodline: regent bloodline;
				       regencyPoints: regent regencyPoints).
		regent id: id ].

	domains do: [ :domain | 
		| id |
		id := self takeAction: (GeoBRAddDomainAction new name: domain name).
		domain id: id.

		domain owner ifNotNil: [ 
			self takeAction: (GeoBROwnershipAction new
					 owner: domain owner id;
					 subject: id) ] ].

	provinces do: [ :province | 
		| id |
		id := self takeAction: (GeoBRAddProvinceAction new
				       areaId: province areaId;
				       name: province name;
				       level: province level;
				       terrain: province terrain;
				       loyalty: province loyalty).
		province id: id.

		self takeAction: (GeoBROwnershipAction new
				 owner: province owner id;
				 subject: id) ].

	holdings do: [ :holding | 
		| id |
		id := self takeAction: (GeoBRAddHoldingAction new
				       province: holding province id;
				       level: holding level;
				       type: holding type).
		self takeAction: (GeoBROwnershipAction new
				 owner: holding owner id;
				 subject: id) ]
]

{ #category : #accessing }
GeoBRCerilia2 >> coupleProvinceToArea [

	| areaIdToProvinceMapping |
	areaIdToProvinceMapping := Dictionary new.
	(provinces select: [ :each | each areaId notNil ]) do: [ :province | 
		areaIdToProvinceMapping at: province areaId put: province ].

	provinceAreas do: [ :area | 
		(areaIdToProvinceMapping at: area center ifAbsent: nil) ifNotNil: [ 
			:province | area province: province id ] ]
]

{ #category : #accessing }
GeoBRCerilia2 >> privateScript [

	| shortNameToDomains |
	provinces := Dictionary new.
	holdings := OrderedCollection new.
	regents := Dictionary new.
	domains := Dictionary new.
	shortNameToDomains := Dictionary new.
	


	(xmlLegends select: [ :each | each domain notNil ]) do: [ :legend | 
		| regent domain |
		regent := regents
			          at: legend name
			          ifAbsentPut: [ BRRegent new name: legend name ].
		domain := BRDomain new
			          name: legend domain;
			          shortName: legend id;
			          owner: regent.

		domains at: domain name put: domain ].


	(xmlLegends select: [ :each | each domain isNil ]) do: [ :legend | 
		| domain |
		domain := BRDomain new
			          name: legend name;
			          shortName: legend id;
			          owner: nil.

		domains at: domain name put: domain ].


	domains do: [ :domain | 
		shortNameToDomains at: domain shortName put: domain ].


	xmlProvinces do: [ :xmlProvince | 
		| province |
		province := BRProvince new
			            areaId: (self areaIdForProvince: xmlProvince);
			            name: xmlProvince name;
			            level: xmlProvince level;
			            loyalty: GeoBRLoyaltyAverage new;
			            terrain: (self terrainForProvince: xmlProvince);
			            owner: (domains at: xmlProvince realm).
		provinces at: xmlProvince name put: province.
		xmlProvince holdings do: [ :xmlHolding | 
			| holding |
			xmlHolding owner ~= 'none' ifTrue: [ 
				holding := BRHolding new.
				holding
					province: province;
					level: xmlHolding level;
					type: xmlHolding type;
					owner: (shortNameToDomains at: xmlHolding owner ).
				holdings add: holding ] ] ].
	



	csvProvinces do: [ :csvProvince | 
		| province |
		province := provinces at: csvProvince name.
		self setTerrain: csvProvince terrain in: province ].
	

	
]

{ #category : #accessing }
GeoBRCerilia2 >> script [

	provinceAreas := self provinceAreas.
	
	self islandAreas do: [ :islandArea | world repository save: islandArea ].
	self woodAreas do: [ :woodArea | world repository save: woodArea ].
	self mountainAreas do: [ :mountainArea | world repository save: mountainArea ].
	self borders do: [ :border | world repository save: border ].
	
	xmlProvinces := GeoBRXMLConverter new parse provinces.
	xmlLegends := GeoBRXMLConverter new parse legends.
	
	csvProvinces := GeoBRCSVConverter new convertedProvinces.
	csvProvinceDatas := GeoBRCSVConverter new convertedProvinceDatas.
	csvCharacters := GeoBRCSVConverter new convertedCharacters.
	csvDomains := GeoBRCSVConverter new convertedDomains.
	
	self privateScript.
	self addToWorld.
	
	self coupleProvinceToArea.
	
	provinceAreas do: [ :provinceArea | world repository save: provinceArea ].
]

{ #category : #accessing }
GeoBRCerilia2 >> setTerrain: terrainString in: aProvince [

	| terrain potential modifier |
	potential := aProvince terrain potential.

	terrain := (GeoBRTerrain allSubclasses detect: [ :cls | 
		            cls terrainName = terrainString ]) new.

	modifier := terrain potential - potential.
	modifier ~= 0 ifTrue: [ terrain modifier: modifier ].
	aProvince terrain: terrain
]

{ #category : #accessing }
GeoBRCerilia2 >> takeAction: anAction [

	| action |
	action := world takeAction: anAction.
	^ action id
]

{ #category : #accessing }
GeoBRCerilia2 >> terrainForProvince: aProvince [

	| potential |
	potential := aProvince level + aProvince magic.
	potential = 15 ifTrue: [ ^ GeoBRAncientForest new modifier: 6 ].
	potential = 14 ifTrue: [ ^ GeoBRAncientForest new modifier: 5 ].
	potential = 13 ifTrue: [ ^ GeoBRAncientForest new modifier: 4 ].
	potential = 12 ifTrue: [ ^ GeoBRAncientForest new modifier: 3 ].
	potential = 11 ifTrue: [ ^ GeoBRAncientForest new modifier: 2 ].
	potential = 10 ifTrue: [ ^ GeoBRAncientForest new modifier: 1 ].
	potential = 9 ifTrue: [ ^ GeoBRHighMountains new ].
	potential = 7 ifTrue: [ ^ GeoBRLightForest new ].
	potential = 6 ifTrue: [ ^ GeoBRPlains new modifier: 1 ].
	potential = 5 ifTrue: [ ^ GeoBRPlains new ].
	potential = 4 ifTrue: [ ^ GeoBRPlains new modifier: -1 ].
	potential = 3 ifTrue: [ ^ GeoBRPlains new modifier: -2 ].
	potential = 1 ifTrue: [ ^ GeoBRDesert new modifier: -4 ].
	potential = 0 ifTrue: [ ^ GeoBRDesert new modifier: -5 ].
	potential = 8 ifTrue: [ ^ GeoBRSwamp new ].

]
