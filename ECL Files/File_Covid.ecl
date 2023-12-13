EXPORT File_Covid := MODULE
 EXPORT Layout := RECORD
  DECIMAL3 Compound_No;
  STRING SMILES;
  REAL pIC50_IC50_in_microM;
  END;
 EXPORT File := DATASET('~int::spr::ddh_data',LAYOUT,CSV);
END;