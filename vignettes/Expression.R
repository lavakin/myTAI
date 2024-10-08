## ----eval=FALSE---------------------------------------------------------------
#  data("PhyloExpressionSetExample")
#  
#  # Detection of DEGs using the fold-change measure
#  DEGs <- DiffGenes(ExpressionSet = PhyloExpressionSetExample[1:5,1:8],
#                    nrep          = 2,
#                    method        = "foldchange",
#                    stage.names   = c("S1","S2","S3"))
#  
#  
#  head(DEGs)

## ----eval=FALSE---------------------------------------------------------------
#  data("PhyloExpressionSetExample")
#  
#  # Detection of DEGs using the logfold-change measure
#  log.DEGs <- DiffGenes(ExpressionSet = tf(PhyloExpressionSetExample[1:5,1:8],log2),
#                        nrep          = 2,
#                        method        = "log-foldchange",
#                        stage.names   = c("S1","S2","S3"))
#  
#  
#  head(log.DEGs)

## ----eval=FALSE---------------------------------------------------------------
#  data("PhyloExpressionSetExample")
#  
#  # Detection of DEGs using the p-value returned by a Welch t-test
#  ttest.DEGs <- DiffGenes(ExpressionSet = tf(PhyloExpressionSetExample[1:5,1:8],log2),
#                          nrep          = 2,
#                          method        = "t.test",
#                          stage.names   = c("S1","S2","S3"))
#  
#  # look at the results
#  ttest.DEGs

## ----eval=FALSE---------------------------------------------------------------
#  data("PhyloExpressionSetExample")
#  
#  # Detection of DEGs using the p-value returned by a Welch t-test
#  # and furthermore, adjust p-values for multiple comparison
#  # using the Benjamini & Hochberg (1995) method: method = "BH"
#  ttest.DEGs.p_adjust <- DiffGenes(ExpressionSet   = tf(PhyloExpressionSetExample[1:5,1:8],log2),
#                                   nrep            = 2,
#                                   method          = "t.test",
#                                   p.adjust.method = "BH",
#                                   stage.names     = c("S1","S2","S3"))
#  
#  
#  ttest.DEGs.p_adjust

## ----eval=FALSE---------------------------------------------------------------
#  # Detection of DEGs using the p-value returned by a Welch t-test
#  # and furthermore, adjust p-values for multiple comparison
#  # using the Benjamini & Hochberg (1995) method: method = "BH"
#  # and filter for significantly differentially expressed genes (alpha = 0.05)
#  ttest.DEGs.p_adjust.filtered <- DiffGenes(ExpressionSet   = tf(PhyloExpressionSetExample[1:10 ,1:8],log2),
#                                            nrep            = 2,
#                                            method          = "t.test",
#                                            p.adjust.method = "BH",
#                                            stage.names     = c("S1","S2","S3"),
#                                            comparison      = "above",
#                                            alpha           = 0.05,
#                                            filter.method   = "n-set",
#                                            n               = 1)
#  
#  # look at the genes fulfilling the filter criteria
#  ttest.DEGs.p_adjust.filtered

## ----eval = FALSE-------------------------------------------------------------
#  
#  ttest.DEGs.p_adjust <- DiffGenes(ExpressionSet   = tf(PhyloExpressionSetExample[1:500,1:8],log2),
#                                   nrep            = 2,
#                                   method          = "t.test",
#                                   p.adjust.method = "BH",
#                                   stage.names     = c("S1","S2","S3"))
#  
#  
#  head(ttest.DEGs.p_adjust[order(ttest.DEGs.p_adjust[ , "S1<->S2"], decreasing = FALSE) , 1:3])

## ----eval=FALSE---------------------------------------------------------------
#  data("PhyloExpressionSetExample")
#  
#  # Detection of DEGs using the p-value returned by a Wilcoxon-Mann-Whitney test
#  Wilcox.DEGs <- DiffGenes(ExpressionSet = PhyloExpressionSetExample[1:5,1:8],
#                          nrep          = 2,
#                          method        = "wilcox.test",
#                          stage.names   = c("S1","S2","S3"))
#  
#  # look at the results
#  Wilcox.DEGs

## ----eval=FALSE---------------------------------------------------------------
#  data("PhyloExpressionSetExample")
#  
#  # Detection of DEGs using the p-value returned by a Wilcoxon-Mann-Whitney test
#  # and furthermore, adjust p-values for multiple comparison
#  # using the Benjamini & Hochberg (1995) method: method = "BH"
#  # and filter for significantly differentially expressed genes (alpha = 0.05)
#  Wilcox.DEGs.adj <- DiffGenes(ExpressionSet  = PhyloExpressionSetExample[1:5,1:8],
#                              nrep            = 2,
#                              method          = "wilcox.test",
#                              stage.names     = c("S1","S2","S3"),
#                              p.adjust.method = "BH")
#  
#  # look at the results
#  Wilcox.DEGs.adj

