#!/usr/bin/env nextflow

nextflow.enable.dsl = 2

include { MINIMAP2_ALIGN } from '../../../../modules/minimap2/align/main.nf'

workflow test_minimap2_align {

    fasta = file(params.test_data['sarscov2']['genome']['genome_fasta'], checkIfExists: true)
    input = [ [ id:'test', single_end:false ], // meta map
              [ file(params.test_data['sarscov2']['illumina']['test_1_fastq_gz'], checkIfExists: true),
                file(params.test_data['sarscov2']['illumina']['test_2_fastq_gz'], checkIfExists: true) ],
              fasta
            ]

    MINIMAP2_ALIGN ( input )
}
