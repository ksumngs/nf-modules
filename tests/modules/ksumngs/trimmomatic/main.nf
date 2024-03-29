#!/usr/bin/env nextflow

nextflow.enable.dsl = 2

include { TRIMMOMATIC } from '../../../../modules/ksumngs/trimmomatic/main.nf'

workflow test_trimmomatic_pe {

    input = [
        [ id:'test', single_end:false ], // meta map
        [
            file(params.test_data['sarscov2']['illumina']['test2_1_fastq_gz'], checkIfExists: true),
            file(params.test_data['sarscov2']['illumina']['test2_2_fastq_gz'], checkIfExists: true),
        ]
    ]

    TRIMMOMATIC ( input )
}

workflow test_trimmomatic_se {

    input = [
        [ id:'test', single_end:true ], // meta map
        [
            file(params.test_data['sarscov2']['illumina']['test_1_fastq_gz'], checkIfExists: true)
        ]
    ]

    TRIMMOMATIC ( input )
}
