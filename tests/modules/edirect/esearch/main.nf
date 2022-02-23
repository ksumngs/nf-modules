#!/usr/bin/env nextflow

nextflow.enable.dsl = 2

include { EDIRECT_ESEARCH } from '../../../../modules/edirect/esearch/main.nf'

workflow test_edirect_esearch {
    EDIRECT_ESEARCH ( 'NC_045512.2', 'nucleotide' )
}
