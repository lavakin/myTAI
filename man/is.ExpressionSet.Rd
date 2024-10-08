% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/is.ExpressionSet.R
\name{is.ExpressionSet}
\alias{is.ExpressionSet}
\title{Test ExpressionSet Standard}
\usage{
is.ExpressionSet(ExpressionSet)
}
\arguments{
\item{ExpressionSet}{a standard PhyloExpressionSet or DivergenceExpressionSet that shall be tested for format validity.}
}
\description{
This function tests whether a given ExpressionSet follows the pre-defined PhyloExpressionSet or DivergenceExpressionSet standard.
}
\examples{

# read example PhyloExpressionSet
data(PhyloExpressionSetExample)

is.ExpressionSet(PhyloExpressionSetExample)
}
\author{
Hajk-Georg Drost
}
\keyword{internal}
