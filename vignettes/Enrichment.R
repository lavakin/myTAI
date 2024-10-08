## ----eval=FALSE---------------------------------------------------------------
#  # read expression data (organ specific genes) from Sestak and Domazet-Loso, 2015
#  Drerio.OrganSpecificExpression <- read_excel("MBE_2015a_Drerio_PhyloMap.xlsx", sheet = 2, skip = 3)
#  
#  # select only brain specific genes
#  Drerio.Brain.Genes <- unique(na.omit(Drerio.OrganSpecificExpression[ , "brain"]))
#  
#  # visualize enriched Phylostrata of genes annotated as brain specific
#  PlotEnrichment(Drerio.PhyloMap,
#                 test.set     = Drerio.Brain.Genes,
#                 measure      = "log-foldchange",
#                 use.only.map = TRUE,
#                 legendName   = "PS")
#  

## ----eval = FALSE-------------------------------------------------------------
#  PlotEnrichment(Drerio.PhyloMap,
#                 test.set     = Drerio.Brain.Genes,
#                 measure      = "log-foldchange",
#                 use.only.map = TRUE,
#                 legendName   = "PS")

## ----eval = FALSE-------------------------------------------------------------
#  # specify plot.bars = FALSE to retrieve only numeric results
#  EnrichmentResult <- PlotEnrichment(Drerio.PhyloMap,
#                                     test.set     = Drerio.Brain.Genes,
#                                     measure      = "log-foldchange",
#                                     use.only.map = TRUE,
#                                     legendName   = "PS",
#                                     plot.bars    = FALSE)
#  
#  # access p-values quantifying the enrichment for each Phylostratum
#  EnrichmentResult$p.values

## ----eval = FALSE-------------------------------------------------------------
#  # access enrichment matrix storing C_1 and C_2
#  EnrichmentResult$enrichment.matrix
#  

## ----eval = FALSE-------------------------------------------------------------
#  # complete.bg = TRUE (default) -> retain test.set genes in background set
#  PlotEnrichment(Drerio.PhyloMap,
#                 test.set     = Drerio.Brain.Genes,
#                 measure      = "log-foldchange",
#                 complete.bg  = TRUE,
#                 use.only.map = TRUE,
#                 legendName   = "PS")

## ----eval = FALSE-------------------------------------------------------------
#  # complete.bg = FALSE -> remove test.set genes from background set
#  PlotEnrichment(Drerio.PhyloMap,
#                 test.set     = Drerio.Brain.Genes,
#                 measure      = "log-foldchange",
#                 complete.bg  = FALSE,
#                 use.only.map = TRUE,
#                 legendName   = "PS")

## ----eval = FALSE-------------------------------------------------------------
#  PlotEnrichment(Drerio.PhyloMap,
#                 test.set     = Drerio.Brain.Genes,
#                 measure      = "foldchange",
#                 complete.bg  = TRUE,
#                 use.only.map = TRUE,
#                 legendName   = "PS")

## ----eval=FALSE---------------------------------------------------------------
#  # retrieve the taxonomy of D. rerio
#  myTAI::taxonomy(organism = "Danio rerio")

## ----eval = FALSE-------------------------------------------------------------
#  # the best parameter setting to visualize this plot:
#  # png("DrerioBrainSpecificGeneExpression.png",700,400)
#  PlotGeneSet(ExpressionSet = DrerioPhyloExpressionSet,
#              gene.set      = Drerio.Brain.Genes,
#              plot.legend   = FALSE,
#              type          = "l",
#              lty           = 1,
#              lwd           = 4,
#              xlab          = "Ontogeny",
#              ylab          = "Expression Level")
#  
#  # dev.off()

## ----eval = FALSE-------------------------------------------------------------
#  # select the ExpressionSet subset of Brain specific genes
#  Brain.PhyloExpressionSet <- SelectGeneSet( ExpressionSet = DrerioPhyloExpressionSet,
#                                             gene.set      = Drerio.Brain.Genes )
#  
#  head(Brain.PhyloExpressionSet)

## ----eval = FALSE-------------------------------------------------------------
#  # adjust p-values for multiple comparisons with Benjamini & Hochberg (1995)
#  PlotEnrichment(Drerio.PhyloMap,
#                 test.set        = Drerio.Brain.Genes,
#                 measure         = "log-foldchange",
#                 complete.bg     = FALSE,
#                 use.only.map    = TRUE,
#                 legendName      = "PS",
#                 p.adjust.method = "BH")
#  

