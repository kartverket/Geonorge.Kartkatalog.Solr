### Dokumentkilde og status

Følgende side er kopiert fra confluence 16.06.2026. Den var sist endret i confluence i 2023.

Beskrivelser av felter ble gjort om til tabell for readability.

## Indeksering

Søket i kartkatalogen er implementert ved hjelp av Apache Solr. Datagrunnlaget hentes fra GeoNetwork som benyttes som database for ISO19139 XML-filene som beskriver de ulike datasettene, tjenestene og applikasjonene.

### Indeksering
Kartkatalogen eksponerer API-metoder for å kjøre indeksering av Solr. Indeksering kan kjøres manuelt eller trigges via en oppdatering av metadata i GeoNetwork. 

#### API-metoder for indeksering

| URL | Beskrivelse | Eksempel |
| --- | --- | --- |
| /index/IndexSingle/{uuid} | Indekserer en metadata XML-fil. | http://kartkatalog.dev.geonorge.no/index/IndexSingle/041f1e6e-bdbc-4091-b48f-8a5990f3cc5b |
| /index/Index | Indekserer alle metadata som finnes i GeoNetwork. | http://kartkatalog.dev.geonorge.no/index/Index |
| /index/ReIndex | Reindekserer alle metadata som finnes i GeoNetwork. Til forskjell fra Index så slettes hele indeksen før ny indeksering starter. | http://kartkatalog.dev.geonorge.no/index/ReIndex |
| /index/MetadataUpdated | Indekserer en metadata XML-fil (samme som IndexSingle) på forespørsel fra GeoNetwork. Dette kallet er implementert slik at Kartkatalogen kan håndtere oppdateringsforespørsel fra GeoNetwork. | http://kartkatalog.dev.geonorge.no/index/MetadataUpdated |


 

#### Beskrivelse av indekseringsoperasjonen
Indekseringsmotoren i Kartkatalogen fungerer på følgende måte:

Ved hjelp av GeonorgeAPI kjøres det et tomt CSW-søk mot GeoNetwork.

Søket kjøres i batcher på 50 metadata om gangen. Det returneres store XMLer (ISO19139) som gjør at det ikke er hensiktsmessig å kjøre veldig store batcher. 

SolrIndexDocumentCreator sørger for å generere indekseringsdokumenter. Se listen nedenfor for alle feltene som blir indeksert.

Mange av feltene kopieres til 3 samlefelter: allText, allText2, allText3. Se liste nedenfor for hvilke felter dette gjelder og hvor de kopieres. 

 

#### Beskrivelse av søkeoperasjonen
Søk justeres eng gang i blant, se metoden BuildQuery i filen: https://github.com/kartverket/Geonorge.Kartkatalog/blob/master/Kartverket.Metadatakatalog/Models/SearchParameters.cs

