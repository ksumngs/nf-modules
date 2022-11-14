#!/usr/bin/env nextflow

nextflow.enable.dsl = 2

include { NANOSTAT } from '../../../modules/ksumngs/nanostat/main.nf'

workflow test_nanostat_fastq {

    input = [
        [ id:'test', single_end:false ], // meta map
        file(params.test_data['sarscov2']['nanopore']['test_fastq_gz'], checkIfExists: true)
    ]

    NANOSTAT ( input )
}

workflow test_nanostat_summary {

    input = [
        [ id:'test', single_end:false ], // meta map
        file(params.test_data['sarscov2']['nanopore']['test_sequencing_summary'], checkIfExists: true)
    ]

    NANOSTAT ( input )
}
