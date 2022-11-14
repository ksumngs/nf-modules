#!/usr/bin/env nextflow

nextflow.enable.dsl = 2

include { RAXMLNG_SEARCH } from '../../../../modules/ksumngs/raxmlng/search/main.nf'

workflow test_raxmlng_search {

    input = file(params.test_data['sarscov2']['genome']['informative_sites_fas'], checkIfExists: true)

    RAXMLNG_SEARCH ( input )
}
