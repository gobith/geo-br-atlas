Class {
	#name : #GeoBRCSVConverter,
	#superclass : #Object,
	#category : #'Geo-Birthright-Cerilia-Converting'
}

{ #category : #accessing }
GeoBRCSVConverter >> convertedCharacters [

	^ GeoBRFileReferences charactersAnuire asFileReference 
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
	^ GeoBRFileReferences deities asFileReference 
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

	^ GeoBRFileReferences domainsAnuire
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
			 GeoBRFileReferences provinceDataEasternMarches).
	coll addAll: (self convertedProvinceDatas:
			 GeoBRFileReferences provinceDataHearthlands).
	coll addAll: (self convertedProvinceDatas:
			 GeoBRFileReferences provinceDataNorthernMarches).
	coll addAll: (self convertedProvinceDatas:
			 GeoBRFileReferences provinceDataSouthernCoast).
	coll addAll: (self convertedProvinceDatas:
			 GeoBRFileReferences provinceDataWesternCoast).

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

	^ GeoBRFileReferences provincesAnuire
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

	^ GeoBRFileReferences terrains asFileReference 
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
