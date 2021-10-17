Class {
	#name : #GeoBRCSVConverter,
	#superclass : #Object,
	#category : #'Geo-Birthright-Converting'
}

{ #category : #accessing }
GeoBRCSVConverter >> convertedCharacters [

	^ '/home/georges/Geo BR Atlas/csv/Characters - Anuire.csv' asFileReference 
		  readStreamDo: [ :readStream | 
			  (NeoCSVReader on: readStream)
				  "separator: $;;"
				  skipHeader;
				  recordClass: GeoBRConvertedCharacter;
				  addIntegerField: #none:;
				  addIntegerField: #none:;
				  addField: #name:;
				  addField: #gender:;
				  addField: #race:;
				  addField: #alignment:;
				  addField: #faith:;
				  addField: #bloodlineDerivation:;
				  addField: #bloodlineStrength:;
				  addIntegerField: #bloodlineScore:;
				  addIntegerField: #rpSaved:;
				  addField: #bloodAbilities:;
				  addField: #classes:;
				  addField: #skills:;
				  addField: #lieutenantOf:;
				  upToEnd ]
]

{ #category : #accessing }
GeoBRCSVConverter >> convertedDeities [
	^ '/home/georges/Geo BR Atlas/csv/Deities.csv' asFileReference 
		  readStreamDo: [ :readStream | 
			  (NeoCSVReader on: readStream)
				  separator: $;;
				  skipHeader;
				  recordClass: GeoBRConvertedDeity;
				  addIntegerField: #none:;
				  addField: #name:;
				  addField: #abbriviation:;
				  addIntegerField: #type:;
				  addField: #alignment:;
				  addField: #none:;
				  addField: #none:;
				  upToEnd ]
]

{ #category : #accessing }
GeoBRCSVConverter >> convertedDomains [

	^ '/home/georges/Geo BR Atlas/csv/Domains - Anuire.csv'
		  asFileReference readStreamDo: [ :readStream | 
		  (NeoCSVReader on: readStream)
			  separator: $;;
			  skipHeader;
			  recordClass: GeoBRConvertedDomain;
			  addIntegerField: #none:;
			  addField: #name:;
			  addField: #abbriviation:;
			  addField: #ruler:;
			  addIntegerField: #goldbars:;
			  addField: #court:;
			  addField: #none:;
			  addField: #none:;
			  addField: #none:;
			  upToEnd ]
]

{ #category : #accessing }
GeoBRCSVConverter >> convertedProvinceDatas [

	| coll |
	coll := OrderedCollection new.

	coll addAll: (self convertedProvinceDatas:
			 '/home/georges/Geo BR Atlas/csv/province-data/Provinces Data - Anuire - Eastern Marches.csv').
	coll addAll: (self convertedProvinceDatas:
			 '/home/georges/Geo BR Atlas/csv/province-data/Provinces Data - Anuire - Heartlands.csv').
	coll addAll: (self convertedProvinceDatas:
			 '/home/georges/Geo BR Atlas/csv/province-data/Provinces Data - Anuire - Northern Marches.csv').
	coll addAll: (self convertedProvinceDatas:
			 '/home/georges/Geo BR Atlas/csv/province-data/Provinces Data - Anuire - Southern Coast.csv').
	coll addAll: (self convertedProvinceDatas:
			 '/home/georges/Geo BR Atlas/csv/province-data/Provinces Data - Anuire - Western Coast.csv').

	^ coll
]

{ #category : #accessing }
GeoBRCSVConverter >> convertedProvinceDatas: referenceString [

	^ referenceString asFileReference readStreamDo: [ :readStream | 
		  (NeoCSVReader on: readStream)
			  separator: $;;
			  skipHeader;
			  recordClass: GeoBRConvertedProvinceData;
			  addField: #province:;
			  addField: #domain:;
			  addIntegerField: #population:;
			  addIntegerField: #fortification:;
			  addField: #law:;
			  addField: #temples:;
			  addField: #guilds:;
			  addField: #sources:;
			  addField: #race:;
			  addField: #none:;
			  addField: #none:;
			  addField: #none:;
			  upToEnd ]
]

{ #category : #accessing }
GeoBRCSVConverter >> convertedProvinces [

	^ '/home/georges/Geo BR Atlas/csv/Provinces - Anuire.csv'
		  asFileReference readStreamDo: [ :readStream | 
		  (NeoCSVReader on: readStream)
			 " separator: $;;"
			  skipHeader;
			  recordClass: GeoBRConvertedProvince;
			  addIntegerField: #none:;
			  addField: #region:;
			  addField: #name:;
			  addField: #terrain:;
			  addField: #none:;
			  addField: #none:;
			  upToEnd ]
]

{ #category : #accessing }
GeoBRCSVConverter >> convertedTerrains [

	^ '/home/georges/Geo BR Atlas/csv/Terrains.csv' asFileReference 
		  readStreamDo: [ :readStream | 
			  (NeoCSVReader on: readStream)
				  separator: $;;
				  skipHeader;
				  recordClass: GeoBRConvertedTerrain;
				  addIntegerField: #none:;
				  addField: #name:;
				  addIntegerField: #maxPopulation:;
				  addIntegerField: #maxMagic:;
				  addIntegerField: #moveCost:;
				  addField: #none:;
				  addField: #none:;
				  upToEnd ]
]

{ #category : #accessing }
GeoBRCSVConverter >> provinceDataNames [

	^(self convertedProvinceDatas collect: [ : each | each province ])
]

{ #category : #accessing }
GeoBRCSVConverter >> provinceNames [

	^(self convertedProvinces collect: [ : each | each name ])
]
