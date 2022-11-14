#!/usr/bin/env nextflow

nextflow.enable.dsl = 2

include { RAXMLNG_PARSE } from '../../../../modules/ksumngs/raxmlng/parse/main.nf'

workflow test_raxmlng_parse {

    input = file(params.test_data['sarscov2']['genome']['informative_sites_fas'], checkIfExists: true)

    RAXMLNG_PARSE ( input )
}
