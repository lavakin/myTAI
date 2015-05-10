context("Test: EarlyConservationTest() ")

data(PhyloExpressionSetExample)

nonStandardExpressionSet <- PhyloExpressionSetExample[ , 2:9] 

test_that("is.ExpressionSet() throughs error when no ExpressionSet is entered to CombinatorialSignificance()",{
        expect_error(EarlyConservationTest(nonStandardExpressionSet,
                                           modules = list(early = 1:2, mid = 3:5, late = 6:7),
                                           permutations = 1000),"The present input object does not fulfill the ExpressionSet standard.")
})


test_that("p.value is computed..", {
        
        expect_true(EarlyConservationTest(PhyloExpressionSetExample,
                              modules = list(early = 1:2, mid = 3:5, late = 6:7),
                              permutations = 1000)$p.value > 0.9)
})


test_that("std.dev is computed..", {
        
        expect_true(length(EarlyConservationTest(PhyloExpressionSetExample,
                                          modules = list(early = 1:2, mid = 3:5, late = 6:7),
                                          permutations = 1000)$std.dev) == 7)
})


test_that("lillie.test is NA..", {
        
        expect_true(is.na(EarlyConservationTest(PhyloExpressionSetExample,
                                                 modules = list(early = 1:2, mid = 3:5, late = 6:7),
                                                 permutations = 1000)$lillie.test))
})

test_that("lillie.test is computed...",{
        
        expect_true(EarlyConservationTest(PhyloExpressionSetExample,
                                                modules = list(early = 1:2, mid = 3:5, late = 6:7),
                                                permutations = 1000, lillie.test = TRUE)$lillie.test %in% c(TRUE,FALSE))
        
})

test_that("error occurs when module selection does not match number of developmental stages..",{
        
        expect_error(EarlyConservationTest(PhyloExpressionSetExample,
                                           modules = list(early = 1:2, mid = 3:5, late = 6:8),
                                           permutations = 1000),"The number of stages classified into the three modules does not match the total number of stages stored in the given ExpressionSet.")
})


test_that("error occurs when modules aren't specified...",{
        
        expect_error(EarlyConservationTest(PhyloExpressionSetExample,
                                           permutations = 1000))
})

