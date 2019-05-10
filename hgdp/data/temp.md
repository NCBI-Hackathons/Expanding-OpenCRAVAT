# how to create the sqlite file for an annotator from a csv

``` 
sqlite3 annotatorname.sqlite

CREATE TABLE tablename (id TEXT, chrom TEXT, pos INT, ref TEXT, alt TEXT, feature TEXT);

.mode csv

.import path/filename.csv tablename 
```


# how I created the sqlite table for the hgdp annotator

```
sqlite3 hgdp.sqlite

CREATE TABLE hgdp_table (CHR TEXT,  POS INT,   ID TEXT,   REF TEXT,  ALT TEXT,    African NUMERIC,    European NUMERIC ,   Middle_Eastern NUMERIC,   CS_Asian NUMERIC,    East_Asian NUMERIC,    Oceanian   NUMERIC,  Native_American  NUMERIC);

.mode csv

.import /Users/ada/RNAseq_data/Freq_HGDP.csv hgdp_table

.schema hgdp_table
CREATE TABLE hgdp_table(
  "CHR" TEXT,
  "POS" TEXT,
  "ID" TEXT,
  "REF" TEXT,
  "ALT" TEXT,
  "African" TEXT,
  "European" TEXT,
  "Middle_Eastern" TEXT,
  "CS_Asian" TEXT,
  "East_Asian" TEXT,
  "Oceanian" TEXT,
  "Native_American" TEXT
);
```
