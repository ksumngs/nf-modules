#!/usr/bin/env nextflow

nextflow.enable.dsl = 2

include { RAXMLNG_BOOTSTRAP } from '../../../../modules/raxmlng/bootstrap/main.nf'
include { RAXMLNG_SEARCH } from '../../../../modules/raxmlng/search/main.nf'
include { RAXMLNG_SUPPORT } from '../../../../modules/raxmlng/support/main.nf'

workflow test_raxmlng_support {

    input = file(params.test_data['sarscov2']['genome']['informative_sites_fas'], checkIfExists: true)

    RAXMLNG_SEARCH ( input )
    RAXMLNG_BOOTSTRAP ( input )

    RAXMLNG_SUPPORT ( RAXMLNG_SEARCH.out.best_tree, RAXMLNG_BOOTSTRAP.out.bootstraps )
}
