IMPORT $;
IMPORT PYTHON3 as PY;

df := $.File_Covid.File;

DATASET PCP(DATASET df) := EMBED(PY)
  import pubchempy as pcp
  import pandas as pd
  data = []

  for i in df['SMILES']:
    props = pcp.get_properties(['MolecularFormula', 'MolecularWeight','InChI', 'InChIKey', 'IUPACName', 
                                'XLogP', 'ExactMass', 'MonoisotopicMass', 'TPSA', 'Complexity', 'Charge', 
                                'HBondDonorCount', 'HBondAcceptorCount', 'RotatableBondCount', 
                                'HeavyAtomCount', 'IsotopeAtomCount', 'AtomStereoCount', 
                                'DefinedAtomStereoCount', 'UndefinedAtomStereoCount', 'BondStereoCount', 
                                'DefinedBondStereoCount', 'UndefinedBondStereoCount', 'CovalentUnitCount', 
                                'Volume3D', 'XStericQuadrupole3D', 'YStericQuadrupole3D', 
                                'ZStericQuadrupole3D', 'FeatureCount3D', 'FeatureAcceptorCount3D', 
                                'FeatureDonorCount3D', 'FeatureAnionCount3D', 'FeatureCationCount3D', 
                                'FeatureRingCount3D', 'FeatureHydrophobeCount3D', 'ConformerModelRMSD3D', 
                                'EffectiveRotorCount3D', 'ConformerCount3D'], i, 'smiles')
    data.append(props)
  rows = []
  columns = data[0][0].keys()
  for i in range(104):
    rows.append(data[i][0].values())
  props_df = pd.DataFrame(data=rows, columns=columns) 
  props_df.insert(1, 'SMILES', df['SMILES'], True)
  props_df['pIC50'] = df['pIC50 (IC50 in microM)']
  return props_df
ENDEMBED;

df_updated := PCP(df);

OUTPUT(df_updated);