Spesialtegn fjernes fra søketeksten: : ! } { ) ( ] [ ^ 

##### Boost-regler (søketekst kortere enn 5 tegn)

| boost | forklaring |
| --- | --- |
| titleText:SØKETEKST^50 | Treff i titteltekst gir boost på 50 |
| titleText:SØKETEKST*^40 | Treff på ord i titteltekst som starter med søkestrengen gir boost på 40 |
| allText:SØKETEKST^1.2 | Treff i allText gir boost på 1.2 |
| allText:SØKETEKST*^1.1 | Treff på ord i allText som starter med søkestrengen gir boost på 1.1 |


 

##### Boost-regler (søketekst lengre enn 5 tegn)

| boost | forklaring |
| --- | --- |
| titleText:SØKETEKST^50 | Treff i titteltekst gir boost på 50 |
| titleText:SØKETEKST*^40 | Treff på ord i titteltekst som starter med søkestrengen gir boost på 40 |
| titleText:SØKETEKST~2^1.1 | Fuzzysøk med 2 bokstaver feil i titleText |
| allText:SØKETEKST^1.2 | Treff i allText gir boost på 1.2 |
| allText:SØKETEKST*^1.1 | Treff på ord i allText som starter med søkestrengen gir boost på 1.1 |
| allText:SØKETEKST~1 | Fuzzysøk med 1 bokstav feil i allText |
| allText2:SØKETEKST | Treff på ord i allText2 gir boost på 1 |


 



#### Felter i søkeindeksen (utdrag fra schema.xml)

| Name | Type | Indexed | Stored | Required | MultiValued | Notes |
| --- | --- | --- | --- | --- | --- | --- |
| uuid | string | true | true | true | false | |
| title | string | true | true |  | false | |
| abstract | string | true | true |  | false | |
| purpose | string | true | true |  | false | |
| type | string | true | true |  | false | |
| theme | string | true | true |  | false | |
| place | string | true | true |  | true | |
| placegroups | string | true | true |  | true | |
| license | string | true | true |  | false | |
| nationalinitiative | string | true | true |  | true | |
| organizationgroup | string | true | true |  | false | |
| organization | string | true | true |  | false | |
| organization2 | string | true | true |  | false | |
| organization3 | string | true | true |  | false | |
| organizationContactname | string | false | true |  | false | (fixed typo: stored="true") |
| organization2Contactname | string | false | true |  | false | |
| organization3Contactname | string | false | true |  | false | |
| organization_seo_lowercase | lowercase | true | true |  | false | |
| organization_shortname | string | true | true |  | false | |
| organization_shortname_lowercase | lowercase | true | true |  | false | |
| title_lowercase | lowercase | true | true |  | false | |
| topic_category | string | true | true |  | false | |
| keyword | string | true | true |  | true | |
| titleText | text_exact | true | false |  | true | exact and fuzzy |
| allText | text_exact | true | false |  | true | stemmed |
| allText2 | text_no | true | false |  | true | |
| allText3 | text_phonetic | true | false |  | true | phonetic |
| organization_logo_url | string | false | true |  | false | |
| date_published | date | true | true |  | false | |
| date_updated | date | true | true |  | false | |
| legend_description_url | string | false | true |  | false | |
| product_page_url | string | false | true |  | false | |
| product_sheet_url | string | false | true |  | false | |
| product_specification_url | string | false | true |  | false | |
| thumbnail_url | string | false | true |  | false | |
| distribution_url | string | false | true |  | false | |
| distribution_protocol | string | true | true |  | false | |
| distribution_name | string | false | true |  | false | |
| maintenance_frequency | string | false | true |  | false | |
| typenumber | int | true | true |  | false | |
| ServiceDistributionUrlForDataset | string | false | true |  | false | |
| ServiceDistributionProtocolForDataset | string | false | true |  | false | |
| ServiceDistributionNameForDataset | string | false | true |  | false | |
| DistributionProtocols | string | true | true |  | true | |
| area | string | true | true |  | true | |
| datasetservice | string | false | true |  | true | |
| servicedataset | string | false | true |  | true | |
| bundle | string | false | true |  | true | |
| servicelayers | string | false | true |  | true | |
| accessconstraint | string | false | true |  | false | |
| otherconstraintsaccess | string | false | true |  | false | |


##### Field types (utdrag)

| Name | keyField | defVal | Stored | Indexed | Class | valType |
| --- | --- | --- | --- | --- | --- | --- |
| popularMetadataFile | uuid | 0 | true | true | solr.ExternalFileField | float |

| Name | Type | Indexed | Stored | Required | MultiValued | Notes |
| --- | --- | --- | --- | --- | --- | --- |
| popularMetadata | popularMetadataFile | true | true |  |  | |


#### Felter som kopieres til samlefelter (copyField) 

| Source | Destination |
| --- | --- |
| uuid | allText |
| title | allText |
| title | title_lowercase |
| title | titleText |
| abstract | allText |
| purpose | allText |
| type | allText |
| theme | allText |
| organizationgroup | allText |
| topic_category | allText |
| keyword | allText |
| organization2 | allText |
| organization3 | allText |
| organization3 | allText |
| organization_shortname | allText |
| organization_shortname | organization_shortname_lowercase |
| organizationContactname | allText |
| organization2Contactname | allText |
| organization3Contactname | allText |
| distribution_name | allText |
| ServiceDistributionNameForDataset | allText |
| uuid | allText2 |
| title | allText2 |
| abstract | allText2 |
| purpose | allText2 |
| type | allText2 |
| theme | allText2 |
| organizationgroup | allText2 |
| topic_category | allText2 |
| keyword | allText2 |
| organization2 | allText2 |
| organization3 | allText2 |
| organizationContactname | allText2 |
| organization2Contactname | allText2 |
| organization3Contactname | allText2 |
| distribution_name | allText2 |
| ServiceDistributionNameForDataset | allText2 |
| uuid | allText3 |
| title | allText3 |
| abstract | allText3 |
| purpose | allText3 |
| type | allText3 |
| theme | allText3 |
| organizationgroup | allText3 |
| topic_category | allText3 |
| keyword | allText3 |
| organization2 | allText3 |
| organization3 | allText3 |
| distribution_name | allText3 |
| organizationContactname | allText3 |
| organization2Contactname | allText3 |
| organization3Contactname | allText3 |
| ServiceDistributionNameForDataset | allText3 |


#### API-dokumentasjon

API-et er dokumentert på https://kartkatalog.geonorge.no/help

#### Eksempelkall

`https://kartkatalog.geonorge.no/api/search?text=berggrunn` — returnerer alle metadataoppføringer som inneholder teksten "berggrunn"
