Class {
	#name : #GeoBRCeriliaData,
	#superclass : #GeoBRInitialData,
	#instVars : [
		'regents',
		'provinces'
	],
	#category : #'Geo-Birthright-Cerilia-Data'
}

{ #category : #accessing }
GeoBRCeriliaData class >> areasJson [

	| areas |
	areas := self grid areas .

	^ NeoJSONWriter toStringPretty: areas
]

{ #category : #accessing }
GeoBRCeriliaData class >> bordersJson [

	^ NeoJSONWriter toStringPretty: self grid borders
]

{ #category : #accessing }
GeoBRCeriliaData class >> paths [

	^ (GeoBRPathParser onFileNamed: '/home/georges/Geo BR Atlas/Cerilia Map v1.13_scaled003.svg') parse
]

{ #category : #accessing }
GeoBRCeriliaData >> areaIdForProvince: aProvince [

	^self provinceNameToAreaIdMapping at: aProvince name
]

{ #category : #initialization }
GeoBRCeriliaData >> initialize [ 

	super initialize.
	regents := Dictionary new.
	provinces := Dictionary new
]

{ #category : #accessing }
GeoBRCeriliaData >> loyaltyForProvince: aProvince data: aProvinceData [ 

	^GeoBRLoyaltyHigh new
]

{ #category : #accessing }
GeoBRCeriliaData >> provinceNameToAreaIdMapping [

	| dict |
	dict := Dictionary new.

	dict
		at: 'Abattoir' put: 32;
		at: 'Abbatuor' put: nil;
		at: 'Achiese' put: nil;
		at: 'Aerele' put: nil;
		at: 'Alamier' put: nil;
		at: 'Alamsreft' put: nil;
		at: 'Alaroine' put: nil;
		at: 'Algael' put: nil;
		at: 'Anathar' put: nil;
		at: 'Annydwr' put: nil;
		at: 'Ansien' put: nil;
		at: 'Anuire' put: nil;
		at: 'Avallaigh' put: nil;
		at: 'Avarien' put: nil;
		at: 'Bacaele' put: nil;
		at: 'Balteruine' put: nil;
		at: 'Banien''s Deep' put: 35;
		at: 'Barniere' put: nil;
		at: 'Bayside' put: nil;
		at: 'Bellam' put: nil;
		at: 'Bevaldruor' put: nil;
		at: 'Bhaine' put: nil;
		at: 'Bhalaene' put: nil;
		at: 'Bheline' put: nil;
		at: 'Bhindraith' put: nil;
		at: 'Bhrein' put: nil;
		at: 'Bindier' put: nil;
		at: 'Bjondrig' put: nil;
		at: 'Bliene' put: nil;
		at: 'Bloodbay' put: nil;
		at: 'Bogsend' put: nil;
		at: 'Braeme' put: nil;
		at: 'Braenthindyr' put: nil;
		at: 'Bran''s Retreat' put: nil;
		at: 'Brenlie' put: nil;
		at: 'Brosien' put: nil;
		at: 'Brothendar' put: nil;
		at: 'Brushfire' put: nil;
		at: 'Byrnnor' put: nil;
		at: 'Caercas' put: nil;
		at: 'Caerwil' put: nil;
		at: 'Calant' put: nil;
		at: 'Calrie' put: 26;
		at: 'Careine' put: nil;
		at: 'Caudraight' put: nil;
		at: 'Caulnor' put: nil;
		at: 'Chalsedon' put: nil;
		at: 'Ciliene' put: nil;
		at: 'Cliff''s Lament' put: nil;
		at: 'Coere' put: nil;
		at: 'Conallier' put: nil;
		at: 'Crenier' put: nil;
		at: 'Crushing Hills' put: nil;
		at: 'Crushing Rock' put: nil;
		at: 'Cu Haellyrd' put: nil;
		at: 'Cwlldon' put: nil;
		at: 'Cwmbheir' put: nil;
		at: 'Cymryr' put: nil;
		at: 'Danaroene' put: nil;
		at: 'Daulton' put: nil;
		at: 'Deepshadow' put: nil;
		at: 'Deseirain' put: nil;
		at: 'Dhalaese' put: nil;
		at: 'Dhalier' put: nil;
		at: 'Dhalsiel' put: nil;
		at: 'Dharilein' put: nil;
		at: 'Dhoenel' put: 36;
		at: 'Dhoneaghmiere' put: nil;
		at: 'Doom''s Peak' put: nil;
		at: 'Duene' put: nil;
		at: 'Duerlin' put: 101;
		at: 'Duornil' put: nil;
		at: 'Duriene' put: nil;
		at: 'Dwarf''s Hold' put: nil;
		at: 'Edlin' put: nil;
		at: 'Elevesnemiere' put: nil;
		at: 'Elfsdemise' put: nil;
		at: 'Elfseyes' put: nil;
		at: 'Endier' put: nil;
		at: 'Fairfield' put: nil;
		at: 'Fallen Rock' put: nil;
		at: 'Falling Timber' put: nil;
		at: 'Fhoruile' put: nil;
		at: 'Fhylallien' put: nil;
		at: 'Floodspaeth' put: nil;
		at: 'Freestead' put: nil;
		at: 'Ghaele' put: nil;
		at: 'Ghalliere' put: nil;
		at: 'Ghiere' put: nil;
		at: 'Ghonallison' put: nil;
		at: 'Ghoried' put: nil;
		at: 'Ghyllwn' put: nil;
		at: 'Giant''s Fastness' put: nil;
		at: 'Greensward' put: nil;
		at: 'Gulfport' put: nil;
		at: 'Haesrien' put: nil;
		at: 'Halried' put: 73;
		at: 'Hamein' put: nil;
		at: 'Helmshaven' put: nil;
		at: 'Hidaele' put: nil;
		at: 'Hildon' put: nil;
		at: 'Hoehnaen' put: nil;
		at: 'Hope''s Demise' put: nil;
		at: 'Ice Haven' put: nil;
		at: 'Ilien' put: nil;
		at: 'Iseare' put: nil;
		at: 'Islien' put: nil;
		at: 'Jogh Warren' put: nil;
		at: 'Kal-Saitharak' put: nil;
		at: 'Land''s Victory' put: nil;
		at: 'Laraeth' put: nil;
		at: 'Lathier' put: nil;
		at: 'Lindholme' put: nil;
		at: 'Llewhoellen' put: nil;
		at: 'Llyrandor' put: nil;
		at: 'Lyssan' put: nil;
		at: 'Maesford' put: nil;
		at: 'Maesilar' put: nil;
		at: 'Marilen' put: nil;
		at: 'Marloer''s Gap' put: nil;
		at: 'Mergarrote' put: nil;
		at: 'Mettle' put: nil;
		at: 'Mhelliviene' put: nil;
		at: 'Mholien' put: nil;
		at: 'Mhowe' put: nil;
		at: 'Mielien' put: nil;
		at: 'Mistil' put: nil;
		at: 'Moere' put: nil;
		at: 'Moergen' put: nil;
		at: 'Monsedge' put: nil;
		at: 'Moriel' put: nil;
		at: 'Motile' put: nil;
		at: 'Mountainsedge' put: nil;
		at: 'Mutian''s Point' put: nil;
		at: 'Nabhriene' put: nil;
		at: 'Nentril' put: nil;
		at: 'Nietier' put: nil;
		at: 'Nolien' put: nil;
		at: 'Northvale' put: 55;
		at: 'Nortmoor' put: nil;
		at: 'Orog''s Head' put: nil;
		at: 'Osoeriene' put: nil;
		at: 'Pechalinn' put: nil;
		at: 'Pelt' put: nil;
		at: 'Periltrees' put: nil;
		at: 'Plumbago' put: nil;
		at: 'Portage' put: nil;
		at: 'Puinol' put: nil;
		at: 'Ranien' put: nil;
		at: 'Redoubt' put: nil;
		at: 'Rhumannen' put: nil;
		at: 'Rhuobhe' put: nil;
		at: 'Rivenrock' put: nil;
		at: 'Riverford' put: nil;
		at: 'Riverspring' put: nil;
		at: 'Riveside' put: nil;
		at: 'Rivien' put: nil;
		at: 'Romiene' put: nil;
		at: 'Ruidewash' put: nil;
		at: 'Ruorkhe' put: nil;
		at: 'Ruorven' put: nil;
		at: 'Sage''s Fen' put: nil;
		at: 'Salviene' put: nil;
		at: 'Seamist' put: nil;
		at: 'Seaport' put: nil;
		at: 'Seasdeep' put: nil;
		at: 'Seasedge' put: nil;
		at: 'Seaward' put: nil;
		at: 'Sendouras' put: nil;
		at: 'Sere''s Hold' put: nil;
		at: 'Serien' put: nil;
		at: 'Serimset' put: nil;
		at: 'Shadowgreen' put: 105;
		at: 'Shattered Hills' put: nil;
		at: 'Sideath' put: nil;
		at: 'Sidhuire' put: nil;
		at: 'Soileite' put: nil;
		at: 'Soniele' put: nil;
		at: 'Sonnelind' put: nil;
		at: 'Sorelies' put: nil;
		at: 'Soutmoor' put: nil;
		at: 'Spiritsend' put: nil;
		at: 'Stone''s End' put: nil;
		at: 'Storm''s Release' put: nil;
		at: 'Sufhanie' put: nil;
		at: 'Sunder Falls' put: nil;
		at: 'Sunken Lands' put: nil;
		at: 'Sutren Hills' put: nil;
		at: 'Taliern' put: nil;
		at: 'Tariene' put: nil;
		at: 'Tenarien' put: nil;
		at: 'Thasbyrn' put: nil;
		at: 'The Gorge' put: nil;
		at: 'The Imperial City of Anuire' put: nil;
		at: 'The Promontory' put: nil;
		at: 'The Spiderfell' put: nil;
		at: 'Thoralinar' put: nil;
		at: 'Tier' put: nil;
		at: 'Tireste' put: nil;
		at: 'Torain' put: nil;
		at: 'Torien''s Watch' put: nil;
		at: 'Tornilen' put: nil;
		at: 'Tradebhein' put: nil;
		at: 'Traiward' put: nil;
		at: 'Tuar Llyrien' put: nil;
		at: 'Tuor''s Hold' put: nil;
		at: 'Vanilen' put: nil;
		at: 'Westmarch' put: 51;
		at: 'Wilder''s Gorge' put: nil;
		at: 'Winoene' put: nil;
		at: 'Winter''s Deep' put: nil;
		at: 'Ywrndor' put: nil;
		at: 'Zaptig' put: nil.
	^ dict
]

{ #category : #accessing }
GeoBRCeriliaData >> script [

	super script.

	self scriptRegents.
	self scriptProvinces.
	self scriptProvinceOwnerships.
]

{ #category : #accessing }
GeoBRCeriliaData >> scriptProvinceOwnerships [

	"self takeAction: (GeoBRProvinceOwnershipAction new province: aeluin; owner: aldiss ; ruler: aldiss)."

	| convertedDomains leftOver |
	leftOver := OrderedCollection new.
	convertedDomains := Dictionary new.

	GeoBRCSVConverter new convertedDomains do: [ :domain | 
		convertedDomains at: domain name put: domain ].

	GeoBRCSVConverter new convertedProvinceDatas do: [ :provinceData | 
		| ruler province |
		ruler := regents at:
			         (convertedDomains at: provinceData domain) ruler.
		province := provinces at: provinceData province.


		self takeAction: (GeoBRProvinceOwnershipAction new
				 province: province;
				 owner: ruler;
				 ruler: ruler) ].

	self halt
]

{ #category : #accessing }
GeoBRCeriliaData >> scriptProvinces [

	"aeluin := self takeAction: (GeoBRAddProvinceAction new name: 'Aeluin'; areaId: 6; level: 6; terrain: GeoBRForest new; loyalty: GeoBRLoyaltyHigh new)."

	| convertedProvinces convertedProvinceDatas leftOver |
	leftOver := OrderedCollection new.
	convertedProvinces := GeoBRCSVConverter new convertedProvinces.
	convertedProvinceDatas := Dictionary new.

	GeoBRCSVConverter new convertedProvinceDatas do: [ :each | 
		convertedProvinceDatas at: each province put: each ].

	convertedProvinces do: [ :each | 
		convertedProvinceDatas
			at: each name
			ifAbsent: [ leftOver add: each name ] ].

	leftOver ifNotEmpty: [ self halt ].


	convertedProvinces do: [ :province | 
		| action provinceData |
		provinceData := convertedProvinceDatas at: province name.
		action := self takeAction: (GeoBRAddProvinceAction new
				           name: province name;
				           areaId: (self areaIdForProvince: province);
				           level: provinceData population ;
				           terrain: (self terrainForProvince: province);
				           loyalty: (self loyaltyForProvince: province data: provinceData)).
		provinces at: action name put: action id ]
]

{ #category : #accessing }
GeoBRCeriliaData >> scriptRegents [

	GeoBRCSVConverter new convertedCharacters do: [ :each | 
		| action |
		action := self takeAction: (GeoBRAddRegentAction new
				           name: each name;
				           bloodline: each bloodlineScore).
		regents at: action name put: action id ]
]

{ #category : #accessing }
GeoBRCeriliaData >> takeAction: anAction [

	^world takeAction: anAction
]

{ #category : #accessing }
GeoBRCeriliaData >> terrainForProvince: aProvince [

	^GeoBRForest new
]
