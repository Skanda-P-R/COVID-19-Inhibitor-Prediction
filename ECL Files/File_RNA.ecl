EXPORT File_RNA := MODULE
 EXPORT Layout := RECORD
    STRING Accession;
    STRING SRA_Accession;
    STRING Release_Date;
    STRING Species;
    STRING Genus;
    STRING Family;
    DECIMAL Length;
    STRING Sequence_Type;
    STRING Nuc_Completeness;
    STRING Genotype;
    STRING Segment;
    STRING Authors;
    STRING Publications;
    STRING Geo_Location;
    STRING USA;
    STRING Host;
    STRING Isolation_Source;
    STRING Collection_Date;
    STRING BioSample;
    STRING GenBank_Title;
 END;
 
 EXPORT File := DATASET('~spr::c19::rna',Layout,THOR);
END;