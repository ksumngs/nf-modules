#!/usr/bin/env nextflow

nextflow.enable.dsl = 2

include { EDIRECT_ESEARCH } from '../../../../modules/ksumngs/edirect/esearch/main.nf'

workflow test_edirect_esearch {

    input = [
        [ id: 'test' ],
        'NC_045512.2'
    ]

    EDIRECT_ESEARCH ( input, 'nucleotide' )
}
