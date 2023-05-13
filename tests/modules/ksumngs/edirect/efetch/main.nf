#!/usr/bin/env nextflow

nextflow.enable.dsl = 2

include { EDIRECT_EFETCH } from '../../../../../modules/ksumngs/edirect/efetch/main.nf'
include { EDIRECT_ESEARCH } from '../../../../../modules/ksumngs/edirect/esearch/main.nf'

workflow test_edirect_efetch {

    input = [
        [ id: 'test' ],
        'NC_045512.2'
    ]

    EDIRECT_ESEARCH ( input, 'nucleotide' )

    EDIRECT_EFETCH ( EDIRECT_ESEARCH.out.xml, 'gb', 'xml' )
}
