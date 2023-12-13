IMPORT $;
IMPORT PYTHON3 as PY;

df := $.File_Covid.File;
rec := $.File_Covid.Layout;

STREAMED DATASET(rec) ReplicateStrings(STREAMED DATASET(rec) df) := EMBED(PY: activity)
    outList = []
    
    for i in df:
      Compound_No, SMILES, pIC50_IC50_in_microM = i
      outList.append((Compound_No,SMILES,pIC50_IC50_in_microM))
    return outList
    
ENDEMBED;

OUTPUT(ReplicateStrings(df));