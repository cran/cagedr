## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----eval = FALSE-------------------------------------------------------------
# # From CRAN (when available):
# install.packages("cagedr")
# 
# # Development version:
# # remotes::install_github("StrategicProjects/cagedr")

## -----------------------------------------------------------------------------
library(cagedr)

f <- system.file("extdata", "CAGEDMOV202301_sample.7z", package = "cagedr")
x <- caged_read(f, verbose = FALSE)
x

## -----------------------------------------------------------------------------
caged_layout()[, c("column", "original", "type")]

## -----------------------------------------------------------------------------
pe <- caged_read(
  f,
  uf = 26,
  columns = c("competenciamov", "municipio", "secao", "saldomovimentacao", "salario"),
  verbose = FALSE
)
pe

## -----------------------------------------------------------------------------
caged_balance(x, by = "uf")

## ----eval = FALSE-------------------------------------------------------------
# # Which months are published?
# caged_available(year = 2026)
# 
# # Download the three files of one month into the cache
# caged_download(202607)
# 
# # Download and read in one go: Pernambuco, three months, three files
# pe <- caged_fetch(caged_periods(202605, 202607), uf = 26)
# 
# # Net balance by municipality and reference month
# caged_balance(pe, by = "municipio")

## ----eval = FALSE-------------------------------------------------------------
# Sys.setenv(CAGEDR_CACHE_DIR = "~/dados/caged")
# caged_cache_list()

