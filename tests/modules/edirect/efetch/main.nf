#!/usr/bin/env nextflow

nextflow.enable.dsl = 2

include { EDIRECT_EFETCH } from '../../../../modules/edirect/efetch/main.nf'
include { EDIRECT_ESEARCH } from '../../../../modules/edirect/esearch/main.nf'

workflow test_edirect_efetch {

    EDIRECT_ESEARCH ( 'NC_045512.2', 'nucleotide' )

    EDIRECT_EFETCH ( EDIRECT_ESEARCH.out.xml, 'gb', 'xml' )
}
