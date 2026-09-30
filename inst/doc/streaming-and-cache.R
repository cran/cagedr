## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## -----------------------------------------------------------------------------
library(cagedr)
f <- system.file("extdata", "CAGEDMOV202301_sample.7z", package = "cagedr")

# Smaller chunks use less memory; the result is identical.
a <- caged_read(f, chunk_size = 5, verbose = FALSE)
b <- caged_read(f, verbose = FALSE)
identical(a, b)

## -----------------------------------------------------------------------------
str(caged_read(f, types = FALSE, columns = c("salario", "idade"), verbose = FALSE))

## -----------------------------------------------------------------------------
caged_cache_list()

## -----------------------------------------------------------------------------
exc <- caged_read(system.file("extdata", "CAGEDEXC202301_sample.7z", package = "cagedr"),
                  verbose = FALSE)
# Exclusion records point to the month they cancel, not to the archive month
table(archive = exc$caged_period, movement = exc$competenciamov)

