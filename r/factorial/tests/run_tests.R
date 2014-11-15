library('testthat')

source('factorial.R')

test_dir('tests', reporter = 'Summary')
