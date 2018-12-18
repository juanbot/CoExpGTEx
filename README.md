# Introduction

This package is a suite of co-expression networks from the GTEx V6 gene expression data [https://gtexportal.org/home/]. It is useful with the CoExpNets package, here [https://github.com/juanbot/CoExpNets] which can be used to access and analyze these networks and to create new ones. 

In the package you will find networks for the following tissues
```r
> getGTExTissues()
 [1] "AdiposeSub"        "AdiposeVisceral"   "AdrenalGland"      "Amygdala"          "AntCingCortex"     "ArteryAorta"      
 [7] "ArteryCoronary"    "ArteryTibial"      "Breast"            "Caudate"           "CellsFirbroblasts" "CellsLymphocytes" 
[13] "Cerebellum"        "CerebHemisphere"   "ColonSigmoid"      "ColonTransverse"   "Cortex"            "EsophGastJunction"
[19] "EsophMucosa"       "EsophMuscularis"   "FCortex"           "HeartAtrialApp"    "HeartLeftVent"     "Hippocampus"      
[25] "Hypothalamus"      "Liver"             "Lung"              "MuscleSkeletal"    "NerveTibial"       "NucAccumbens"     
[31] "Ovary"             "Pancreas"          "Pituitary"         "Prostate"          "Putamen"           "SkinLowerLeg"     
[37] "SkinSuprapubic"    "SmallIntestine"    "Spinalcord"        "Spleen"            "Stomach"           "Substantianigra"  
[43] "Testis"            "Thyroid"           "Uterus"            "Vagina"            "WholeBlood"   
```
Each network is compound of
* An RDS file with the network itself. When reading the object you obtain a list with ´moduleColors´ and ´MEs´, the clustering of nodes and the module eigengenes respectively.
* A csv with the enrichment for the modules from the Gene Ontology, REACTOME and KEGG pathway annotation databases.
* The residuals (corrected by PMI, Age, Gender and Batch, with ComBat) and Surrogate variables with SVA.

