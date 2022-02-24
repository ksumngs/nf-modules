#!/usr/bin/env nextflow

nextflow.enable.dsl = 2

include { TRIMMOMATIC } from '../../../modules/trimmomatic/main.nf'

workflow test_trimmomatic {

    input = [
        [ id:'test', single_end:false ], // meta map
        [
            file(params.test_data['sarscov2']['illumina']['test2_1_fastq_gz'], checkIfExists: true),
            file(params.test_data['sarscov2']['illumina']['test2_2_fastq_gz'], checkIfExists: true),
        ]
    ]

    TRIMMOMATIC ( input )
}
