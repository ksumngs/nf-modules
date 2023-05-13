#!/usr/bin/env nextflow

nextflow.enable.dsl = 2

include { NANOFILT } from '../../../../modules/ksumngs/nanofilt/main.nf'

workflow test_nanofilt {

    input = [
        [ id:'test', single_end:false ], // meta map
        file(params.test_data['sarscov2']['nanopore']['test_fastq_gz'], checkIfExists: true)
    ]

    NANOFILT ( input )
}
