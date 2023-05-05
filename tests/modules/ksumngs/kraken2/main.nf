#!/usr/bin/env nextflow

nextflow.enable.dsl = 2

include { UNTAR } from '../../../modules/untar/main.nf'
include { KRAKEN2 } from '../../../modules/kraken2/main.nf'

workflow test_kraken2 {

    input = [ [ id:'test', single_end:false ], // meta map
              [ file(params.test_data['sarscov2']['illumina']['test_1_fastq_gz'], checkIfExists: true),
                file(params.test_data['sarscov2']['illumina']['test_2_fastq_gz'], checkIfExists: true) ]
            ]
    db    = file(params.test_data['sarscov2']['genome']['kraken2_tar_gz'], checkIfExists: true)

    UNTAR ( db )
    KRAKEN2 ( input, UNTAR.out.untar )
}