## ----eval=FALSE---------------------------------------------------------------
#  # install edgeR
#  source("http://bioconductor.org/biocLite.R")
#  biocLite("edgeR")

## ----eval=FALSE---------------------------------------------------------------
#  data("PhyloExpressionSetExample")
#  
#  # Detection of DEGs using the p-value returned by the Double Tail Method
#  DoubleTail.DEGs <- DiffGenes(ExpressionSet = PhyloExpressionSetExample[1:5,1:8],
#                          nrep          = 2,
#                          method        = "doubletail",
#                          lib.size      = 1000,
#                          stage.names   = c("S1","S2","S3"))
#  
#  # look at the results
#  DoubleTail.DEGs

## ----eval=FALSE---------------------------------------------------------------
#  data("PhyloExpressionSetExample")
#  
#  # Detection of DEGs using the p-value returned by the Double Tail Method
#  # and furthermore, adjust p-values for multiple comparison
#  # using the Benjamini & Hochberg (1995) method: method = "BH"
#  # and filter for significantly differentially expressed genes (alpha = 0.05)
#  DoubleTail.DEGs.adj <- DiffGenes(ExpressionSet  = PhyloExpressionSetExample[1:5,1:8],
#                                  nrep            = 2,
#                                  method          = "doubletail",
#                                  lib.size        = 1000,
#                                  stage.names     = c("S1","S2","S3"),
#                                  p.adjust.method = "BH")
#  
#  # look at the results
#  DoubleTail.DEGs.adj

## ----eval=FALSE---------------------------------------------------------------
#  data("PhyloExpressionSetExample")
#  
#  # Detection of DEGs using the p-value returned by the Small-P Method
#  SmallP.DEGs <- DiffGenes(ExpressionSet = PhyloExpressionSetExample[1:5,1:8],
#                          nrep          = 2,
#                          method        = "smallp",
#                          lib.size      = 1000,
#                          stage.names   = c("S1","S2","S3"))
#  
#  # look at the results
#  SmallP.DEGs

## ----eval=FALSE---------------------------------------------------------------
#  data("PhyloExpressionSetExample")
#  
#  # Detection of DEGs using the p-value returned by the Small-P Method
#  # and furthermore, adjust p-values for multiple comparison
#  # using the Benjamini & Hochberg (1995) method: method = "BH"
#  # and filter for significantly differentially expressed genes (alpha = 0.05)
#  SmallP.DEGs.adj <- DiffGenes(ExpressionSet  = PhyloExpressionSetExample[1:5,1:8],
#                                  nrep            = 2,
#                                  method          = "smallp",
#                                  lib.size        = 1000,
#                                  stage.names     = c("S1","S2","S3"),
#                                  p.adjust.method = "BH")
#  
#  # look at the results
#  SmallP.DEGs.adj

## ----eval=FALSE---------------------------------------------------------------
#  data("PhyloExpressionSetExample")
#  
#  # Detection of DEGs using the p-value returned by the Deviance
#  Deviance.DEGs <- DiffGenes(ExpressionSet = PhyloExpressionSetExample[1:5,1:8],
#                          nrep          = 2,
#                          method        = "deviance",
#                          lib.size      = 1000,
#                          stage.names   = c("S1","S2","S3"))
#  
#  # look at the results
#  Deviance.DEGs

## ----eval=FALSE---------------------------------------------------------------
#  data("PhyloExpressionSetExample")
#  
#  # Detection of DEGs using the p-value returned by the Deviance Method
#  # and furthermore, adjust p-values for multiple comparison
#  # using the Benjamini & Hochberg (1995) method: method = "BH"
#  # and filter for significantly differentially expressed genes (alpha = 0.05)
#  Deviance.DEGs.adj <- DiffGenes(ExpressionSet    = PhyloExpressionSetExample[1:5,1:8],
#                                  nrep            = 2,
#                                  method          = "deviance",
#                                  lib.size        = 1000,
#                                  stage.names     = c("S1","S2","S3"),
#                                  p.adjust.method = "BH")
#  
#  # look at the results
#  Deviance.DEGs.adj

## ----eval=FALSE---------------------------------------------------------------
#  data(PhyloExpressionSetExample)
#  
#  # visualize the sd() between replicates
#  PlotReplicateQuality(ExpressionSet = PhyloExpressionSetExample[ , 1:8],
#                       nrep          = 2,
#                       legend.pos   = "topright",
#                       ylim          = c(0,0.2),
#                       lwd           = 6)
#  

## ----eval=FALSE---------------------------------------------------------------
#  data(PhyloExpressionSetExample)
#  
#  # visualize the mad() between replicates
#  PlotReplicateQuality(ExpressionSet = PhyloExpressionSetExample[ , 1:8],
#                       nrep          = 2,
#                       FUN           = mad,
#                       legend.pos    = "topright",
#                       ylim          = c(0,0.015),
#                       lwd           = 6)
#  

