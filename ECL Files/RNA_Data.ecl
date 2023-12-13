IMPORT $;

EXPORT RNA_Data := FUNCTION

STRING Ele := '' : STORED('Enter_Accession_ID');
ds := $.File_RNA.File;

// OUTPUT(ds);

rec := RECORD
 ds.accession;
 STRING Result := '';
END;

tb := TABLE(ds,rec,accession);
// OUTPUT(tb);

rec try(rec le, STRING ele1) := TRANSFORM
 SELF.accession := le.accession;
 SELF.Result := IF(le.accession=ele1,'COVID_Confirm','');
 SELF := le;
END;

updated_df := PROJECT(tb,try(LEFT,Ele));

df := DICTIONARY(updated_df,{Accession,Result});
defaul := DATASET([{Ele,'No_COVID'}], rec);

con := ROW({Ele,''},rec) IN df OR ROW({Ele,'COVID_Confirm'},rec) IN df;

final := IF(con,updated_df(Result='COVID_Confirm'),defaul);

RETURN OUTPUT(final);

END;
