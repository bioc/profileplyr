% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/allMethods.R
\docType{methods}
\name{groupBy}
\alias{groupBy}
\alias{groupBy,profileplyr-method}
\title{group the rows and ranges of the profileplyr object}
\usage{
groupBy(
  object = "profileplyr",
  group = "ANY",
  GRanges_names = "character",
  levels = "ANY",
  include_nonoverlapping = "logical",
  separateDuplicated = "logical",
  inherit_groups = "logical"
)

\S4method{groupBy}{profileplyr}(
  object = "profileplyr",
  group = "ANY",
  GRanges_names = NULL,
  levels = NULL,
  include_nonoverlapping = FALSE,
  separateDuplicated = TRUE,
  inherit_groups = FALSE
)
}
\arguments{
\item{object}{A profileplyr object}

\item{group}{How the ranges will be grouped. If this is a character string, then it must match a column name of the range metadata, and this column will be used for grouping of any exported deepTools matrix. If this is a GRanges, or GRangesList, then the ranges will be subset based on overlap with these GRanges. If this is a list, each element should contain ether 1) a character vector of genes, and ranges will be subset based on overlap with these genes, as determined by the annotations made by annotateRanges() or annotateRanges_great() functions, or 2) a data frame with the gene symbols as the rownames. Any additional columns of this dataframe will be added to the range metadata.}

\item{GRanges_names}{The names of the GRanges that were used for the "GRanges" argument. This will be used to label these groups in the construction of the resulting profileplyr object.}

\item{levels}{This will set the levels of the grouping column set by 'rowGroupsInUse' (if the grouping column is not a factor, it will be converted to one). If levels are not provided, they will remain unchanged if the grouping column was already a factor, or will use default leveling (e.g. alphabetical) if grouping column is not already a factor variable.}

\item{include_nonoverlapping}{A logical argument, if FALSE (default) the regions from the original deepTools matrix that do not overlap with the  user defined regions will be left out of the returned profileplyr object.}

\item{separateDuplicated}{A logical argument, if TRUE (default) then regions that overlap multiple inputs to 'GRanges' argument will be separated and made into their own group. All possible combinations of region overlaps will be tested, so it is not recommended to have more than 3 groups if this option is TRUE. If FALSE, then regions that overlap each individual 'GRanges' input will be in the output, and if one region overlaps multiple 'GRanges' inputs, then it will be duplicated in the output and will show up in the section for each group.}

\item{inherit_groups}{A logical whether that groups the exist in the profileplyr object in the 'object' argument should be included in the default grouping scheme for the output object of this function. The default is TRUE. If false, only the GRanges or gene list overlap annotation will be used for heatmap grouping.}
}
\value{
A profileplyr object
}
\description{
group the rows and ranges of the profileplyr object
}
\details{
Takes a SE object and groups rows
}
\section{Methods (by class)}{
\itemize{
\item \code{groupBy(profileplyr)}: group the rows and ranges of the profileplyr object

}}
\examples{

# group by gene list or list of data frames with genes as rownames
## not shown here but see vignette for grouping by gene lists

# group by GRanges

example <- system.file("extdata", "example_deepTools_MAT", package = "profileplyr") 
object <- import_deepToolsMat(example)
data("K27ac_GRlist_hind_liver_top5000") # load pre-made GRanges
K27ac_groupByGR <- groupBy(object, group = K27ac_GRlist_hind_liver_top5000)

# switch rowGroupsInUse

switchGroup <- groupBy(K27ac_groupByGR, group = "GR_overlap_names")
params(switchGroup)$rowGroupsInUse
}
