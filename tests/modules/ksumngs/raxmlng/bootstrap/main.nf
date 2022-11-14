#!/usr/bin/env nextflow

nextflow.enable.dsl = 2

include { RAXMLNG_BOOTSTRAP } from '../../../../modules/ksumngs/raxmlng/bootstrap/main.nf'

workflow test_raxmlng_bootstrap {

    input = file(params.test_data['sarscov2']['genome']['informative_sites_fas'], checkIfExists: true)

    RAXMLNG_BOOTSTRAP ( input )
}
