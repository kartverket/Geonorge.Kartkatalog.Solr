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
| /api/metadataupdated | Indekserer en metadata XML-fil. | http://kartkatalog.dev.geonorge.no/api/metadataupdated |
| /api/index-metadata | Indekserer alle metadata som finnes i GeoNetwork. | http://kartkatalog.dev.geonorge.no/api/index-metadata |
| /api/reindex-metadata | Reindekserer alle metadata som finnes i GeoNetwork. Til forskjell fra Index så slettes hele indeksen før ny indeksering starter. | http://kartkatalog.dev.geonorge.no/api/reindex-metadata |


 

#### Beskrivelse av indekseringsoperasjonen
Indekseringsmotoren i Kartkatalogen fungerer på følgende måte:

Ved hjelp av GeonorgeAPI kjøres det et tomt CSW-søk mot GeoNetwork.

Søket kjøres i batcher på 50 metadata om gangen. Det returneres store XMLer (ISO19139) som gjør at det ikke er hensiktsmessig å kjøre veldig store batcher. 

SolrIndexDocumentCreator sørger for å generere indekseringsdokumenter. Se listen nedenfor for alle feltene som blir indeksert.

Mange av feltene kopieres til 3 samlefelter: allText, allText2, allText3. Se liste nedenfor for hvilke felter dette gjelder og hvor de kopieres. 

 

#### Beskrivelse av søkeoperasjonen
Søk justeres eng gang i blant, se metoden BuildQuery i filen: https://github.com/kartverket/Geonorge.Kartkatalog/blob/master/Kartverket.Metadatakatalog/Models/SearchParameters.cs

Spesialtegn fjernes fra søketeksten: : '+', '-', '&', '|', '!', '(', ')', '{', '}', '[', ']', '^', '"', '~', '*', '?', ':', '\\', '/'

##### Boost-regler

## 1. Leksikalsk boost-stige (hovedspørringen)

Klausulene er ordnet etter *spesifisitet* — mest presise treff får høyest boost. Merk mønsteret `(type:dataset AND …)^N  …^(N-1)`: **datasett får alltid +1 over andre typer** (tjenester, WMS/WFS osv.).

| Boost | Klausul | Betyr |
|------:|---------|-------|
| `^81` | `uuid:<tekst>` | Eksakt UUID-treff — vinner alt |
| `^79 / ^78` | `titleText:<tekst>` | Eksakt tittel (hele frasen, ingen wildcard) |
| `^77 / ^76` | `titleText:<tekst>*` | Tittel starter med søket (prefiks) |
| `^75 / ^74` | `title_lowercase:*<tekst>*` (+ prefiks) | Tittel inneholder søket (case-uavhengig) |                                                                                                                                         | `^73 / ^72` | `titleText:*<tekst>*` | Tittel inneholder søket (substring) |
| `^71 / ^70` | `allText:*<tekst>*` | Fulltekst inneholder søket (substring) |
| `^0.5 / ^0.4` | per ord: `titleText:*ord*` | Ved flerordssøk: hvert ord for seg i tittel |                                                                                                                                                 | `^1` | `allText:<tekst>~1` | Fuzzy fulltekst (redigeringsavstand 1) |                                                                                                                                                                      | `(1)` | `allText2:<tekst>` | Sekundært tekstfelt (stammet/`kirk`-aktig), ingen eksplisitt boost |

Et søk uten mellomrom (f.eks. «kirker») treffer toppklausulene; et flerordssøk («løs jord») gjør `titleText`/`allText` om til `løs*jord`-wildcards, som ofte ikke matcher → da faller den leksikalske scoren lavt og vektoren overtar.     
## 2. Type-boost (multiplikativ)

```
!boost b=typenumber
```

Ganger scoren med et felt som rangerer dokumenttyper — finjusterer rekkefølgen mellom typer på tvers av alle klausulene.

## 3. Filterklausuler (ikke boost — fjerner treff)

```
!serie:*series_historic*     ekskluderer historiske serier
!serie:*series_time*         ekskluderer tidsserier
```

(droppes hvis `listhidden`).

## 4. Vektor-laget (semantikk)

**a) Hybrid-filter** — avgjør hva som *kommer med*:

```
allText:*<tekst>*  OR  {!frange l=0.78}query($knn_q)
```

Et dokument beholdes hvis det enten inneholder søket som **substring** (venstre side) **eller** har **cosinus ≥ 0.56** mot embeddingen (`l=0.78`). Dette er nøkkelen: leksikalske treff overlever uansett, så terskelen rammer bare rene
vektor-treff.

**b) ReRank** — avgjør *rekkefølgen*:

```
{!rerank reRankQuery=$knn_q reRankDocs=200 reRankWeight=20}
```

`sluttscore = leksikalsk_score + 20 × cosinus-score`, brukt på de øverste 200.

## Den viktigste innsikten

Boostingen er **selvbalanserende**:

- **Sterkt leksikalsk treff** (ettordssøk som «kirker» → `^70`+) → leksikalsk score dominerer.
- **Svakt leksikalsk treff** (flerordssøk som «løs jord», ingen sammenhengende wildcard-match) → leksikalsk score er liten (~0.4–0.9), og vektoren styrer rangeringen → «løsmasser» havner øverst.


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
| organizations | string | true | true |  | true | |
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
| knn_vector |  |  | true | true | solr.DenseVectorField | float array |

| Name | Type | Indexed | Stored | Required | MultiValued | Notes |
| --- | --- | --- | --- | --- | --- | --- |
| popularMetadata | popularMetadataFile | true | true |  |  | |
| vector | knn_vector | true | true |  |  | |

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

API-et er dokumentert på https://kartkatalog.geonorge.no/swagger

#### Eksempelkall

`https://kartkatalog.geonorge.no/api/search?text=berggrunn` — returnerer alle metadataoppføringer som inneholder teksten "berggrunn"