## ----eval=FALSE---------------------------------------------------------------
#  library(myTAI)
#  
#  # load example data
#  data(PhyloExpressionSetExample)
#  
#  # generate an example PhyloExpressionSet with replicates
#  ExampleReplicateExpressionSet <- PhyloExpressionSetExample[ ,1:8]
#  
#  # rename stages
#  names(ExampleReplicateExpressionSet)[3:8] <- c("Stage_1_Repl_1","Stage_1_Repl_2",
#                                                 "Stage_2_Repl_1","Stage_2_Repl_2",
#                                                 "Stage_3_Repl_1","Stage_3_Repl_2")
#  # have a look at the example dataset
#  head(ExampleReplicateExpressionSet, 5)

## ----eval=FALSE---------------------------------------------------------------
#  # visualize the TAI profile over 3 stages of development
#  # and 2 replicates per stage
#  PlotPattern(ExpressionSet = ExampleReplicateExpressionSet,
#              type          = "l",
#              lwd           = 6)
#  

## ----eval=FALSE---------------------------------------------------------------
#  # combine the expression levels of the 2 replicates (const) per stage
#  # using geom.mean as window function and rename new stages to: "S1","S2","S3"
#  CollapssedPhyloExpressionSet <- CollapseReplicates(
#                                         ExpressionSet = ExampleReplicateExpressionSet,
#                                         nrep          = 2,
#                                         FUN           = geom.mean,
#                                         stage.names   = c("S1","S2","S3"))
#  
#  # have a look at the collapsed PhyloExpressionSet
#  head(CollapssedPhyloExpressionSet)
#  

## ----eval = FALSE-------------------------------------------------------------
#  # check number of genes in PhyloExpressionSetExample
#  nrow(PhyloExpressionSetExample)
#  #> [1] 25260
#  
#  # remove genes that have an expression level below 8000
#  # in at least one developmental stage
#  FilterConst <- Expressed(ExpressionSet = PhyloExpressionSetExample,
#                           cut.off       = 8000,
#                           comparison    = "below",
#                           method        = "const")
#  
#  nrow(FilterConst) # check number of retained genes
#  #> [1] 449

## ----eval = FALSE-------------------------------------------------------------
#  # again: check number of genes in PhyloExpressionSetExample
#  nrow(PhyloExpressionSetExample)
#  #> [1] 25260
#  
#  # remove genes that have an expression level above 12000
#  # in at least one developmental stage (outlier removal)
#  FilterConst.above <- Expressed(ExpressionSet = PhyloExpressionSetExample,
#                                 cut.off       = 12000,
#                                 comparison    = "above",
#                                 method        = "const")
#  
#  nrow(FilterConst.above) # check number of retained genes
#  #> [1] 23547

## ----eval = FALSE-------------------------------------------------------------
#  # again: check number of genes in PhyloExpressionSetExample
#  nrow(PhyloExpressionSetExample)
#  #> [1] 25260
#  
#  # remove genes that have an expression level below 8000 AND above 12000
#  # in at least one developmental stage (non-expressed genes AND outlier removal)
#  FilterConst.both <-  Expressed(ExpressionSet = PhyloExpressionSetExample,
#                                 cut.off       = c(8000,12000),
#                                 comparison    = "both",
#                                 method        = "const")
#  
#  nrow(FilterConst.both) # check number of retained genes
#  #> [1] 2

## ----eval = FALSE-------------------------------------------------------------
#  # remove genes that have an expression level below 8000
#  # in at least 5 developmental stages (in this case: n = 2 stages fulfilling the criteria)
#  FilterNSet <- Expressed(ExpressionSet = PhyloExpressionSetExample,
#                          cut.off       = 8000,
#                          method        = "n-set",
#                          comparison    = "below",
#                          n             = 2)
#  
#  nrow(FilterMinSet) # check number of retained genes
#  #> [1] 20

## ----eval=FALSE---------------------------------------------------------------
#  # load a standard PhyloExpressionSet
#  data(PhyloExpressionSetExample)
#  
#  # we assume that the PhyloExpressionSetExample
#  # consists of 3 developmental stages
#  # and 2 replicates for stage 1, 3 replicates for stage 2,
#  # and 2 replicates for stage 3
#  # FOR REAL ANALYSES PLEASE USE: permutations = 1000 or 10000
#  # BUT NOTE THAT THIS TAKES MUCH MORE COMPUTATION TIME
#  p.vector <- CombinatorialSignificance(ExpressionSet = PhyloExpressionSetExample,
#                                        replicates    = c(2,3,2),
#                                        TestStatistic = "FlatLineTest",
#                                        permutations  = 100,
#                                        parallel      = FALSE)

## ----eval = FALSE-------------------------------------------------------------
#  any(p.vector > 0.05)
#  #> FALSE

